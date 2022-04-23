//library heart_bpm;

// ignore_for_file: avoid_print

import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'var.dart' as globals;
//import 'package:stats/stats.dart';
import 'package:collection/collection.dart';


int currentValue = 0;
int currentValueHRV = 0;
/// Class to store one sample data point
class SensorValue {

  /// timestamp of datapoint
  final DateTime time;

  /// value of datapoint
  final num value;

  SensorValue({required this.time, required this.value});

  /// Returns JSON mapped data point
  Map<String, dynamic> toJSON() => {'time': time, 'value': value};

  /// Map a list of data samples to a JSON formatted array.
  ///
  /// Map a list of [data] samples to a JSON formatted array. This is
  /// particularly useful to store [data] to database.
  static List<Map<String, dynamic>> toJSONArray(List<SensorValue> data) =>
      List.generate(data.length, (index) => data[index].toJSON());
}

/// Obtains heart beats per minute using camera sensor
///
/// Using the smartphone camera, the widget estimates the skin tone variations
/// over time. These variations are due to the blood flow in the arteries
/// present below the skin of the fingertips.
// ignore: must_be_immutable
class HeartBPMDialog extends StatefulWidget {
  
  /// Callback used to notify the caller of updated BPM measurement
  ///
  /// Should be non-blocking as it can affect
  final void Function(int) onBPM;

  /// Callback used to notify the caller of updated raw data sample
  ///
  /// Should be non-blocking as it can affect
  final void Function(SensorValue) onRawData;

  /// Camera sampling rate in milliseconds
  final int sampleDelay;

  /// Parent context
  final BuildContext context;

  /// Smoothing factor
  ///
  /// Factor used to compute exponential moving average of the realtime data
  /// using the formula:
  /// ```
  /// $y_n = alpha * x_n + (1 - alpha) * y_{n-1}$
  /// ```
  double alpha = 0.6;

  /// Additional child widget to display
  //final Widget child;
  late Widget child;

  /// Obtains heart beats per minute using camera sensor
  ///
  /// Using the smartphone camera, the widget estimates the skin tone variations
  /// over time. These variations are due to the blood flow in the arteries
  /// present below the skin of the fingertips.
  ///
  /// This is a [Dialog] widget and hence needs to be displayer using [showDialog]
  /// function. For example:
  /// ```
  /// await showDialog(
  ///   context: context,
  ///   builder: (context) => HeartBPMDialog(
  ///     onData: (value) => print(value),
  ///   ),
  /// );
  /// ```
   HeartBPMDialog({
    //Key key,
    required this.context,
    this.sampleDelay = 2000 ~/ 30,
    required this.onBPM,
    required this.onRawData,
    this.alpha = 0.8,
    required this.child,
  });

  /// Set the smoothing factor for exponential averaging
  ///
  /// the scaling factor [alpha] is used to compute exponential moving average of the
  /// realtime data using the formula:
  /// ```
  /// $y_n = alpha * x_n + (1 - alpha) * y_{n-1}$
  /// ```
  void setAlpha(double a) {
    if (a <= 0)
      throw Exception(
          "$HeartBPMDialog: smoothing factor cannot be 0 or negative");
    if (a > 1)
      throw Exception(
          "$HeartBPMDialog: smoothing factor cannot be greater than 1");
    alpha = a;
  }

  @override
  _HeartBPPView createState() => _HeartBPPView();
}

class _HeartBPPView extends State<HeartBPMDialog> {
  /// Camera controller
  
  late CameraController _controller;

  /// Used to set sampling rate
  bool _processing = false;

  /// Current value
  //int currentValue = 0;

  /// to ensure camara was initialized
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  @override
  void dispose() {
    _deinitController();
    super.dispose();
  }

  /// Deinitialize the camera controller
  void _deinitController() async {
    isCameraInitialized = false;
    if (_controller == null) return;
    // await _controller.stopImageStream();
    await _controller.dispose();
    // while (_processing) {}
    // _controller = null;
  }

  /// Initialize the camera controller
  ///
  /// Function to initialize the camera controller and start data collection.
  Future<void> _initController() async {
    //if (_controller != null) return;
    try {
      // 1. get list of all available cameras
      List<CameraDescription> _cameras = await availableCameras();
      // 2. assign the preferred camera with low resolution and disable audio
      _controller = CameraController(_cameras.first, ResolutionPreset.low,
          enableAudio: false, imageFormatGroup: ImageFormatGroup.yuv420);

      // 3. initialize the camera
      await _controller.initialize();

      // 4. set torch to ON and start image stream
      Future.delayed(Duration(milliseconds: 500))
          .then((value) => _controller.setFlashMode(FlashMode.torch));

      // 5. register image streaming callback
      _controller.startImageStream((image) {
        if (!_processing && mounted) {
          _processing = true;
          _scanImage(image);
        }
      });

      setState(() {
        isCameraInitialized = true;
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static const int windowLength = 50;
  final List<SensorValue> measureWindow = List<SensorValue>.filled(
      windowLength, SensorValue(time: DateTime.now(), value: 0),
      growable: true);

  void _scanImage(CameraImage image) async {
    // make system busy
    // setState(() {
    //   _processing = true;
    // });

    // get the average value of the image
     globals.avg =
        image.planes.first.bytes.reduce((value, element) => value + element) /
            image.planes.first.bytes.length;
    
    //print("HELLO " + globals.avg.toString());
    
    

    measureWindow.removeAt(0);
    measureWindow.add(SensorValue(time: DateTime.now(), value: globals.avg));

    _smoothBPM(globals.avg).then((value) {
      widget.onRawData(
        // call the provided function with the new data sample
        SensorValue(
          time: DateTime.now(),
          value: globals.avg,
        ),
      );

      Future<void>.delayed(Duration(milliseconds: widget.sampleDelay))
          .then((onValue) {
        if (mounted)
          setState(() {
            _processing = false;
          });
      });
    });
  }

  /// Smooth the raw measurements using Exponential averaging
  /// the scaling factor [alpha] is used to compute exponential moving average of the
  /// realtime data using the formula:
  /// ```
  /// $y_n = alpha * x_n + (1 - alpha) * y_{n-1}$
  /// ```
  Future<int> _smoothBPM(double newValue) async {
    double maxVal = 0;
     globals.avg = 0;

    measureWindow.forEach((element) {
      globals.avg += element.value / measureWindow.length;
      if (element.value > maxVal) maxVal =  element.value.toDouble();
    });

    //int size = measureWindow.length;

    double _threshold = (maxVal + globals.avg) / 2;
    int _counter = 0, previousTimestamp = 0;
    double _tempBPM = 0;
    // ignore: deprecated_member_use
    //List<double> timeElapsed = <double>[];
    var list = List.empty(growable: true);
    list.clear();
    //var timeElapsed = new List()
    //timeElapsed.length = size;

    for (int i = 1; i < measureWindow.length; i++) {
      // find rising edge
      if (measureWindow[i - 1].value < _threshold &&
          measureWindow[i].value > _threshold) {
        if (previousTimestamp != 0) {
          _counter++;
          _tempBPM += 60000 /
              (measureWindow[i].time.millisecondsSinceEpoch -
                  previousTimestamp); // convert to per minute
          globals.temp = _tempBPM; 
          list.add(measureWindow[i].time.millisecondsSinceEpoch - previousTimestamp);
          double sum = 0;
          double std = 0;
          list.forEach((element) => sum+=element);
          double mean = sum/list.length;
          list.forEach((element) => std += pow(element - mean, 2));
          
          double square = std/list.length;
          globals.hrv = sqrt(square);
        }
        //print("HELLO: " + globals.hrv.toString());
        previousTimestamp = measureWindow[i].time.millisecondsSinceEpoch;
      }
    }

    if (_counter > 0) {
      _tempBPM /= _counter;
      globals.hrv /= _counter;
      _tempBPM = (1 - widget.alpha) * currentValue + widget.alpha * _tempBPM;
      globals.hrv = (1 - widget.alpha) * currentValueHRV + widget.alpha * globals.hrv;
      setState(() {
        currentValue = _tempBPM.toInt();
        currentValueHRV = globals.hrv.toInt();
        print("HELLO: " + currentValueHRV.toString());
        // _bpm = _tempBPM;
      });
      widget.onBPM(currentValue);
    }

    // double newOut = widget.alpha * newValue + (1 - widget.alpha) * _pastBPM;
    // _pastBPM = newOut;
    // ignore: avoid_print
    //print("HRV: " + currentValueHRV.toString());
    return currentValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isCameraInitialized
          ? Column(
              children: [
                Container(
                  constraints: BoxConstraints.tightFor(width: 100, height: 130),
                  child: _controller.buildPreview(),
                ),
                Text(currentValue.toStringAsFixed(0)),
                widget.child == null ? SizedBox() : widget.child,
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
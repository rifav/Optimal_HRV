// ignore_for_file: unnecessary_import,, always_use_package_imports,,, prefer_if_elements_to_conditional_expressions, prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_single_quotes, type_annotate_public_apis, always_declare_return_types, sized_box_for_whitespace, lines_longer_than_80_chars, use_key_in_widget_constructors, sort_constructors_first, avoid_void_async, omit_local_variable_types, prefer_final_locals

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optimal_hrv_bloc/app/bloc/app_bloc.dart';

import 'package:optimal_hrv_bloc/home/view/menu.dart';
import 'package:optimal_hrv_bloc/theme.dart';

import 'heart_bpm.dart';

// Class sets up page for opening the camera
class CameraAppTest extends StatelessWidget {
  const CameraAppTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('PPG Reader'),
        automaticallyImplyLeading: false,
        backgroundColor: theme.primaryColor,
      ),
      body: Container(
        //width: 200,
        alignment: Alignment.center,
        // margin: EdgeInsets.all(24),
        // padding: EdgeInsets.all(24),
        //decoration: BoxDecoration(),
        // decoration: ,
        child: const OpenCamera(),
      ),
    );
  }
}

class PPGPage extends StatefulWidget {
  final dynamic color;
  final dynamic size;
  const PPGPage({this.color, this.size});

  @override
  PPGPageView createState() => PPGPageView();
}

int _bpm = 0;

void postDetailsToFirestore() async {
  // //calling firestore
  // //calling user model
  // //sending these values
  final _auth = firebase_auth.FirebaseAuth.instance;
  // // ignore: omit_local_variable_types
  // final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final userModel = _auth.currentUser;

  // const userReading = User;

  // userReading.id = user!.id;
  // userReading.email = user.email;
  // userReading.value = _bpm.toInt();

  // await firebaseFirestore
  //     .collection('users')
  //     .doc(user.id)
  //     .set(userReading.toMap());

  Map<String, dynamic> data = <String, dynamic>{
    'uid': userModel!.uid,
    'email': userModel.email,
    'value': _bpm.toInt(),
  };
  await FirebaseFirestore.instance.collection("readings").add(data);
}

class PPGPageView extends State<PPGPage> {
  List<SensorValue> data = [];
  //  Widget chart = BPMChart(data);

  bool isBPMEnabled = false;
  late Widget dialog;

  int _counter = 10;
  Timer? _timer;
  // _bpm;
  //int _bpm = 0;

  void _startTimer() {
    // isBPMEnabled = true;
    _counter = 10;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
          isBPMEnabled = true;
          _bpm = currentValue;
        } else {
          _bpm = currentValue;
          _timer!.cancel();
          isBPMEnabled = false;
          postDetailsToFirestore();
          Navigator.push<void>(
              context,
              MaterialPageRoute(
                  builder: (context) => Menu())); // go back to main PPG: page1
        }
      });
    });
    //isBPMEnabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('PPG Reader'),
      ),*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isBPMEnabled
              ? dialog = HeartBPMDialog(
                  context: context,
                  onRawData: (value) {
                    setState(() {
                      if (data.length == 100) data.removeAt(0);
                      data.add(value);
                    });
                  },
                  onBPM: (value) {},
                  child: const Text('Keep finger on the camera'),
                )
              : SizedBox(),
          isBPMEnabled
              ? Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      (_counter > 0)
                          ? Text('')
                          : Text(
                              //currentValue.toString(),
                              'BPM: ' + _bpm.toString(),
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                              ),
                            ),
                      Text(
                        'Time left (sec): $_counter',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ), // BPMChart(data),
                )
              : SizedBox(),
          Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton.icon(
              icon: Icon(Icons.favorite_border_rounded),
              label: Text(isBPMEnabled ? 'Stop' : 'Start Measurement'),
              onPressed: () => setState(() {
                if (isBPMEnabled) {
                  if (_counter != 0) {
                    _counter = 0;
                  }
                  isBPMEnabled = false;
                  Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Menu())); // go back to main PPG: page1
                } else {
                  isBPMEnabled = true;
                  _startTimer();
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}

// Contains page that displays camera preview and button to go back/exit to Page1 (PPG reader page)
class OpenCamera extends StatelessWidget {
  const OpenCamera({Key? key}) : super(key: key);
  @override
  build(context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 500,
              height: 500,
              child: PPGPage(), // camera controller w/ camera preview
            ),
          ),
          // ),
          // Square(),
          //const StopCameraButton() // button to close camera preview
        ],
      ),
    );
  }
}

// Button to go back to page 1 if user does not want to take PPG reading
/*class StopCameraButton extends StatelessWidget {
  const StopCameraButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child:
      OutlinedButton(
        onPressed: () {
          //controller.setFlashMode(FlashMode.off); // turn off Camera
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Menu())); // go back to main PPG: page1
        },
        child: const Text('Stop Camera'),
      )
    );
  }
}*/

// -------------------------------------------------- Initial code: Main page for PPG Reader
class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dashboard'),
        backgroundColor: theme.primaryColor,
        /*actions: [
          IconButton(
            icon: const Icon(
              Icons.add_circle_rounded,
              color: Colors.white,
            ), // top right button (+)
            onPressed: () {
              Navigator.of(
                      context) // when button is pressed -> open camera (goes to CameraAppTest class)
                  .push<void>(MaterialPageRoute(
                      builder: (context) => const CameraAppTest()));
            },
          )
        ],*/
        // Logout iconButton
        actions: [
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
          )
        ],

        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.of(
                  context) // when button is pressed -> open camera (goes to CameraAppTest class)
              .push<void>(MaterialPageRoute(
                  builder: (context) => const CameraAppTest()));
        },
        label: const Text('New Reading', style: TextStyle(color: Colors.white)),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: theme.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              //color: Colors.red[100],
              border: Border.all(color: Colors.grey),
            ),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 10),
/*            child: const Align(
              alignment: FractionalOffset(0.5, 0.09),
              child: Text('Your HRV Score', style: TextStyle(fontSize: 22),),
            ),*/
            child: Column(
              children: [
                Align(
                  alignment: FractionalOffset(0.5, 0.2),
                  child: Text(
                    'Latest Reading: ' + _bpm.toString(),
                    style: TextStyle(fontSize: 22),
                  ), // display text HRV score
                ),
                Icon(
                  Icons.favorite, size: 50,
                  color: Colors.lightGreen[300], // display green heart
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: const Text('Tap the + to read your heart rate variability.'),
          )
          // BorderRadius.all(Radius.circular(20))
        ],
      ),
    );
  }
}

//Initial code for base for ppg reader
//Functionality: turns camera on and off, creates pages

/*import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hrv_app/main.dart';
import 'menu.dart';
// variables for Camera:
List<CameraDescription> cameras = [];
late CameraController controller;
// Class sets up page for opening the camera
class CameraAppTest extends StatelessWidget {
  const CameraAppTest({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('PPG Reader'),
        automaticallyImplyLeading: false,
        backgroundColor: MyApp.primaryColor,
      ),
      body: Container(
         //width: 200,
        alignment: Alignment.center,
        // margin: EdgeInsets.all(24),
        // padding: EdgeInsets.all(24),
        //decoration: BoxDecoration(),
        // decoration: ,
        child: const OpenCamera(),
      ),
    );
  }
}
class PPGPage extends StatefulWidget {
  final color;
  final size;
  const PPGPage({this.color, this.size});
  @override
  PPGPageView createState() => PPGPageView();
}
class PPGPageView extends State<PPGPage> { // camera controller
  late CameraImage _image; // store the last camera image
  late Timer _timer; // timer for image processing
  @override
  void initState() {
    super.initState();
    cameras[0];
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    Future.delayed(Duration(milliseconds: 100)).then((onValue) {
      controller!.setFlashMode(FlashMode.torch); // turn on flash
    });
    controller!.startImageStream((CameraImage image) {
      _image = image;
    });
    controller.initialize().then((_) {
      if (!mounted) {
        return ;
      }
      setState(() {});
    });
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container(
      );
    }
    return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller));
  }
  void scanImage(CameraImage image) // part of image scanning and storing images
  {
  }
}
// Contains page that displays camera preview and button to go back/exit to Page1 (PPG reader page)
class OpenCamera extends StatelessWidget {
  const OpenCamera({Key? key}) : super(key: key);
  @override
  build(context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
              child: Container(
                width: 500,
                height: 500,
                child: PPGPage(), // camera controller w/ camera preview
              ),
            ),
         // ),
          // Square(),
          const StopCameraButton() // button to close camera preview
        ],
      ),
    );
  }
}
// Button to go back to page 1 if user does not want to take PPG reading
class StopCameraButton extends StatelessWidget {
  const StopCameraButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child:
      OutlinedButton(
        onPressed: () {
          controller.setFlashMode(FlashMode.off); // turn off Camera
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Menu())); // go back to main PPG: page1
        },
        child: const Text('Stop Camera'),
      )
    );
  }
}
// -------------------------------------------------- Initial code: Main page for PPG Reader
class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dashboard'),
        backgroundColor: MyApp.primaryColor,
        actions: [
          IconButton(icon: const Icon(Icons.add_circle_rounded, color: Colors.white,), // top right button (+)
            onPressed: () { Navigator.of(context) // when button is pressed -> open camera (goes to CameraAppTest class)
                .push(MaterialPageRoute(builder: (context) => const CameraAppTest()));},
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              //color: Colors.red[100],
              border: Border.all(color: Colors.grey),
            ),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 10.0),
/*            child: const Align(
              alignment: FractionalOffset(0.5, 0.09),
              child: Text('Your HRV Score', style: TextStyle(fontSize: 22),),
            ),*/
          child: Column(
            children:  [
              const Align(
                alignment: FractionalOffset(0.5, 0.2),
                child: Text('Your HRV Score', style: TextStyle(fontSize: 22),), // display text HRV score
              ),
              Icon(
                Icons.favorite, size: 50, color: Colors.lightGreen[300], // display green heart
              )
            ],
          ) ,
          ),
         Container(
           margin: const EdgeInsets.only(top: 10.0),
           child: const Text('Tap the + to read your heart rate variability.'),
         )
         // BorderRadius.all(Radius.circular(20))
        ],
      ),
    );
  }
}*/

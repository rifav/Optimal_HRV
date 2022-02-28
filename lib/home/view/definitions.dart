// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:optimal_hrv_bloc/theme.dart';
import 'package:accordion/accordion.dart';

class Definitions extends StatelessWidget {
  final _headerStyle = TextStyle(
      color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Data'),
        backgroundColor: theme.primaryColor,
        automaticallyImplyLeading: true,
      ),
      body: Accordion(
        headerBackgroundColor: Color(0xFFEEEEEE),
        //contentBackgroundColor: Colors.blue[50],
      maxOpenSections: 3,
    headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
    children: [
    AccordionSection(
    isOpen: false,
    leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
    header: Text('Resonance Frequency Breathing',style: _headerStyle),
    content: Text('Resonance Frequency breathing rate is an ideal rate of breathing that'
        ' maximizes your heart rate' ),//, style: _contentStyle),
    contentHorizontalPadding: 20,
    contentBorderWidth: 1,
    ),

      AccordionSection(
        isOpen: false,
        leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
        header: Text('RMSSD',style: _headerStyle),
        content: Text('Root Mean Square of the Successive Differences' ),//, style: _contentStyle),
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
      ),

      AccordionSection(
        isOpen: false,
        leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
        header: Text('MaxMin',style: _headerStyle),
        content: Text('Max-min is a particularly helpful way to '
            'illustrate heart rate variability'),//, style: _contentStyle),
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
      ),

      AccordionSection(
        isOpen: false,
        leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
        header: Text('SDNN',style: _headerStyle),
        content: Text('SDNN, the standard deviation of normal to normal '
            'intervals' ),//, style: _contentStyle),
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
      ),

      AccordionSection(
        isOpen: false,
        leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
        header: Text('pNN50',style: _headerStyle),
        content: Text('pNN50 is the percentage of time intervals '
            'between heart beats that differ from adjacent intervals' ),//, style: _contentStyle),
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
      ),

      AccordionSection(
        isOpen: false,
        leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
        header: Text('Total Power',style: _headerStyle),
        content: Text('Total power is a frequency domain measurement of '
            'the total variance of the time intervals between heart beats' ),//, style: _contentStyle),
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
      ),

      AccordionSection(
        isOpen: false,
        leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
        header: Text('Low Frequency (LF) Power',style: _headerStyle),
        content: Text('' ),//, style: _contentStyle),
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
      ),

      AccordionSection(
        isOpen: false,
        leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
        header: Text('High Frequency Power (HF and InHF)',style: _headerStyle),
        content: Text('' ),//, style: _contentStyle),
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
      ),

      AccordionSection(
        isOpen: false,
        leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
        header: Text('Very Low Frequency Power',style: _headerStyle),
        content: Text('' ),//, style: _contentStyle),
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
      ),
    ],
    ),
    );
  }
}
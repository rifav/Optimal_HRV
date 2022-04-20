// ignore_for_file: use_key_in_widget_constructors

import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:optimal_hrv_bloc/theme.dart';

class Definitions extends StatelessWidget {
  final _headerStyle = const TextStyle(
      color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold);
  final _contentStyle = const TextStyle(
      color: Colors.black, fontSize: 13);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Key HRV Definitions'),
        backgroundColor: theme.primaryColor,
        automaticallyImplyLeading: true,
      ),
      body: Accordion(
        headerBackgroundColor: Colors.white, //Color(0xFFEEEEEE),
        headerBackgroundColorOpened: Colors.blueGrey.shade100,
        contentBorderColor: Colors.grey,//Color(0xFFEEEEEE),
        rightIcon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        contentBorderWidth: 20,
        //contentBackgroundColor: Colors.blue[50],
      maxOpenSections: 3,
    headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
    children: [

    AccordionSection(
    isOpen: false,
    leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
    header: Text('Resonance Frequency \nBreathing',style: _headerStyle),
    content: Text('Resonance Frequency breathing rate is an ideal rate of breathing that'
        ' maximizes your heart rate variability during'
        ' training which, in turn, increases your baseline HRV.'
        '\n\nWe determine your RF breathing rate by pacing your breath at several different rates.'
        '\n\nThe breathing rate that produces the highest HRV is your Resonance Frequency breathing rate.',style: _contentStyle),
    contentHorizontalPadding: 20,
    contentBorderWidth: 1,
    ),

      AccordionSection(
        isOpen: false,
        leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
        header: Text('RMSSD',style: _headerStyle),
        content: Text('Root Mean Square of the Successive Differences (RMSSD) is one of a several'
            'time-domain tools used to assess heart rate variability, the successive difference being neighboring RR intervals'
            '\n\nThe higher your RMD the better!', style: _contentStyle),
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
      ),

      AccordionSection(
        isOpen: false,
        leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
        header: Text('MaxMin',style: _headerStyle),
        content: Text('Max-min is a particularly helpful way to illustrate heart rate variability'
            ' (watch your heart rate going up and coming down). This shows you the changes in your heart rate'
            'in real time moment ot moment.'
            '\n\nThis is also an important measurement of the way your breath and your heart rate work together'
            'and one of the ways we know when your breathing practice brings you into your optimal training zone for improving HRV.', style: _contentStyle),
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
      ),

      AccordionSection(
        isOpen: false,
        leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
        header: Text('SDNN',style: _headerStyle),
        content: Text('SDNN, the standard deviation of normal to normal intervals (similar to RMSSD in that it provides a '
            'measurement of difference in the intervals between heartbeats). However, SDNN looks at all'
            'the intervals, not just the adjacent ones, the way RMSSD does.'
            '\n\nSDNN provides us with general measurement of overall HRV, whereas RMSSD tells us more'
            'about the parasympathetic nervous systems contribution to HRV in particular.', style: _contentStyle),
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
      ),

      AccordionSection(
        isOpen: false,
        leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
        header: Text('pNN50',style: _headerStyle),
        content: Text('pNN50 is the percentage of time intervals between heart beats that differ from adjacent intervals'
            'by 50 milliseconds or more. '
            '\n\npNN50 provides us withinformation regarding your nervous systems ability to regulate itself. ', style: _contentStyle),
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
      ),

      AccordionSection(
        isOpen: false,
        leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
        header: Text('Total Power',style: _headerStyle),
        content: Text('Total power is a frequency domain measurement of '
            'the total variance of the time intervals between heart beats, '
            'or the total activity of your nervous system. \n\n'
            'It includes HF, LF, VLF, and ULF power. We use the individual power components, such as LF and HF'
            'a lot more than total power itself.' , style: _contentStyle),
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
      ),

      AccordionSection(
        isOpen: false,
        leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
        header: Text('Low Frequency (LF) Power',style: _headerStyle),
        content: Text('Low Frequency (LF) power is a frequency domain measure of HRV, reflecting the strength of your'
            ' blood pressure reflex and the ability of your heart rate and breath to synchronize and work together.'
            ' LF is an indicator of being at your optimal breathing rate (RF breathing) needed to'
            ' train HRV most effectively. We want to see an increase in LF power during RF breathing only (for RV biofeedback training).'
            '\n\nA high LF power peak during biofeedback training indicates that you are making the most out of your '
            'training time in strengthening your nervous system reflexes and ability to self-regulate. Overtime, you '
            'might notice an increase in your LF power during biofeedback training indicating greater efficiency '
            'in your training. \n\nA low LF peak during biofeedback training may mean that you are just having an off day - perhaps '
            'you didn\'t sleep well, don\'t feel well, or have been under more stress than typical. It may also mean that '
            'you had trouble breathing at your RF breathing rate', style: _contentStyle),
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
      ),

      AccordionSection(
        isOpen: false,
        leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
        header: Text('High Frequency Power (HF and InHF)',style: _headerStyle),
        content: Text('High frequency power and natural log of high frequency power are frequency domain measures '
          'that tell us about the strength of your vagal tone, or the ability of the parasympathetic nervous '
          'system to regulate your overall activation. \n\nHF power itself can be influenced by your overall '
          'breathing rate and the distribution of its values is skewed. Therefore, we do not use raw HF power, '
          'but instead normalize those values by using the natural log, or InHF.' , style: _contentStyle),
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
      ),

      AccordionSection(
        isOpen: false,
        leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
        header: Text('Very Low Frequency Power',style: _headerStyle),
        content: Text('Very low frequency power or VLF. \n\nVLF is a frequency domain measurement of your '
            'HRV reflecting the activity of your sympathetic nervous system, the part of your nervous system '
            'responsible for physiological activation. \n\nShort term measurements of VLF power needs to '
            'be interpreted with caution, since the signal travels in a very slow wave, not giving us a lot of data in a '
            '3 minutes measurement interval. However, high VLF power on short term recordings may indicate '
            'worry and excessive physiological activation.', style: _contentStyle),
        contentHorizontalPadding: 20,
        contentBorderWidth: 1,
      ),
    ],
    ),
    );
  }
}
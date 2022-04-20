// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:optimal_hrv_bloc/theme.dart';
import 'package:accordion/accordion.dart';

import 'definitions.dart';

class FeedbackPage extends StatelessWidget {
  final _headerStyle = TextStyle(
      color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold);

  var playground_heading = RichText(
    text: const TextSpan(
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(text: 'Breathing Playground', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: '\nUse this to practive breathing at various breathing rates.', style: TextStyle(fontSize: 14.0, color: Colors.blue)),
      ],
    ),
  );

  var rfa_heading = RichText(
    text: const TextSpan(
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(text: 'Resonance Frequency Assessment', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: '\nTake this assessment to determine your ideal breathing training rate.', style: TextStyle(fontSize: 14.0, color: Colors.blue)),
      ],
    ),
  );

  var bio_heading = RichText(
    text: const TextSpan(
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(text: 'Biofeedback Training', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: '\nTrain your HRV at your resonance frequency breathing rate.', style: TextStyle(fontSize: 14.0, color: Colors.blue)),
      ],
    ),
  );

  var biodata_heading = RichText(
    text: const TextSpan(
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(text: 'Biofeedback Data', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: '\nLearn about your data and the definitions we use.', style: TextStyle(fontSize: 14.0, color: Colors.blue)),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Biofeedback'),
        backgroundColor: theme.primaryColor,
        automaticallyImplyLeading: true,
      ),
      body: Accordion(
        headerBackgroundColorOpened: Colors.blueGrey.shade100,
        headerBackgroundColor: Colors.white,//Color(0xFFEEEEEE),
        contentBorderColor: Colors.grey,
        rightIcon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        //contentBackgroundColor: Colors.blue[50],
        maxOpenSections: 3,
        headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        children: [
          AccordionSection(
            isOpen: false,
            leftIcon: Icon(Icons.favorite, color: Color(0XFFEC407A)),
            header: playground_heading,//Text('Breathing Playground',style: _headerStyle),
            content: Directionality(
              textDirection: TextDirection.rtl,
              child: 
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: theme.primaryColor,
                fixedSize: const Size(208, 43),
              ),
              label: Text(
                  "Continue",
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white)),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {  },
            ),
            ),
            contentHorizontalPadding: 20,
            contentBorderWidth: 1,
          ),

          AccordionSection(
            isOpen: false,
            leftIcon: Icon(Icons.watch_later_outlined, color: Color(0XFFEC407A)),
            header: rfa_heading,//Text('Resonance Frequency Assessments',style: _headerStyle),
            content: Directionality(
              textDirection: TextDirection.rtl,
              child:
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: theme.primaryColor,
                  fixedSize: const Size(208, 43),
                ),
                label: Text(
                    "Continue",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white)),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {  },
              ),
            ),
            contentHorizontalPadding: 20,
            contentBorderWidth: 1,
          ),

          AccordionSection(
            isOpen: false,
            leftIcon: Icon(Icons.biotech, color: Color(0XFFEC407A)),
            header: bio_heading,//Text('Biofeedback Training',style: _headerStyle),
            content: Directionality(
              textDirection: TextDirection.rtl,
              child:
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: theme.primaryColor,
                  fixedSize: const Size(208, 43),
                ),
                label: Text(
                    "Continue",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white)),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {  },
              ),
            ),
            contentHorizontalPadding: 20,
            contentBorderWidth: 1,
          ),

          AccordionSection(
            isOpen: false,
            leftIcon: Icon(Icons.screen_search_desktop_rounded, color: Color(0XFFEC407A)),
            header: biodata_heading,//Text('Biofeedback Data',style: _headerStyle),
            content: Directionality(
              textDirection: TextDirection.rtl,
              child:
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: theme.primaryColor,
                  fixedSize: const Size(208, 43),
                ),
                label: Text(
                    "Learn More",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white)),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(
                      context) // when button is pressed -> open camera (goes to CameraAppTest class)
                      .push<void>(MaterialPageRoute(
                      builder: (context) =>  Definitions()));
                },
              ),
            ),
            contentHorizontalPadding: 20,
            contentBorderWidth: 1,
          ),
        ],
      ),
    );
  }
}

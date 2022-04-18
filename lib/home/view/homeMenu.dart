// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:optimal_hrv_bloc/home/home.dart';
import 'package:optimal_hrv_bloc/home/view/biofeedback.dart';
import 'package:optimal_hrv_bloc/home/view/definitions.dart';
import 'package:optimal_hrv_bloc/home/view/education.dart';
import 'package:optimal_hrv_bloc/home/view/mindfulness.dart';
import 'package:optimal_hrv_bloc/home/view/reminders.dart';
import 'package:optimal_hrv_bloc/home/view/youtube_videos.dart';
import 'package:optimal_hrv_bloc/home/view/onboarding.dart';
import 'package:optimal_hrv_bloc/theme.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Homepage'),
        backgroundColor: theme.primaryColor,
        automaticallyImplyLeading: false,
      ),

      body: Center(
        child: SingleChildScrollView(
        child: Container(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  // Take HRV Reading
                  Ink(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 65, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: InkWell(
                      onTap: (){
                        //Navigator.pop(context, true);
                        Navigator.of(
                            context) // when button is pressed -> open camera (goes to CameraAppTest class)
                            .push<void>(MaterialPageRoute(
                            builder: (context) => const Page1()));
                      },

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Take HRV Reading', style: const TextStyle(fontWeight: FontWeight.bold)),
                        Align(
                          child: Icon(Icons.favorite, color: Colors.lightGreen,
                          )
                        )
                      ],
                    ),
                    )
                  ),
                  const SizedBox(height: 12),
                  // Onboarding Tasks
                  Ink(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 65, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: InkWell(
                      onTap: (){
                        //Navigator.pop(context, true);
                        Navigator.of(
                            context) // when button is pressed -> open camera (goes to CameraAppTest class)
                            .push<void>(MaterialPageRoute(
                            builder: (context) => ManualSlide()));
                      },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Onboarding Tasks', style: const TextStyle(fontWeight: FontWeight.bold)),
                        Align(
                            child: Icon(Icons.format_list_bulleted, color: const Color(0xFFEF9A9A),
                            )
                        )
                      ],
                    ),
                  ),
                  ),
                  const SizedBox(height: 12),
                  // Mindfulness
                  Ink(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 65, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: InkWell(
                      onTap: (){
                        //Navigator.pop(context, true);
                        Navigator.of(
                            context) // when button is pressed -> open camera (goes to CameraAppTest class)
                            .push<void>(MaterialPageRoute(
                            builder: (context) => MindfulnessPage()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text('Mindfulness', style: const TextStyle(fontWeight: FontWeight.bold)),
                          Align( // wb_incandescent
                              child: Icon(Icons.lightbulb, color: const Color(0xFFEF9A9A),
                              )
                          )
                        ],
                      ),
                    ),

/*                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Mindfulness', style: const TextStyle(fontWeight: FontWeight.bold)),
                        Align( // wb_incandescent
                            child: Icon(Icons.lightbulb, color: const Color(0xFFEF9A9A),
                            )
                        )
                      ],
                    ),*/
                  ),
                  const SizedBox(height: 12),
                  // Biofeedback
                  Ink(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 65, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: InkWell(
                        onTap: (){
                          //Navigator.pop(context, true);
                          Navigator.of(
                              context) // when button is pressed -> open camera (goes to CameraAppTest class)
                              .push<void>(MaterialPageRoute(
                              builder: (context) => FeedbackPage()));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text('Biofeedback', style: const TextStyle(fontWeight: FontWeight.bold)),
                            Align(
                                child: Icon(Icons.auto_graph, color: const Color(0xFFEF9A9A),
                                )
                            )
                          ],
                        ),
                      )
                  ),

                  const SizedBox(height: 12),
                  // Podcast & Books
                  Ink(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 65, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: InkWell(
                        onTap: (){
                          //Navigator.pop(context, true);
                          Navigator.of(
                              context) // when button is pressed -> open camera (goes to CameraAppTest class)
                              .push<void>(MaterialPageRoute(
                              builder: (context) =>  EducationPage()));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text('Podcast & Books', style: const TextStyle(fontWeight: FontWeight.bold)),
                            Align(
                                child: Icon(Icons.podcasts, color: const Color(0xFF1565C0),
                                )
                            )
                          ],
                        ),
                      )
                  ),

                  const SizedBox(height: 12),
                  // Data Definitions
                  Ink(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 65, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: InkWell(
                      onTap: (){
                        //Navigator.pop(context, true);
                        Navigator.of(
                            context) // when button is pressed -> open camera (goes to CameraAppTest class)
                            .push<void>(MaterialPageRoute(
                            builder: (context) =>  Definitions()));
                      },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Data Definitions', style: const TextStyle(fontWeight: FontWeight.bold)),
                        Align(
                            child: Icon(Icons.assignment, color: const Color(0xFF7B1FA2),
                            )
                        )
                      ],
                    ),
                  ),
                  ),
                  const SizedBox(height: 12),
                  // Videos
                  Ink(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 65, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: InkWell(
                      onTap: (){
                        //Navigator.pop(context, true);
                        Navigator.of(
                            context) // when button is pressed -> open camera (goes to CameraAppTest class)
                            .push<void>(MaterialPageRoute(
                            builder: (context) =>  YouTubePage()));
                      },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('YouTube Videos', style: const TextStyle(fontWeight: FontWeight.bold)),
                        Align(
                            child: Icon(Icons.videocam, color: Color(0xFFEF5350),
                            )
                        )
                      ],
                    ),
                  ),
                  ),

                  const SizedBox(height: 12),
                  // Set Reminders
                  Ink(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: Colors.white, border: Border.all( color: const Color(0xFFEEEEEE), width: 2,)
                    ),
                    height: 65, width: 325,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),


                    child: InkWell(
                      onTap: (){
                        //Navigator.pop(context, true);
                        Navigator.of(
                            context) // when button is pressed -> open camera (goes to CameraAppTest class)
                            .push<void>(MaterialPageRoute(
                            builder: (context) =>  Reminders()));
                      },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Set Reminders', style: const TextStyle(fontWeight: FontWeight.bold)),
                        Align(
                            child: Icon(Icons.watch_later_outlined, color: Color(0xFFEF5350),
                            )
                        )
                      ],
                    ),
                    ),// here
                  ),
                ],
              )
                  ),
        )
              ),
          );
  }
}

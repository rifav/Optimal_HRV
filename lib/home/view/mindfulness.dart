// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:optimal_hrv_bloc/theme.dart';
import 'package:accordion/accordion.dart';

class MindfulnessPage extends StatelessWidget {
  final _headerStyle = TextStyle(
      color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mindfulness'),
        backgroundColor: theme.primaryColor,
        automaticallyImplyLeading: true,
      ),

      body: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              //color: Colors.red[100],
              border: Border.all(color: theme.primaryColor, width: 0.5),
            ),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 10),

            child: Column(
              children: [
                const Align(
                  alignment: FractionalOffset(0.5, 0.2),
                  child: Text(
                    'Welcome to the Mindfulness Page ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Icon(
                  Icons.lightbulb, size: 50,
                  color: Colors.lightGreen[300],
                ),
                const Align(
                  alignment: FractionalOffset(0.5, 0.2),
                  child: Text(
                    'Nurture your mind & cultivate your heart.',
                    style: TextStyle(fontSize: 15),
                  ), // display text HRV score
                ),
              ],
            ),
          ),

          Column(
            children: [
              SizedBox(height: 20),
              ElevatedButton.icon(
                  onPressed: (){},
                  icon:  Icon(
                      Icons.person,
                    color: theme.primaryColor,
                  ),
                  label: const Text(
                    'Meditations to start with',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                      textStyle:
                      const TextStyle(color: Colors.black),
                      fixedSize: const Size(340, 30),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
              ),

              const SizedBox(height: 0.1),
              ElevatedButton.icon(
                onPressed: (){},
                icon:  const Icon(
                  Icons.home_filled,
                    color: Color(0xFFEF9A9A),
                ),
                label: const Text(
                  'Mindful Self Compassion practices',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  textStyle:
                  const TextStyle(color: Colors.black),
                  fixedSize: const Size(340, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
              ),

              const SizedBox(height: 0.1),
              ElevatedButton.icon(
                onPressed: (){},
                icon:  const Icon(
                  Icons.clean_hands,
                  color: const Color(0xFF1565C0),
                ),
                label: const Text(
                  'Meditations for grounding & resilience',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  textStyle:
                  const TextStyle(color: Colors.black),
                  fixedSize: const Size(340, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
              ),

              const SizedBox(height: 0.1),
              ElevatedButton.icon(
                onPressed: (){},
                icon:  Icon(
                  Icons.sports_handball,
                  color: Colors.orangeAccent.shade200,
                ),
                label: const Text(
                  'Meditations for pain, anxiety, depression',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  textStyle:
                  const TextStyle(color: Colors.black),
                  fixedSize: const Size(340, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
              ),

              const SizedBox(height: 0.1),
              ElevatedButton.icon(
                onPressed: (){},
                icon:  Icon(
                  Icons.sailing,
                  color: Colors.lightGreen.shade300,
                ),
                label: const Text(
                  'Compassion and Self-Compassion meditations',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  textStyle:
                  const TextStyle(color: Colors.black),
                  fixedSize: const Size(340, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
              ),

              const SizedBox(height: 0.1),
              ElevatedButton.icon(
                onPressed: (){},
                icon:  Icon(
                  Icons.safety_divider,
                  color: Colors.purple.shade200,
                ),
                label: const Text(
                  'Mindful relaxation exercises',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  textStyle:
                  const TextStyle(color: Colors.black),
                  fixedSize: const Size(340, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
              ),

              const SizedBox(height: 0.1),
              ElevatedButton.icon(
                onPressed: (){},
                icon:  Icon(
                  Icons.settings_accessibility,
                  color: Colors.orangeAccent.shade200,
                ),
                label: const Text(
                  'Compassion New',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  textStyle:
                  const TextStyle(color: Colors.black),
                  fixedSize: const Size(340, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
              ),
            ],
          )
        ],
      ),

    );
  }
}

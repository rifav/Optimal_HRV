// ignore_for_file: prefer_const_constructors,
// avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:optimal_hrv_bloc/home/view/biofeedback.dart';
import 'package:optimal_hrv_bloc/home/view/homeMenu.dart';
import 'package:optimal_hrv_bloc/home/view/info.dart';
import 'package:optimal_hrv_bloc/home/widgets/widgets.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);
  @override
  _MenuState createState() => _MenuState();
  static Page page() => const MaterialPage<void>(child: Menu());
}

class _MenuState extends State<Menu> {
  int _currentIndex = 0;
  final screens = [
    //EducationPage(), // Education
    Page2(), // Data Trends
    Page1(), //PPG reader aka Dashboard
    FeedbackPage(), //biofeedback
    ProfileView(), // user profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*        appBar: AppBar(
          title: const Text('Menu Items'),
        ),*/
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const [
          /*BottomNavigationBarItem(
            icon: Icon(Icons.show_chart, color: Color(0xFF0087a1), size: 25),
            label: '',
            backgroundColor: Colors.white,
          ),*/
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30, color: Color(0xFF0087a1)),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, size: 30, color: Color(0xFF0087a1)),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_graph, size: 30, color: Color(0xFF0087a1)),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30, color: Color(0xFF0087a1)),
              label: '',
              backgroundColor: Colors.white)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

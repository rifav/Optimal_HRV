// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:optimal_hrv_bloc/theme.dart';

class EducationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Podcast & Books'),
          backgroundColor: theme.primaryColor,
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            indicatorColor: Colors.grey,
            tabs: [
              Tab(
                text: 'Podcasts',
              ),
              Tab(text: 'Reading'),
            ],
          ),
        ),
        body: const TabBarView(children: [
          Align(
              alignment: FractionalOffset(0.5, 0.1),
              child: Text('Welcome to the Heart Variability Podcasts')),
          Align(
              alignment: FractionalOffset(0.5, 0.1),
              child: Text('Welcome to the Heart Variability Readings'))
        ]),
      ));
}

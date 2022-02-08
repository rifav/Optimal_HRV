// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:optimal_hrv_bloc/theme.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('User info'),
        backgroundColor: theme.primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 150),
            child: const Text(
                'More information about the user will be added here.'),
          ),
        ],
      ),
    );
  }
}

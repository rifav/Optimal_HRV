// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
  textTheme: GoogleFonts.openSansTextTheme(),
  appBarTheme: const AppBarTheme(color: Color(0xFF0087a1)),
  primaryColorDark: const Color(0xFF0087a1),
  primaryColorLight: const Color(0xFF0087a1),
  primaryColor: const Color(0xFF0087a1),
  colorScheme: const ColorScheme.light(secondary: Color(0xFF0087a1)),
  scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF0087a1))),
    labelStyle: const TextStyle(color: Colors.black),
  ),
);

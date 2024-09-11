import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.black,
    selectedItemColor: Colors.redAccent,
    elevation: 0,
  ),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation: 0, toolbarTextStyle: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ).bodyMedium, titleTextStyle: const TextTheme(
      displayMedium: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ).displayMedium,
  ),

);
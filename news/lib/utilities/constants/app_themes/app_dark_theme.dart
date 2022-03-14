import 'package:flutter/material.dart';

ThemeData dartTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.deepOrange,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.orange[50],
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.orange[50],
      size: 20.0,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.orange[50],
    unselectedItemColor: Colors.black,
    elevation: 20.0,
    backgroundColor: Colors.deepOrange,
  ),
  scaffoldBackgroundColor: const Color(0xff333739),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
);

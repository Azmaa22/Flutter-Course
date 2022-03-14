import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.orange[50],
    elevation: 0.0,
    titleTextStyle: const TextStyle(
      color: Colors.deepOrange,
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: Colors.deepOrange,
      size: 20.0,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.orange[50],
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
);

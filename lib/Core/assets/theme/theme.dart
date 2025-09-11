import 'package:flutter/material.dart';

abstract class ThemeApp {

static ThemeData theme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: Colors.black54,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
      bodySmall: TextStyle(
      color: Colors.black54,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    

   
  ),
);


}
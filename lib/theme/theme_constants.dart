import 'package:flutter/material.dart';

const COLOUR_PRIMARY = Colors.deepOrangeAccent;
const COLOUR_ACCENT = Colors.orange;

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: COLOUR_PRIMARY,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: COLOUR_ACCENT,
  ),
  appBarTheme: AppBarTheme(
      color: COLOUR_PRIMARY,
      elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        COLOUR_ACCENT,
      )
    ),
  ),
  textTheme: TextTheme(
    headline4: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide.none
    ),
    filled: true,
    fillColor: Colors.grey.withOpacity(0.1),
  )
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all<Color>(Colors.grey),
    thumbColor: MaterialStateProperty.all<Color>(Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            )
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black87),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
  ),
);
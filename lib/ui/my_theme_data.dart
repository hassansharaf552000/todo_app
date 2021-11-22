import 'package:flutter/material.dart';
class MyThemeData {
  static const Color lightScaffoldBackground=
  Color.fromRGBO(212, 229, 207, 1.0);
  static const Color lightbottombar=
  Color.fromRGBO(255, 255, 255, 1.0);
  static const Color darkbottombar=
  Color.fromRGBO(112, 112, 112, 1.0);
  static const Color darkScaffoldBackground=
  Color.fromRGBO(6, 14, 30, 1.0);
  static const Color greencolour=
  Color.fromRGBO(212, 229, 207, 1.0);
  static final ThemeData lightTheme=ThemeData(
      scaffoldBackgroundColor:lightScaffoldBackground,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: lightbottombar
      ),
      textTheme:TextTheme(
        headline1: TextStyle(
          color: Colors.black45,
          fontSize: 25,
        ),
        headline2: TextStyle(
            color: Colors.black,
            fontSize: 25
        ),
        subtitle1: TextStyle(
            color: Colors.black,
            fontSize: 18
        ),
        subtitle2: TextStyle(
            color: Colors.black45,
            fontSize: 20
        ),
      ),
  );
  static final ThemeData darkTheme=ThemeData(
      scaffoldBackgroundColor:darkScaffoldBackground,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: darkbottombar
      ),
      textTheme:TextTheme(
        headline1: TextStyle(
          color: Colors.blue,
          fontSize: 25,
        ),
        headline2: TextStyle(
            color: Colors.blue,
            fontSize: 25
        ),
        subtitle1: TextStyle(
            color: Colors.blue,
            fontSize: 18
        ),
        subtitle2: TextStyle(
            color: Colors.black45,
            fontSize: 20
        ),
      )
  );
}

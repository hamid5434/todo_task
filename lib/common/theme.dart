
import 'package:flutter/material.dart';

ThemeData theme() {
  const String DEFAULTFONTFAMILY = 'Avenir';
  return ThemeData(
    primaryColor: Color(0xFF0D253C),
    primarySwatch: Colors.blue,
    primaryColorDark: Color(0xFF083CC1),
    primaryColorLight: Color(0xFF085CDB),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Color(0xFFF5F5F5),
    fontFamily: DEFAULTFONTFAMILY,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Color(0XFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headline2: TextStyle(
        color: Color(0XFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline3: TextStyle(
        color: Color(0XFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      headline4: TextStyle(
        color: Color(0XFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline5: TextStyle(
        color: Color(0XFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      headline6: TextStyle(
        color: Color(0XFF1B070B),
        fontFamily: DEFAULTFONTFAMILY,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      bodyText1: TextStyle(
        color: Color(0XFF1B070B),
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyText2: TextStyle(
        color: Color(0XFF1B070B),
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      subtitle1: TextStyle(
        color: Color(0XFF2D4379),
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    ),
  );
}

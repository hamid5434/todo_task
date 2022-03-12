
import 'package:flutter/material.dart';

const Color primeryColor = Color(0xff794cff);
const Color primaryVariant = Color(0xff5c0aff);

ThemeData theme() {
  const String DEFAULTFONTFAMILY = 'Avenir';

  final primaryTextColor = Color(0xffffffff);
  final secondaryTextColor = Color(0xffafbed0);
  return ThemeData(
    colorScheme: ColorScheme.light(
      primary: primeryColor,
      primaryVariant: primaryVariant ,
      background: const Color(0xfff3f5f8),
      onSurface: primaryTextColor,
      onBackground: primaryTextColor,
      secondary: primeryColor,
      onSecondary: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: secondaryTextColor,
      ),
    ),
    iconTheme: IconThemeData(
      color: primaryTextColor,
    ),
    primaryColor: primeryColor,
    primarySwatch: Colors.blue,
    primaryColorDark: primaryVariant,
    primaryColorLight: primeryColor,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Color(0xFFF5F5F5),
    fontFamily: DEFAULTFONTFAMILY,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headline2: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline3: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      headline4: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline5: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      headline6: TextStyle(
        color: primaryTextColor,
        fontFamily: DEFAULTFONTFAMILY,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      bodyText1: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyText2: TextStyle(
        color: primaryTextColor,
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

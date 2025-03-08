import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';
import 'package:intl/intl.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: lightBgColor,
    filled: true,
    enabledBorder: InputBorder.none,
    prefixIconColor: lightLabelColor,
    labelStyle: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: lightFontColor,
      fontWeight: FontWeight.w500,
    ),
    hintStyle: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: lightFontColor,
      fontWeight: FontWeight.w500,
    ),
  ),
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    surface: lightBgColor,
    onSurface: lightFontColor,
    primaryContainer: lightDivColor,
    onPrimaryContainer: lightFontColor,
    secondaryContainer: lightLabelColor,
    primary: lightPrimaryColor,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 24,
      color: lightFontColor,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      color: lightFontColor,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: lightFontColor,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      color: lightFontColor,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: lightFontColor,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 13,
      color: lightFontColor,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 13,
      color: lightFontColor,
      fontWeight: FontWeight.w300,
    ),
  ),
);

var darkTheme = ThemeData(
  useMaterial3: true,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: darkBgColor,
    filled: true,
    enabledBorder: InputBorder.none,
    prefixIconColor: darkLabelColor,
    labelStyle: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: darkFontColor,
      fontWeight: FontWeight.w500,
    ),
    hintStyle: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: darkFontColor,
      fontWeight: FontWeight.w500,
    ),
  ),
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    surface: darkBgColor,
    onSurface: darkFontColor,
    primaryContainer: darkDivColor,
    onPrimaryContainer: darkFontColor,
    secondaryContainer: darkLabelColor,
    primary: darkPrimaryColor,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 24,
      color: darkFontColor,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      color: darkFontColor,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: darkFontColor,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      color: darkFontColor,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: darkFontColor,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 13,
      color: darkFontColor,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 13,
      color: darkLabelColor,
      fontWeight: FontWeight.w300,
    ),
  ),
);

String formatDateTime(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  DateTime now = DateTime.now();
  Duration difference = now.difference(dateTime);

  if (difference.inDays == 0) {
    if (difference.inHours == 0) {
      return '${difference.inMinutes} minutes ago';
    }
    return '${difference.inHours} hours ago';
  } else if (difference.inDays == 1) {
    return 'Yesterday';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} days ago';
  } else {
    return DateFormat('MMM d, yyyy').format(dateTime);
  }
}
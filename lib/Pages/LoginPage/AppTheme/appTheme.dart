import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    Color primaryColor =  const Color(0xFF2A068F);
    Color secundaryColor = Colors.white;
    const bottonHeight = Size.fromHeight(56.0);

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: secundaryColor,
      ),
      primaryColor: secundaryColor,
      hintColor: secundaryColor,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: secundaryColor),
        bodyMedium: TextStyle(color: secundaryColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          foregroundColor: MaterialStateProperty.all<Color>(secundaryColor),
          minimumSize: MaterialStateProperty.all<Size>(bottonHeight),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme Colors
  static const Color lightPrimary = Color(0xFF007AFF);
  static const Color lightBackground = Color(0xFFF5F5F7);
  static const Color lightCard = Colors.white;
  static const Color lightText = Color(0xFF1D1D1F);

  // Dark Theme Colors
  static const Color darkPrimary = Color(0xFF0A84FF);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkCard = Color(0xFF1E1E1E);
  static const Color darkText = Color(0xFFE5E5E7);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: lightBackground,
    cardColor: lightCard,
    textTheme: TextTheme(
      displayLarge: TextStyle(color: lightText, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: lightText),
    ),
    colorScheme: ColorScheme.light(
      primary: lightPrimary,
      secondary: lightPrimary,
      background: lightBackground,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: lightBackground.withOpacity(0.8),
      elevation: 0,
      iconTheme: IconThemeData(color: lightPrimary),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: darkBackground,
    cardColor: darkCard,
    textTheme: TextTheme(
      displayLarge: TextStyle(color: darkText, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: darkText),
    ),
    colorScheme: ColorScheme.dark(
      primary: darkPrimary,
      secondary: darkPrimary,
      background: darkBackground,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: darkBackground.withOpacity(0.8),
      elevation: 0,
      iconTheme: IconThemeData(color: darkPrimary),
    ),
  );
}

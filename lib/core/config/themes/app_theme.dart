import 'package:ecommerce_app/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColorsDark.primary,
    scaffoldBackgroundColor: AppColorsDark.background,
    brightness: Brightness.dark,
    fontFamily: AppConstants.kFontFamily,
    colorScheme: ColorScheme.dark(
      primary: AppColorsDark.primary,
      secondary: AppColorsDark.primary,
      surface: AppColorsDark.secondBackground,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColorsDark.text,
      onError: Colors.white,
      error: Colors.redAccent,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColorsDark.secondBackground,
      contentTextStyle: TextStyle(color: AppColorsDark.text),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorsDark.secondBackground,
      hintStyle: const TextStyle(
        color: AppColorsDark.hintText,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColorsDark.primary, width: 1.5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorsDark.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        textStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'CircularStd'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColorsDark.text),
      bodyMedium: TextStyle(color: AppColorsDark.text),
      titleLarge: TextStyle(color: AppColorsDark.text, fontWeight: FontWeight.bold),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColorsLight.primary,
    scaffoldBackgroundColor: AppColorsLight.background,
    brightness: Brightness.light,
    fontFamily: 'CircularStd',
    colorScheme: ColorScheme.light(
      primary: AppColorsLight.primary,
      secondary: AppColorsLight.primary,
      surface: AppColorsLight.secondBackground,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColorsLight.text,
      onError: Colors.white,
      error: Colors.red,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColorsLight.secondBackground,
      contentTextStyle: TextStyle(color: AppColorsLight.text),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorsLight.secondBackground,
      hintStyle: TextStyle(
        color: AppColorsLight.hintText,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColorsLight.cardBorder, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColorsLight.cardBorder, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColorsLight.primary, width: 1.5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorsLight.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        textStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'CircularStd'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColorsLight.text),
      bodyMedium: TextStyle(color: AppColorsLight.text),
      titleLarge: TextStyle(color: AppColorsLight.text, fontWeight: FontWeight.bold),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorsLight.background,
      foregroundColor: AppColorsLight.text,
      elevation: 0.5,
      iconTheme: IconThemeData(color: AppColorsLight.text),
      titleTextStyle: TextStyle(
        color: AppColorsLight.text,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: 'CircularStd',
      ),
    ),
  );
}
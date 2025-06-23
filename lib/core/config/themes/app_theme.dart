import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColorsDark.primary,
    scaffoldBackgroundColor: AppColorsDark.background,
    brightness: Brightness.dark,
    primaryTextTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColorsDark.text),
    ),
    fontFamily: 'CircularStd',
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColorsDark.background,
      contentTextStyle: TextStyle(
        color: AppColorsDark.text,
        fontFamily: 'CircularStd',
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorsDark.secondBackground,
      hintStyle: const TextStyle(
        color: Color(0xffA7A7A7),
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
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorsDark.primary,
        elevation: 0,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: 'CircularStd',
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    ),

    extensions: <ThemeExtension<dynamic>>[
      BoxDecorationTheme(
        card: BoxDecoration(
          color: AppColorsDark.secondBackground,
          borderRadius: BorderRadius.circular(30),
          // shape: BoxShape.circle,
        ),
      ),
    ],
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColorsLight.primary,
    scaffoldBackgroundColor: AppColorsLight.background,
    brightness: Brightness.light,
    primaryTextTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColorsLight.text),
    ),
    fontFamily: 'CircularStd',
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColorsLight.background,
      contentTextStyle: TextStyle(
        color: AppColorsLight.text,
        fontFamily: 'CircularStd',
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorsLight.secondBackground,
      hintStyle: const TextStyle(
        color: Color(0xffA7A7A7),
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
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorsLight.primary,
        elevation: 0,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontFamily: 'CircularStd',
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    ),
    extensions: <ThemeExtension<dynamic>>[
      BoxDecorationTheme(
        card: BoxDecoration(
          color: AppColorsLight.secondBackground,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ],
  );
}

class BoxDecorationTheme extends ThemeExtension<BoxDecorationTheme> {
  const BoxDecorationTheme({required this.card});

  final BoxDecoration card;

  @override
  BoxDecorationTheme copyWith({BoxDecoration? card}) {
    return BoxDecorationTheme(card: card ?? this.card);
  }

  @override
  BoxDecorationTheme lerp(BoxDecorationTheme? other, double t) {
    return this;
  }
}

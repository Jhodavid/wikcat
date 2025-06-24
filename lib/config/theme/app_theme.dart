import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {

  static const colorLightScheme = ColorScheme(
    brightness: Brightness.light,
    error: Colors.red,
    onError: Colors.redAccent,
    primary: Color(0xFF53989a),
    onPrimary: Colors.greenAccent,
    secondary: Color(0xF3F1F1FF),
    onSecondary: Colors.blueAccent,
    surface: Colors.white,
    onSurface: Colors.blueGrey,
    surfaceTint: Colors.white
  );

  static const colorDarkScheme = ColorScheme(
    brightness: Brightness.dark,
    error: Colors.red,
    onError: Colors.redAccent,
    primary: Color(0xff7dede4),
    onPrimary: Colors.greenAccent,
    secondary: Color(0xFF019d91),
    onSecondary: Colors.blueAccent,
    surface: Colors.white70,
    onSurface: Colors.white,
    surfaceTint: Colors.white
  );

  final bool isDarkMode;

  AppTheme(this.isDarkMode);

  ThemeData getTheme() {

    late final ColorScheme colorScheme;

    if(isDarkMode) {
      colorScheme = colorDarkScheme;
    } else {
      colorScheme = colorLightScheme;
    }

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: const TextTheme().copyWith(
        displaySmall: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
        bodySmall: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        titleSmall: const TextStyle(
          color: Colors.black,
        ),
        titleMedium: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        titleLarge: const TextStyle(
            fontWeight: FontWeight.bold
        ),
      ),
      cardTheme: CardTheme(
        color: colorScheme.secondary,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
          )
      ),
      textSelectionTheme: const TextSelectionThemeData(),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.secondary,
        circularTrackColor: colorScheme.onSurface,
      ),
      appBarTheme: AppBarTheme(
        color: colorScheme.secondary,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorScheme.onSurface
        ),
        triggerMode: TooltipTriggerMode.tap
      )
    );
  }

  AppTheme copyWith({
    final bool? isDarkMode
  }) => AppTheme(isDarkMode ?? this.isDarkMode);
}
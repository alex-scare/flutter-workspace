import 'package:flutter/material.dart';

class AppTheme {
  final pageTransition = const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
    },
  );

  AppTheme() {
    light = ThemeData.light().copyWith(
      useMaterial3: true,
      pageTransitionsTheme: pageTransition,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF5854A8),
        secondary: Color(0xFF006C4F),
        background: Color(0xFFFFFBFF),
        onBackground: Color(0xFF3E0021),
      ),
    );

    dark = ThemeData.dark().copyWith(
      useMaterial3: true,
      pageTransitionsTheme: pageTransition,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFC3C0FF),
        secondary: Color(0xFF68DBB0),
        background: Color(0xFF3E0021),
        onBackground: Color(0xFFFFD9E4),
      ),
    );
  }

  late ThemeData light;
  late ThemeData dark;
}

final theme = AppTheme();

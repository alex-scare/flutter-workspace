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
        primary: Color(0x005854A8),
        secondary: Color(0x00006C4F),
        background: Color(0x00FFFBFF),
        onBackground: Color(0x003E0021),
      ),
    );

    dark = ThemeData.dark().copyWith(
      useMaterial3: true,
      pageTransitionsTheme: pageTransition,
      colorScheme: const ColorScheme.dark(
        primary: Color(0x00C3C0FF),
        secondary: Color(0x0068DBB0),
        background: Color(0x003E0021),
        onBackground: Color(0x00FFD9E4),
      ),
    );
  }

  late ThemeData light;
  late ThemeData dark;
}

final theme = AppTheme();

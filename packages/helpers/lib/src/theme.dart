import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }

  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
}

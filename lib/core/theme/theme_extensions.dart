import 'package:flutter/material.dart';

extension ThemeContext on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
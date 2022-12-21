import 'package:flutter/material.dart';

class MyTheme {
  final light = const Color(0xffD8DADC);
  final dark = const Color(0xff121317);

  ColorScheme colors(Color targetColor, Brightness brightness) {
    return ColorScheme.fromSeed(
      seedColor: targetColor,
      brightness: brightness,
    );
  }

  ThemeData lightTheme() {
    final colorScheme = colors(light, Brightness.light);
    return ThemeData.light(
      useMaterial3: true,
    ).copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
    );
  }

  ThemeData darkTheme() {
    final colorScheme = colors(dark, Brightness.dark);
    return ThemeData.dark(
      useMaterial3: true,
    ).copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
    );
  }
}

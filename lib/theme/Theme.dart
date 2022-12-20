import 'package:flutter/material.dart';

class MyTheme {
  ThemeData lightTheme() => ThemeData.light(
        useMaterial3: true,
      ).copyWith();

  ThemeData darkTheme() => ThemeData.dark(
        useMaterial3: true,
      ).copyWith();
}

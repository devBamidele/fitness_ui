import 'package:fitness_ui/utils/colors.dart';
import 'package:fitness_ui/utils/constants.dart';
import 'package:flutter/material.dart';

class MyTheme {
  final light = kLight;
  final dark = kDark;

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
      cardTheme: cardTheme(Brightness.light),
      scaffoldBackgroundColor: colorScheme.background,
      outlinedButtonTheme: outlinedButtonTheme(colorScheme),
    );
  }

  ThemeData darkTheme() {
    final colorScheme = colors(dark, Brightness.dark);
    return ThemeData.dark(
      useMaterial3: true,
    ).copyWith(
      colorScheme: colorScheme,
      cardTheme: cardTheme(Brightness.dark),
      scaffoldBackgroundColor: colorScheme.background,
      outlinedButtonTheme: outlinedButtonTheme(colorScheme),
    );
  }

  OutlinedButtonThemeData outlinedButtonTheme(ColorScheme colors) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 1.5,
          color: colors.onBackground.withAlpha(60),
        ),
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(14),
        foregroundColor: colors.onBackground,
      ),
    );
  }

  CardTheme cardTheme(Brightness brightness) {
    bool dark = brightness == Brightness.light ? false : true;
    return CardTheme(
      color: dark ? kDarkCardColor : kLightCardColor,
      clipBehavior: Clip.antiAlias,
      shape: kCardShape,
    );
  }
}

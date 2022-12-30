import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

extension TypographyUtils on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get textTheme =>
      GoogleFonts.plusJakartaSansTextTheme(theme.textTheme);

  /// The main text in kcal
  TextStyle? get headline1 => textTheme.headline1?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 37,
        color: colors.onBackground,
      );

  TextStyle? get username => textTheme.headline5?.copyWith(
        fontSize: 16,
        color: isDarkMode ? kTileColor.withOpacity(0.9) : colors.onBackground,
        fontWeight: FontWeight.w600,
      );

  /// Current Date
  TextStyle? get headline4 => textTheme.headline4?.copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: colors.onBackground,
        letterSpacing: 0.52,
      );

  /// Hello
  TextStyle? get headline5 => textTheme.headline5?.copyWith(
        fontSize: 16,
        color: colors.onBackground.withOpacity(0.8),
        fontWeight: FontWeight.bold,
      );

  /// Total Calories burnt today
  TextStyle? get subtitle1 => textTheme.subtitle1?.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16.1,
        wordSpacing: 1.8,
        letterSpacing: .5,
        color: colors.onBackground.withOpacity(0.65),
      );

  /// Style for 'Distance', 'Steps' and 'Points' text
  TextStyle? get subtitle2 => textTheme.subtitle2?.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 15,
        wordSpacing: 1.8,
        letterSpacing: .5,
        color: colors.onBackground.withOpacity(0.8),
      );

  /// The values of 'Distance', 'Steps' and 'Points'
  TextStyle? get bodyText1 => textTheme.bodyText1?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 19,
        wordSpacing: 1.8,
        letterSpacing: .5,
      );

  /// The values of the days of the week 'Mon', 'Tues', 'Wed'
  TextStyle? get caption => textTheme.caption?.copyWith(
        fontSize: 15,
        color: colors.onBackground.withOpacity(0.6),
        fontWeight: FontWeight.bold,
      );
}

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get isDarkMode {
    final brightness = ThemeModelInheritedNotifier.of(this).theme.brightness;
    return brightness == Brightness.dark;
  }
}

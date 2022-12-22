import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Theme.dart';

class ThemeService {
  ThemeService._();
  static late SharedPreferences prefs;
  static ThemeService? _instance;
  static MyTheme theme = MyTheme();
  static late String brightness;

  static Future<ThemeService> get instance async {
    if (_instance == null) {
      prefs = await SharedPreferences.getInstance();
      _instance = ThemeService._();
    }
    return _instance!;
  }

  final allThemes = <String, ThemeData>{
    'dark': theme.darkTheme(),
    'light': theme.lightTheme(),
  };

  get initial {
    String? themeName = prefs.getString('theme');
    if (themeName == null) {
      final isPlatformDark =
          WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
      themeName = isPlatformDark ? 'dark' : 'light';
    }
    brightness = themeName;
    return allThemes[themeName];
  }

  save(String newThemeName) {
    prefs.setString('theme', newThemeName);
  }

  ThemeData getByName(String name) {
    return allThemes[name]!;
  }
}

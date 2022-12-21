import 'package:flutter/material.dart';
import '../prefs/theme_preference.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  ThemeMode theme = ThemeMode.system;
  bool isDarkTheme = false;

  getThemeMode() async {
    isDarkTheme = await darkThemePreference.getDarkTheme();
    theme = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  setThemeMode(bool value) {
    isDarkTheme = value;
    theme = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    darkThemePreference.setDarkTheme(isDarkTheme);
    notifyListeners();
  }
}

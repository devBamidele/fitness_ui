import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const darkTheme = "DarkTheme";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(darkTheme, value);
  }

  Future<bool> getDarkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(darkTheme) ?? false;
  }
}

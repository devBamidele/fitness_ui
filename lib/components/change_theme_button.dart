import 'package:fitness_ui/providers/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    return Switch(
      value: themeProvider.isDarkTheme,
      onChanged: (value) {
        final themeProvider =
            Provider.of<DarkThemeProvider>(context, listen: false);
        themeProvider.setThemeMode(value);
      },
    );
  }
}

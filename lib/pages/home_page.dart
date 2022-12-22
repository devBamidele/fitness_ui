import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:fitness_ui/components/change_theme_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Theme'),
          actions: const [
            ChangeThemeButton(),
          ],
        ),
        body: const SafeArea(
          child: Center(
            child: Text(
              'Hello World',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

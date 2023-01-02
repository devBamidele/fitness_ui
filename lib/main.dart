import 'package:fitness_ui/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  final themeService = await ThemeService.instance;
  var initTheme = themeService.initial;
  runApp(
    MyApp(theme: initTheme),
  );
}

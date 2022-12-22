import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:fitness_ui/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'app_router/router.gr.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeService = await ThemeService.instance;
  var initTheme = themeService.initial;
  runApp(MyApp(theme: initTheme));
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    required this.theme,
  }) : super(key: key);
  final ThemeData theme;

  // Get an instance of the App Router
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: theme,
      builder: (_, theme) {
        return MaterialApp.router(
          theme: theme,
          debugShowCheckedModeBanner: false,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        );
      },
    );
  }
}

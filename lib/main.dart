import 'package:fitness_ui/providers/dark_theme_provider.dart';
import 'package:fitness_ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_router/router.gr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Get an instance of the App Router
  final _appRouter = AppRouter();

  final themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    themeChangeProvider.getThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    final theme = MyTheme();
    return ChangeNotifierProvider<DarkThemeProvider>(
      create: (_) => themeChangeProvider,
      child: Consumer<DarkThemeProvider>(
        builder: (context, data, child) {
          return MaterialApp.router(
            themeMode: themeChangeProvider.theme,
            theme: theme.lightTheme(),
            darkTheme: theme.darkTheme(),
            debugShowCheckedModeBanner: false,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          );
        },
      ),
    );
  }
}

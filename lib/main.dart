import 'package:fitness_ui/theme/Theme.dart';
import 'package:flutter/material.dart';

import 'app_router/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // Get an instance of the App Router
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final theme = MyTheme();
    return MaterialApp.router(
      theme: theme.lightTheme(),
      darkTheme: theme.darkTheme(),
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

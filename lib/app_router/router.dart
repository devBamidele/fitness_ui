import 'package:auto_route/auto_route.dart';
import 'package:fitness_ui/pages/home_page.dart';
import 'package:fitness_ui/pages/second_page.dart';

@AdaptiveAutoRouter(
  routes: [
    AutoRoute(page: SecondPage, initial: true),
    /*
     CustomRoute(
      page: SecondPage,
      path: SecondPage.tag,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 250,
    )
     */
  ],
)
class $AppRouter {}

import 'package:auto_route/auto_route.dart';
import 'package:fitness_ui/components/bottom_nav_bar/persistent_tab_view.dart';
import 'package:fitness_ui/pages/second_page.dart';

@AdaptiveAutoRouter(
  routes: [
    AutoRoute(page: CustomPersistentTabView, initial: true),
    CustomRoute(
      page: SecondPage,
      path: SecondPage.tag,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 250,
    )
  ],
)
class $AppRouter {}
/*
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/dashboard',
      page: DashboardPage,
      children: [
        AutoRoute(path: 'users', page: UsersPage),
        AutoRoute(path: 'posts', page: PostsPage),
        AutoRoute(path: 'settings', page: SettingsPage),
      ],
    ),
    AutoRoute(path: '/login', page: LoginPage)
  ],
)
class $AppRouter {}
 */

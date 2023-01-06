// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:fitness_ui/components/bottom_nav_bar/persistent_tab_view.dart'
    as _i1;
import 'package:fitness_ui/pages/second_page.dart' as _i2;
import 'package:flutter/material.dart' as _i4;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    CustomPersistentTabViewRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.CustomPersistentTabView(),
      );
    },
    SecondPageRoute.name: (routeData) {
      return _i3.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.SecondPage(),
        transitionsBuilder: _i3.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          CustomPersistentTabViewRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          SecondPageRoute.name,
          path: '/secondPage',
        ),
      ];
}

/// generated route for
/// [_i1.CustomPersistentTabView]
class CustomPersistentTabViewRoute extends _i3.PageRouteInfo<void> {
  const CustomPersistentTabViewRoute()
      : super(
          CustomPersistentTabViewRoute.name,
          path: '/',
        );

  static const String name = 'CustomPersistentTabViewRoute';
}

/// generated route for
/// [_i2.SecondPage]
class SecondPageRoute extends _i3.PageRouteInfo<void> {
  const SecondPageRoute()
      : super(
          SecondPageRoute.name,
          path: '/secondPage',
        );

  static const String name = 'SecondPageRoute';
}

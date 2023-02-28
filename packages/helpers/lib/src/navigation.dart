import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:helpers/src/tab_route.dart';

class AppNavigation<TRouteName> {
  AppNavigation({
    required this.shellRoutesMap,
    required this.initialLocation,
  }) {
    router = GoRouter(
      initialLocation: initialLocation,
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return TabRoutesScaffold(
              location: state.location,
              routes: shellRoutes,
              child: child,
            );
          },
          routes: shellRoutes.map((route) => route.go).toList(),
        ),
      ],
    );
  }

  final Map<TRouteName, AppRoute> shellRoutesMap;
  final String initialLocation;
  late GoRouter router;

  /// A list of all the routes in the navigation system.
  List<AppRoute> get shellRoutes => shellRoutesMap.values.toList();
}

/// A class that represents a route in the navigation system.
class AppRoute {
  /// The path of the route.
  final String path;

  /// The widget that represents the screen of the route.
  final Widget screen;

  /// The icon that represents the route in the navigation bar.
  final IconData icon;

  /// The name of the route.
  final String name;

  AppRoute({
    required this.path,
    required this.screen,
    required this.icon,
    required this.name,
  });

  /// A `GoRoute` object that represents the route for the `GoRouter`.
  GoRoute get go => GoRoute(path: path, builder: (_, __) => screen);
}

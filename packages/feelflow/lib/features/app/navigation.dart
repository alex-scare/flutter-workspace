import 'package:feelflow/features/app/tab_routes.dart';
import 'package:feelflow/features/home/home_screen.dart';
import 'package:feelflow/features/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';

/// A class that contains the routes and configuration for a navigation system.
class Navigation {
  /// A map that contains the configuration for each route in the navigation system.
  static final routesMap = {
    RouteName.home: AppRoute(
      path: '/',
      screen: const HomeScreen(),
      icon: LineIcons.home,
      name: 'Home',
    ),
    RouteName.settings: AppRoute(
      path: '/settings',
      screen: const SettingScreen(),
      icon: LineIcons.cog,
      name: 'Settings',
    ),
  };

  /// A list of all the routes in the navigation system.
  static List<AppRoute> get routes => routesMap.values.toList();

  /// Getter for the home route.
  static get home => routesMap[RouteName.home];

  /// The router that handles navigation.
  static final router = GoRouter(
    initialLocation: home.path,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return TabRoutesScaffold(
            location: state.location,
            routes: routes,
            child: child,
          );
        },
        routes: routes.map((route) => route.go).toList(),
      ),
    ],
  );
}

/// An enum that contains the names of each route in the navigation system.
enum RouteName { home, settings }

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

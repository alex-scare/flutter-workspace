import 'package:feelflow/features/app/tab_routes.dart';
import 'package:feelflow/features/home/home_screen.dart';
import 'package:feelflow/features/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';

class Navigation {
  static var currentIndex = 0;

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

  static List<AppRoute> get routes => routesMap.values.toList();

  static get home => routesMap[RouteName.home];

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

enum RouteName { home, settings }

class AppRoute {
  final String path;
  final Widget screen;
  final IconData icon;
  final String name;

  AppRoute({
    required this.path,
    required this.screen,
    required this.icon,
    required this.name,
  });

  GoRoute get go => GoRoute(path: path, builder: (_, __) => screen);
}

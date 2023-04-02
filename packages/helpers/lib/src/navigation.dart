import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:helpers/src/tab_route.dart';

class AppNavigation<TRouteName> {
  AppNavigation({
    List<AppRoute> shellRoutes = const [],
    List<AppRoute> routes = const [],
    String initialLocation = '/',
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    router = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: initialLocation,
      routes: [
        if (shellRoutes.isNotEmpty)
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
        ...routes.map((route) => route.go).toList(),
      ],
    );
  }

  late GoRouter router;
}

class AppRoute {
  final String path;
  final Widget screen;
  final IconData? icon;
  final String label;
  final String name;
  final bool requiresAuth;

  AppRoute({
    required this.path,
    required this.screen,
    required this.name,
    this.requiresAuth = false,
  })  : label = '',
        icon = null;

  AppRoute.shell({
    required this.path,
    required this.screen,
    required this.icon,
    required this.name,
    this.label = '',
    this.requiresAuth = false,
  });

  GoRoute get go => GoRoute(path: path, builder: (_, __) => screen, name: name);
}

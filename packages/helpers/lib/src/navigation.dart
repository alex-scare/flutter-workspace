import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:helpers/src/tab_route.dart';

class AppNavigation<TRouteName> {
  AppNavigation({
    this.shellRoutes = const [],
    this.routes = const [],
    required this.initialLocation,
  }) {
    router = GoRouter(
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

  final List<AppRoute> shellRoutes;
  final List<AppRoute> routes;
  final String initialLocation;
  late GoRouter router;
}

class AppRoute {
  final String path;
  final Widget screen;
  final IconData icon;
  final String label;
  final String name;

  AppRoute({
    required this.path,
    required this.screen,
    required this.icon,
    required this.name,
    required this.label,
  });

  /// A `GoRoute` object that represents the route for the `GoRouter`.
  GoRoute get go => GoRoute(path: path, builder: (_, __) => screen, name: name);
}

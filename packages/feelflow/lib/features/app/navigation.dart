import 'package:feelflow/features/home/home_screen.dart';
import 'package:feelflow/features/settings/settings_screen.dart';
import 'package:line_icons/line_icons.dart';
import 'package:helpers/helpers.dart';

/// An enum that contains the names of each route in the navigation system.
enum RouteName { home, settings }

var navigation = AppNavigation(
  shellRoutesMap: {
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
  },
  initialLocation: '/',
);

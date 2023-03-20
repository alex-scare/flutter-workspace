import 'package:another_life/features/home/home.dart';
import 'package:line_icons/line_icons.dart';
import 'package:helpers/helpers.dart';

var navigation = AppNavigation(
  routes: [
    AppRoute(
      path: '/',
      screen: const HomeScreen(),
      icon: LineIcons.home,
      name: 'home',
      label: 'Home',
    ),
  ],
  initialLocation: '/',
);

import 'package:flavourites/features/home/home.dart';
import 'package:line_icons/line_icons.dart';
import 'package:helpers/helpers.dart';

enum RouteName { home }

var navigation = AppNavigation(
  routesMap: {
    RouteName.home: AppRoute(
      path: '/',
      screen: const HomeScreen(),
      icon: LineIcons.home,
      name: 'Home',
    ),
  },
  initialLocation: '/',
);

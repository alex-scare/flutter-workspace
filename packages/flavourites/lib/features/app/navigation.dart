import 'package:flavourites/features/home/home.dart';
import 'package:line_icons/line_icons.dart';
import 'package:helpers/helpers.dart';

var navigation = AppNavigation(
  shellRoutes: [
    AppRoute.shell(
      path: '/',
      screen: const HomeScreen(),
      icon: LineIcons.home,
      name: 'home',
      label: 'Home',
    ),
  ],
  initialLocation: '/',
);

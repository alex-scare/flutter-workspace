import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:helpers/helpers.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:styled_widget/styled_widget.dart';

class TabRoutesScaffold extends HookWidget {
  const TabRoutesScaffold({
    super.key,
    required this.child,
    required this.location,
    required this.routes,
  });

  final Widget child;
  final String location;
  final List<AppRoute> routes;

  @override
  Widget build(BuildContext context) {
    var currentIndex = useState(
      routes.indexWhere((element) => element.path == location),
    );

    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex.value,
        onTap: (index) {
          currentIndex.value = index;
          context.go(routes[index].path);
        },
        itemPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        items: routes.map((route) => route.tab).toList(),
      ).decorated().backgroundColor(context.colors.background),
      body: child,
    );
  }
}

extension TabRoute on AppRoute {
  SalomonBottomBarItem get tab {
    return SalomonBottomBarItem(
      icon: Icon(icon),
      title: Text(name),
    );
  }
}

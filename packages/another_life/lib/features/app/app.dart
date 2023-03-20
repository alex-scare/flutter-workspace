import 'package:another_life/features/app/theme.dart';
import 'package:another_life/features/app/navigation.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flavourites',
      themeMode: ThemeMode.system,
      theme: theme.light,
      darkTheme: theme.dark,
      routerConfig: navigation.router,
    );
  }
}

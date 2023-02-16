import 'package:feelflow/features/app/navigation.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  static FlexScheme theme = FlexScheme.deepBlue;

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const pageTransition = PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'FeelFlow',
      themeMode: ThemeMode.system,
      theme: FlexThemeData.light(
        scheme: theme,
        useMaterial3: true,
        pageTransitionsTheme: pageTransition,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: theme,
        useMaterial3: true,
        pageTransitionsTheme: pageTransition,
      ),
      routerConfig: Navigation.router,
    );
  }
}

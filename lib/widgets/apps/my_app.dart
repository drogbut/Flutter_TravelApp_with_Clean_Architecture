import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:travel_app/router/app_router.dart';
import 'package:travel_app/styleguide/sd_themes.dart';

/// A Widget for the whole flutter app, including theme.
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => MaterialApp.router(
        title: 'burgerme',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: buildLightTheme(),
        darkTheme: buildDarkTheme(),
        routerConfig: _appRouter.router,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel_app/core/routing/app_router.dart';
import 'package:travel_app/core/themes/my_theme.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter_travel_app',
      debugShowCheckedModeBanner: false,
      theme: lightThemeMode(),
      darkTheme: darkThemeMode(),
      routerConfig: AppRouter().router,
    );
  }
}

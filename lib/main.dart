import 'package:flutter/material.dart';
import 'package:travel_app/core/routing/app_router.dart';
import 'package:travel_app/core/themes/my_theme.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: lightThemeMode(),
      //darkTheme: darkThemeMode(),
      routerConfig: AppRouter().router,
    );
  }
}

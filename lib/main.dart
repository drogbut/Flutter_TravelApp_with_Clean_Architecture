import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/routing/app_router.dart';
import 'package:travel_app/core/themes/my_theme.dart';

import 'features/flight_offer/data/repositories_impl/service_api_impl.dart';
import 'features/flight_offer/presentation/stores/language_store.dart';

final apiService = ServiceApi();

void main() async {
  try {
    final accessToken = await apiService.getAccessToken();
    print('My Token ID: $accessToken');
    await apiService.fetchFlightOffers(accessToken);
    print('My Data : $accessToken');
  } catch (e) {
    print('Error: $e');
  }
  runApp(const MyApp());
}

/// A Widget for the whole flutter app, including theme.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => LanguageStore(ServiceApi()),
      child: MaterialApp.router(
        title: 'Flutter_travel_app',
        debugShowCheckedModeBanner: false,
        theme: lightThemeMode(),
        darkTheme: darkThemeMode(),
        routerConfig: AppRouter().router,
      ),
    );
  }
}

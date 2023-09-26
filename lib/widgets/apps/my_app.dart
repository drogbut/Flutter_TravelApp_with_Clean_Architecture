import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:travel_app/config/internationalisation/language_store.dart';
import 'package:travel_app/config/routes/app_router.dart';
import 'package:travel_app/config/theme/sd_themes.dart';
import 'package:travel_app/l10n/l10n.dart';

/// A Widget for the whole flutter app, including theme.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageStore _langStore = LanguageStore();

    return Observer(
      builder: (context) => MaterialApp.router(
        title: 'Flutter_travel_app',
        debugShowCheckedModeBanner: false,
        theme: lightThemeMode(),
        darkTheme: darkThemeMode(),
        routerConfig: AppRouter().router,
        supportedLocales: L10n.all,

        /// Set the current location
        locale: _langStore.currentLocale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}

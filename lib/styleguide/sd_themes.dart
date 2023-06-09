import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/tv_colors.dart';
import 'package:travel_app/styleguide/tv_constants.dart';

ThemeData buildLightTheme() {
  return _buildBaseTheme(_buildColorScheme(Brightness.light));
}

ThemeData buildDarkTheme() {
  final darkColorScheme = _buildColorScheme(Brightness.dark);
  return _buildBaseTheme(darkColorScheme).copyWith(
      // here we can add properties that we want to be different in the dark theme
      );
}

ThemeData _buildBaseTheme(ColorScheme colorScheme) {
  final themeData = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primarySwatch: TvColors.createMaterialColor(TvColors.lime),
    primaryColor: TvColors.lime30,
    scaffoldBackgroundColor: TvColors.anthracite5,

    /// THE DEFAULT TEXT THEME
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 48, fontWeight: FontWeight.bold, letterSpacing: 0),
      displayMedium: TextStyle(
          fontSize: 38, fontWeight: FontWeight.bold, letterSpacing: 0),
      displaySmall: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 0),
      headlineLarge: TextStyle(
          fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: 0),
      headlineMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 0),
      headlineSmall: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 0),
      titleLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 0),
      titleMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.normal, letterSpacing: 0),
      titleSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 0),
      bodyLarge: TextStyle(
          fontSize: 28, fontWeight: FontWeight.normal, letterSpacing: 0),
      bodyMedium: TextStyle(
          fontSize: 22, fontWeight: FontWeight.normal, letterSpacing: 0),
      bodySmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.normal, letterSpacing: 0),
      labelLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.normal, letterSpacing: 0),
      labelMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.normal, letterSpacing: 0),
      labelSmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.normal, letterSpacing: 0),
    ).apply(
      bodyColor: TvColors.anthracite,
      displayColor: TvColors.anthracite,
    ),

    /// PRIMARY BUTTON
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      elevation: TvConstants.elevationZero,
      minimumSize: const Size(
          TvConstants.buttonWidthLarge, TvConstants.buttonHeightMedium),
      padding: const EdgeInsets.symmetric(
          horizontal: TvConstants.paddingLarge,
          vertical: TvConstants.paddingXLarge),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(TvConstants.borderRadiusMedium))),
    ).copyWith(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return TvColors.lime20;
        }
        if (states.contains(MaterialState.pressed)) {
          return TvColors.lime5;
        }
        if (states.contains(MaterialState.disabled)) {
          return TvColors.lime.withOpacity(TvConstants.opacityFactorMedium);
        }
        return TvColors.lime;
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return TvColors.avocado.withOpacity(TvConstants.opacityFactorLarge);
        }
        if (states.contains(MaterialState.pressed)) {
          return TvColors.avocado.withOpacity(TvConstants.opacityFactorLarge);
        }
        if (states.contains(MaterialState.disabled)) {
          return TvColors.avocado.withOpacity(TvConstants.opacityFactorMedium);
        }
        return TvColors.avocado;
      }),
    )),
  );

  return themeData;
}

ColorScheme _buildColorScheme(Brightness brightness) {
  const baseColorScheme = ColorScheme.light(
    primary: TvColors.lime,
    onPrimary: TvColors.anthracite,
    primaryContainer: TvColors.milk,
    secondary: TvColors.aubergine,
    onSecondary: TvColors.milk,
    tertiary: TvColors.milk,
    onTertiary: TvColors.anthracite,
    brightness: Brightness.light,
    background: TvColors.anthracite5,
    onBackground: TvColors.anthracite,
    surface: TvColors.milk,
    onSurface: TvColors.anthracite,
    error: TvColors.error900,
    onErrorContainer: TvColors.anthracite,
    errorContainer: TvColors.error900,
    onError: TvColors.anthracite,
  );
  return brightness == Brightness.dark
      ? baseColorScheme.copyWith(
          brightness: Brightness.dark,
          background: const Color(0xff151515),
          onBackground: const Color(0xffe9e9e9),
          surface: const Color(0xff262626),
          onSurface: const Color(0xffe9e9e9),
          surfaceVariant: const Color(0xff151515),
          outline: const Color(0xffd1d1d1),
        )
      : baseColorScheme;
}

import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/tr_colors.dart';

/// see also:
///   * New Button Themes:https://docs.flutter.dev/release/breaking-changes/buttons
///

class TrThemes {
  /// The configuration of the light theme.
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primarySwatch: TrColors.createMaterialColor(TrColors.lime),
    primaryColor: TrColors.lime30,
    scaffoldBackgroundColor: TrColors.anthracite5,

    /// BASIS WIDGETS THEME
    colorScheme: const ColorScheme(
      primary: TrColors.lime,
      onPrimary: TrColors.anthracite,
      primaryContainer: TrColors.milk,
      secondary: TrColors.aubergine,
      onSecondary: TrColors.milk,
      tertiary: TrColors.milk,
      onTertiary: TrColors.anthracite,
      brightness: Brightness.light,
      background: TrColors.anthracite5,
      onBackground: TrColors.anthracite,
      surface: TrColors.milk,
      onSurface: TrColors.anthracite,
      error: TrColors.error900,
      onErrorContainer: TrColors.anthracite,
      errorContainer: TrColors.error900,
      onError: TrColors.anthracite,
    ),
  );

  /// The configuration of the dark theme.
  static ThemeData darkTheme = lightTheme.copyWith(brightness: Brightness.dark);
}

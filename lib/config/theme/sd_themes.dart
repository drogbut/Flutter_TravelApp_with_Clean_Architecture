import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/tv_colors.dart';
import 'package:travel_app/styleguide/tv_constants.dart';

ThemeData lightThemeMode() {
  ThemeData themeData = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    colorScheme: lightColorScheme,

    /// ICON THEME
    iconButtonTheme: IconButtonThemeData(
        style: ElevatedButton.styleFrom(
      minimumSize: const Size(
          TvConstants.buttonWidthLarge, TvConstants.buttonHeightMedium),
      padding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
    ).copyWith(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return TvColors.outline;
        }
        if (states.contains(MaterialState.pressed)) {
          return const Color(0xFF49454E);
        }
        if (states.contains(MaterialState.disabled)) {
          return const Color(0xFF49454E);
        }
        return Colors.transparent;
      }),
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return TvColors.outline;
        }
        if (states.contains(MaterialState.pressed)) {
          return const Color(0xFFFFFFFF);
        }
        if (states.contains(MaterialState.disabled)) {
          return const Color(0xFFFFFFFF);
        }
        return const Color(0xFFFFFFFF);
      }),
      iconColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return const Color(0xFFFFFFFF);
        }
        if (states.contains(MaterialState.pressed)) {
          return const Color(0xFFFFFFFF);
        }
        if (states.contains(MaterialState.disabled)) {
          return const Color(0xFFFFFFFF);
        }
        return const Color(0xFFFFFFFF);
      }),
    )),

    /// PRIMARY BUTTON
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      minimumSize: const Size(
          TvConstants.buttonWidthLarge, TvConstants.buttonHeightMedium),
      padding: const EdgeInsets.symmetric(
          horizontal: TvConstants.paddingSmall,
          vertical: TvConstants.paddingMedium),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
    ).copyWith(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.transparent;
        }
        if (states.contains(MaterialState.pressed)) {
          return Colors.transparent;
        }
        if (states.contains(MaterialState.disabled)) {
          return Colors.transparent;
        }
        return Colors.transparent;
      }),
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return TvColors.outline;
        }
        if (states.contains(MaterialState.pressed)) {
          return const Color(0xFFFFFFFF);
        }
        if (states.contains(MaterialState.disabled)) {
          return const Color(0xFFFFFFFF);
        }
        return const Color(0xFFFFFFFF);
      }),
      iconColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return const Color(0xFFFFFFFF);
        }
        if (states.contains(MaterialState.pressed)) {
          return const Color(0xFFFFFFFF);
        }
        if (states.contains(MaterialState.disabled)) {
          return const Color(0xFFFFFFFF);
        }
        return const Color(0xFFFFFFFF);
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return const Color(0xFFFFFFFF);
        }
        if (states.contains(MaterialState.pressed)) {
          return const Color(0xFFFFFFFF);
        }
        if (states.contains(MaterialState.disabled)) {
          return const Color(0xFFFFFFFF);
        }
        return const Color(0xFFFFFFFF);
      }),
    )),
  );
  return themeData;
}

ThemeData darkThemeMode() {
  ThemeData themeData = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,

    /// ICON THEME
    iconButtonTheme: IconButtonThemeData(
        style: ElevatedButton.styleFrom(
      minimumSize: const Size(
          TvConstants.buttonWidthLarge, TvConstants.buttonHeightMedium),
    ).copyWith(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return const Color(0xFF49454E);
        }
        if (states.contains(MaterialState.pressed)) {
          return const Color(0xFF49454E);
        }
        if (states.contains(MaterialState.disabled)) {
          return const Color(0xFF49454E);
        }
        return Colors.transparent;
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return const Color(0xFFFFFFFF);
        }
        if (states.contains(MaterialState.pressed)) {
          return const Color(0xFFFFFFFF);
        }
        if (states.contains(MaterialState.disabled)) {
          return const Color(0xFFFFFFFF);
        }
        return const Color(0xFFFFFFFF);
      }),
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return const Color(0xFFFFFFFF);
        }
        if (states.contains(MaterialState.pressed)) {
          return const Color(0xFFFFFFFF);
        }
        if (states.contains(MaterialState.disabled)) {
          return const Color(0xFFFFFFFF);
        }
        return const Color(0xFFFFFFFF);
      }),
      iconColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return const Color(0xFFFFFFFF);
        }
        if (states.contains(MaterialState.pressed)) {
          return const Color(0xFFFFFFFF);
        }
        if (states.contains(MaterialState.disabled)) {
          return const Color(0xFFFFFFFF);
        }
        return const Color(0xFFFFFFFF);
      }),
    )),
  );
  return themeData;
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: TvColors.primary,
  onPrimary: TvColors.onPrimary,
  primaryContainer: TvColors.primaryContainer,
  onPrimaryContainer: TvColors.onPrimaryContainer,
  secondary: TvColors.secondary,
  onSecondary: TvColors.onSecondary,
  secondaryContainer: TvColors.secondaryContainer,
  onSecondaryContainer: TvColors.onSecondaryContainer,
  tertiary: TvColors.tertiary,
  onTertiary: TvColors.onTertiary,
  tertiaryContainer: TvColors.tertiaryContainer,
  onTertiaryContainer: TvColors.onTertiaryContainer,
  error: TvColors.error,
  errorContainer: TvColors.errorContainer,
  onError: TvColors.onError,
  onErrorContainer: TvColors.onErrorContainer,
  background: TvColors.background,
  onBackground: TvColors.onBackground,
  outline: TvColors.outline,
  onInverseSurface: TvColors.onInverseSurface,
  inverseSurface: TvColors.inverseSurface,
  inversePrimary: TvColors.inversePrimary,
  shadow: TvColors.shadow,
  surfaceTint: TvColors.surfaceTint,
  outlineVariant: TvColors.outlineVariant,
  scrim: TvColors.scrim,
  surface: TvColors.surface,
  onSurface: TvColors.onSurface,
  surfaceVariant: TvColors.surfaceVariant,
  onSurfaceVariant: TvColors.onSurfaceVariant,
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFCFBDFF),
  onPrimary: Color(0xFF3A0093),
  primaryContainer: Color(0xFF5300CD),
  onPrimaryContainer: Color(0xFFE8DDFF),
  secondary: Color(0xFF17DECA),
  onSecondary: Color(0xFF003731),
  secondaryContainer: Color(0xFF005048),
  onSecondaryContainer: Color(0xFF4FFBE6),
  tertiary: Color(0xFF4FD8EB),
  onTertiary: Color(0xFF00363D),
  tertiaryContainer: Color(0xFF004F58),
  onTertiaryContainer: Color(0xFF97F0FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C1D),
  onBackground: Color(0xFFE1E3E3),
  outline: Color(0xFF948F99),
  onInverseSurface: Color(0xFF191C1D),
  inverseSurface: Color(0xFFE1E3E3),
  inversePrimary: Color(0xFF6D23F9),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFCFBDFF),
  outlineVariant: Color(0xFF49454E),
  scrim: Color(0xFF000000),
  surface: Color(0xFF101415),
  onSurface: Color(0xFFC4C7C7),
  surfaceVariant: Color(0xFF49454E),
  onSurfaceVariant: Color(0xFFCAC4CF),
);

import 'package:flutter/material.dart';
import 'package:travel_app/core/colors/my_colors.dart';
import 'package:travel_app/core/constants/my_constant.dart';

ThemeData lightThemeMode() {
  ThemeData themeData = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    //scaffoldBackgroundColor: MyColors.background,
    colorScheme: lightColorScheme,

    /// APPBAR THEME
    appBarTheme: const AppBarTheme(
      backgroundColor: MyColors.onBackground,
    ),

    /// ICON THEME
    iconButtonTheme: IconButtonThemeData(
        style: ElevatedButton.styleFrom(
      minimumSize: const Size(
          MyConstants.buttonWidthLarge, MyConstants.buttonHeightMedium),
      padding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
    ).copyWith(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return MyColors.outline;
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
          return MyColors.outline;
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
        return MyColors.primary;
      }),
    )),

    /// PRIMARY BUTTON
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      minimumSize: const Size(
          MyConstants.buttonWidthLarge, MyConstants.buttonHeightMedium),
      padding: const EdgeInsets.symmetric(
          horizontal: MyConstants.paddingSmall,
          vertical: MyConstants.paddingMedium),
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
          return MyColors.outline;
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

    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
    ),
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
          MyConstants.buttonWidthLarge, MyConstants.buttonHeightMedium),
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
  primary: MyColors.primary,
  onPrimary: MyColors.onPrimary,
  primaryContainer: MyColors.primaryContainer,
  onPrimaryContainer: MyColors.onPrimaryContainer,
  secondary: MyColors.secondary,
  onSecondary: MyColors.onSecondary,
  secondaryContainer: MyColors.secondaryContainer,
  onSecondaryContainer: MyColors.onSecondaryContainer,
  tertiary: MyColors.tertiary,
  onTertiary: MyColors.onTertiary,
  tertiaryContainer: MyColors.tertiaryContainer,
  onTertiaryContainer: MyColors.onTertiaryContainer,
  error: MyColors.error,
  errorContainer: MyColors.errorContainer,
  onError: MyColors.onError,
  onErrorContainer: MyColors.onErrorContainer,
  background: MyColors.background,
  onBackground: MyColors.onBackground,
  outline: MyColors.outline,
  onInverseSurface: MyColors.onInverseSurface,
  inverseSurface: MyColors.inverseSurface,
  inversePrimary: MyColors.inversePrimary,
  shadow: MyColors.shadow,
  surfaceTint: MyColors.surfaceTint,
  outlineVariant: MyColors.outlineVariant,
  scrim: MyColors.scrim,
  surface: MyColors.surface,
  onSurface: MyColors.onSurface,
  surfaceVariant: MyColors.surfaceVariant,
  onSurfaceVariant: MyColors.onSurfaceVariant,
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

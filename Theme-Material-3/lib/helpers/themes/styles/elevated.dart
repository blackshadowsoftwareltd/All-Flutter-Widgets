import 'package:flutter/material.dart';
import 'package:theme_material_3/helpers/themes/color_schemes.dart';

///? Light
ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
  padding: const EdgeInsets.symmetric(horizontal: 8),
  foregroundColor: lightColorScheme.onTertiary,
  surfaceTintColor: lightColorScheme.tertiary,
  backgroundColor: lightColorScheme.tertiary,
  splashFactory: InkSparkle.splashFactory,
  shadowColor: lightColorScheme.shadow,
  elevation: 2,
));

///? Dark
ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
  foregroundColor: darkColorScheme.onTertiary,
  surfaceTintColor: lightColorScheme.tertiary,
  backgroundColor: darkColorScheme.tertiary,
  splashFactory: InkSplash.splashFactory,
  shadowColor: lightColorScheme.shadow,
  elevation: 2,
));

// class TD extends ThemeData {}

import 'package:flutter/material.dart';
import '../../themes/color_schemes.dart' show lightColorScheme, darkColorScheme;

///? Light Theme
FloatingActionButtonThemeData lightFloatingButtonTheme =
    FloatingActionButtonThemeData(
  foregroundColor: lightColorScheme.onTertiary,
  backgroundColor: lightColorScheme.tertiary,
  splashColor: lightColorScheme.primary.withOpacity(.3),
  shape: const StadiumBorder(),
  elevation: 3,
);

///? Dark Theme
FloatingActionButtonThemeData darkFloatingButtonTheme =
    FloatingActionButtonThemeData(
  foregroundColor: darkColorScheme.onTertiary,
  backgroundColor: darkColorScheme.tertiary,
  splashColor: darkColorScheme.primary.withOpacity(.3),
  shape: const StadiumBorder(),
  elevation: 3,
);

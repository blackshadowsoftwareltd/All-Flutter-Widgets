import 'package:flutter/material.dart';
import '../../colors/colors.dart' show transparentColor;
import '../../themes/color_schemes.dart' show lightColorScheme, darkColorScheme;

///? Light Theme
IconButtonThemeData lightIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
  foregroundColor: lightColorScheme.onTertiary,
  shadowColor: lightColorScheme.shadow,
  surfaceTintColor: transparentColor,
  backgroundColor: transparentColor,
  padding: const EdgeInsets.all(3),
  shape: const StadiumBorder(),
));

///? Dark Theme
IconButtonThemeData darkIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
  foregroundColor: darkColorScheme.onTertiary,
  shadowColor: darkColorScheme.shadow,
  surfaceTintColor: transparentColor,
  backgroundColor: transparentColor,
  padding: const EdgeInsets.all(3),
  shape: const StadiumBorder(),
));

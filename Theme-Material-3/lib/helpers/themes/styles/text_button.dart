import 'package:flutter/material.dart';
import '../../colors/colors.dart' show transparentColor;
import '../../themes/color_schemes.dart' show darkColorScheme, lightColorScheme;

///? Light Theme
TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
      side: BorderSide(color: lightColorScheme.primary, width: 1)),
  padding: const EdgeInsets.symmetric(horizontal: 10),
  foregroundColor: lightColorScheme.primary,
  iconColor: lightColorScheme.primary,
  surfaceTintColor: transparentColor,
  backgroundColor: transparentColor,
  elevation: 5,
));

///? Dark Theme
TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
      side: BorderSide(color: darkColorScheme.primary, width: 1)),
  padding: const EdgeInsets.symmetric(horizontal: 10),
  foregroundColor: darkColorScheme.primary,
  iconColor: darkColorScheme.primary,
  surfaceTintColor: transparentColor,
  backgroundColor: transparentColor,
  elevation: 5,
));

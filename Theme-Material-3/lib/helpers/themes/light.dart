import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_material_3/helpers/colors/colors.dart';
import 'color_schemes.dart' show lightColorScheme;
import 'styles/appbar.dart' show lightAppBarTheme;
import 'styles/elevated.dart' show lightElevatedButtonTheme;

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: lightAppBarTheme,
  scaffoldBackgroundColor: white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: GoogleFonts.baloo2().fontFamily,
  colorScheme: lightColorScheme,
  elevatedButtonTheme: lightElevatedButtonTheme,
);

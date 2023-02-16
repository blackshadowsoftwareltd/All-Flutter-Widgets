import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_material_3/helpers/colors/colors.dart';
import 'color_schemes.dart' show darkColorScheme;
import 'styles/appbar.dart' show darkAppBarTheme;
import 'styles/elevated.dart' show darkElevatedButtonTheme;

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: darkAppBarTheme,
  scaffoldBackgroundColor: blueGrey900,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: GoogleFonts.baloo2().fontFamily,
  colorScheme: darkColorScheme,
  elevatedButtonTheme: darkElevatedButtonTheme,
);

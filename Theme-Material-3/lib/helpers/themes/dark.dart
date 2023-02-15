import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_material_3/helpers/colors/colors.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: appBarTheme,
  scaffoldBackgroundColor: blueGrey900,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: GoogleFonts.baloo2().fontFamily,
);

/// AppBar
AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: blueGrey800,
  foregroundColor: white,
  systemOverlayStyle: SystemUiOverlayStyle.dark,
  shadowColor: black,
  elevation: 5,
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(200, 10))),
);

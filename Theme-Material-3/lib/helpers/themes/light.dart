import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_material_3/helpers/colors/colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: appBarTheme,
  scaffoldBackgroundColor: white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: GoogleFonts.baloo2().fontFamily,
);

/// AppBar
AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: white,
  foregroundColor: grey800,
  systemOverlayStyle: SystemUiOverlayStyle.light,
  shadowColor: black,
  elevation: 5,
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(200, 10))),
);

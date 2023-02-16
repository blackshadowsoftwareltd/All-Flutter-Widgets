import 'package:flutter/material.dart'
    show AppBarTheme, BorderRadius, Radius, RoundedRectangleBorder;
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import '../../colors/colors.dart' show white, grey800, blueGrey800, black;

/// Light
AppBarTheme lightAppBarTheme = AppBarTheme(
  backgroundColor: white,
  foregroundColor: grey800,
  systemOverlayStyle: SystemUiOverlayStyle.light,
  shadowColor: black,
  elevation: 5,
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(200, 10))),
);

/// Dark
AppBarTheme darkAppBarTheme = AppBarTheme(
  backgroundColor: blueGrey800,
  foregroundColor: white,
  systemOverlayStyle: SystemUiOverlayStyle.dark,
  shadowColor: black,
  elevation: 5,
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(200, 10))),
);

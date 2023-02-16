import 'package:flutter/material.dart';
import 'package:theme_material_3/helpers/colors/colors.dart';

final lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: blue400,
  onPrimary: white,
  primaryContainer: Color(0xFFD5E3FF),
  onPrimaryContainer: Color(0xFF001B3C),
  secondary: teal400,
  onSecondary: black87,
  secondaryContainer: Color(0xFF79F8DC),
  onSecondaryContainer: white,
  tertiary: white, //* done
  onTertiary: black87, //* done
  tertiaryContainer: Color(0xFFFFDAD9),
  onTertiaryContainer: Color(0xFF410009),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: white, //* done
  onBackground: black87, //* done
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF030865),
  surfaceVariant: Color(0xFFE0E2EC),
  onSurfaceVariant: Color(0xFF43474E),
  outline: Color(0xFF74777F),
  onInverseSurface: Color(0xFFF1EFFF),
  inverseSurface: Color(0xFF1E2578),
  inversePrimary: Color(0xFFA7C8FF),
  shadow: black87, //* done
  surfaceTint: Color(0xFF005EB3),
  outlineVariant: Color(0xFFC4C6CF),
  scrim: Color(0xFF000000),
);

final darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: blue400,
  onPrimary: white,
  primaryContainer: Color(0xFF004689),
  onPrimaryContainer: Color(0xFFD5E3FF),
  secondary: teal400,
  onSecondary: white,
  secondaryContainer: Color(0xFF005144),
  onSecondaryContainer: Color(0xFF79F8DC),
  tertiary: blueGrey800, //* done
  onTertiary: white, //* done
  tertiaryContainer: Color(0xFF920020),
  onTertiaryContainer: Color(0xFFFFDAD9),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: blueGrey900, //* done
  onBackground: white, //* done
  surface: Color(0xFF030865),
  onSurface: Color(0xFFE0E0FF),
  surfaceVariant: Color(0xFF43474E),
  onSurfaceVariant: Color(0xFFC4C6CF),
  outline: Color(0xFF8E9199),
  onInverseSurface: Color(0xFF030865),
  inverseSurface: Color(0xFFE0E0FF),
  inversePrimary: Color(0xFF005EB3),
  shadow: black87, //* done
  surfaceTint: Color(0xFFA7C8FF),
  outlineVariant: Color(0xFF43474E),
  scrim: Color(0xFF000000),
);

import 'package:flutter/material.dart';

void printer() {
  getMaterialColorShades(Colors.green)[50];
}

const primaryColors = [
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
];

Map<int, Color> getMaterialColorShades(MaterialColor materialColor) {
  return {
    50: materialColor.shade50,
    100: materialColor.shade100,
    200: materialColor.shade200,
    300: materialColor.shade300,
    400: materialColor.shade400,
    500: materialColor.shade500,
    600: materialColor.shade600,
    700: materialColor.shade700,
    800: materialColor.shade800,
    900: materialColor.shade900,
  };
}

MaterialColor getMaterialColorFromColor(Color color) {
  Map<int, Color> colorShades = {
    50: getShade(color, value: 0.5),
    100: getShade(color, value: 0.4),
    200: getShade(color, value: 0.3),
    300: getShade(color, value: 0.2),
    400: getShade(color, value: 0.1),
    500: color,
    600: getShade(color, value: 0.1, darker: true),
    700: getShade(color, value: 0.15, darker: true),
    800: getShade(color, value: 0.2, darker: true),
    900: getShade(color, value: 0.25, darker: true),
  };
  return MaterialColor(color.value, colorShades);
}

Color getShade(Color color, {bool darker = false, double value = .1}) {
  assert(value >= 0 && value <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness(
      (darker ? (hsl.lightness - value) : (hsl.lightness + value))
          .clamp(0.0, 1.0));

  return hslDark.toColor();
}

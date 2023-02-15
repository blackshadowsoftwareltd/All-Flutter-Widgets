import 'package:flutter/material.dart' show MaterialStateProperty, Color;

///? Switch Color
MaterialStateProperty<Color?>? swColor(Color color) =>
    MaterialStateProperty.resolveWith<Color>((states) => color);

///? Hex to Color
Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

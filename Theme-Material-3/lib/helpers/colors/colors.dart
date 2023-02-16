import 'package:flutter/material.dart'
    show Color, Colors, MaterialState, MaterialStateProperty;

import 'methods.dart' show hexToColor;

Color transparentColor = Colors.transparent;

///? blue
Color blue400 = Colors.blue.shade400;
Color blue300 = Colors.blue.shade300;

///? grey
Color grey100 = Colors.grey.shade100;
Color grey50 = Colors.grey.shade50;
Color grey800 = Colors.grey.shade800;
Color grey = Colors.grey;

///? teal
Color teal = Colors.teal;
Color teal300 = Colors.teal.shade300;
Color teal400 = Colors.teal.shade400;

///? purple
Color purple400 = Colors.deepPurple.shade400;

///? lime
Color lime300 = Colors.lime.shade300;
Color lime200 = Colors.lime.shade200;

///? red
Color red600 = Colors.red.shade600;
Color red400 = Colors.red.shade400;
Color red300 = Colors.red.shade300;
Color red200 = Colors.red.shade200;
Color red = Colors.red;

///? Deep Orange
Color deepOrange = Colors.deepOrange;
Color deepOrange300 = Colors.deepOrange.shade300;

///? orange
Color orange = Colors.orange;

///? agGold
Color agGold = hexToColor('#c49f2e');

///? black
Color black = Colors.black;
Color black87 = Colors.black87;
Color black54 = Colors.black54;
Color black38 = Colors.black38;
Color black26 = Colors.black26;
Color black12 = Colors.black12;

///? white
Color white = Colors.white;
Color white54 = Colors.white54;
Color white70 = Colors.white70;

///? blue grey
Color blueGrey = Colors.blueGrey;
Color blueGrey700 = Colors.blueGrey.shade700;
Color blueGrey800 = Colors.blueGrey.shade800;
Color blueGrey900 = Colors.blueGrey.shade900;

///? green
Color green = Colors.green;
Color green200 = Colors.green.shade200;

///? yellow
Color yellow = Colors.yellow;

///? indigo
Color indigo900 = Colors.indigo.shade900;
Color indigo100 = Colors.indigo.shade100;

Color getBlueColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return blue300;
  }
  return blue300;
}

Color getTealColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return teal300;
  }
  return teal400;
}

MaterialStateProperty<Color?> colorToMatColor(Color c) =>
    MaterialStateProperty.all<Color>(c);
MaterialStateProperty<double?> doubleToMatDouble(double c) =>
    MaterialStateProperty.all<double>(c);

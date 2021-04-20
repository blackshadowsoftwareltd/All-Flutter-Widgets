import 'package:flutter/material.dart';
import 'package:google_map_markers_polylines_directions/MapScreen.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MapScreen();
  }
}

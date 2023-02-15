import 'package:flutter/material.dart';
import 'package:theme_material_3/modules/home/home.dart';

void main() {
  runApp(const MaterialApp(
    home: Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}

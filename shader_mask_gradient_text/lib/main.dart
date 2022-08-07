import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(colors: [
          Colors.orange,
          Colors.green,
          Colors.blue,
          Colors.red,
          Colors.purple,
          Colors.blueGrey
        ]).createShader(bounds),
        child: const Text(
          'REMON AHAMMAD',
          style: TextStyle(
              color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}

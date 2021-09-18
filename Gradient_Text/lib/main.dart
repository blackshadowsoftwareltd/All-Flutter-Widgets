import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Gradient Text')),

        ///
        body: Center(
            child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (rect) => LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.green, Colors.blue]).createShader(rect),
                child: Text('Gradient Text',
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w900)))));
  }
}

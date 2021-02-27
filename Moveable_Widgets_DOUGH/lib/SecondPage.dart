import 'package:dough/dough.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    /// The Full Screen will moving
    return DoughRecipe(
      data: DoughRecipeData(adhesion: 5, viscosity: 50000),
      child: PressableDough(
        child: Scaffold(
          appBar: AppBar(),
          body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Floating Action Button will moving
                PressableDough(
                    child: FloatingActionButton(
                        child: Icon(Icons.fingerprint, size: 35),
                        onPressed: () => print('pressed'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

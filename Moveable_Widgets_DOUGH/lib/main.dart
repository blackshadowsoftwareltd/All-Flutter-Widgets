
import 'package:dough/dough.dart';
import 'package:flutter/material.dart';

import 'Gyroscope.dart';
import 'SecondPage.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dough')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DoughRecipe(

                /// This DoughRecipeData is the moving properties
                data: DoughRecipeData(adhesion: 2, viscosity: 3500),

                /// Pressable Dough
                child: PressableDough(
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.navigate_next,
                      size: 35,
                    ),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SecondPage())),
                  ),
                )),
            DoughRecipe(

                /// This DoughRecipeData is the moving properties
                data: DoughRecipeData(adhesion: 2, viscosity: 3500),

                /// Pressable Dough
                child: PressableDough(
                  child: Container(
                    width: 200,
                    color: Colors.deepOrange,
                    child: FlatButton(
                      child: Text(
                        'GyroScope',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GyroScope())),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

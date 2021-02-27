import 'package:dough/dough.dart';
import 'package:flutter/material.dart';


class GyroScope extends StatefulWidget {
  @override
  _GyroScopeState createState() => _GyroScopeState();
}

class _GyroScopeState extends State<GyroScope> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GyroScope')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(child: _GyroDough()),
      ),
    );
  }

  Widget _GyroDough() {
    return DoughRecipe(
        data: DoughRecipeData(adhesion: 20),
        child: GyroDough(
          child: _Container(),
        ));
  }

  Widget _Container() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors. deepOrange),
      alignment: Alignment.center,
      child: Text(
        'Gravity',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}

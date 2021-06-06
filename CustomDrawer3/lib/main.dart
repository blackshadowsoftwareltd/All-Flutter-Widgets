import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [DrawerPage(), HomePage()],
      ),
    );
  }

  Widget DrawerPage() => Container(
        color: Colors.green,
      );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double xOffset = 0, yOffset = 0, scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (e) =>setState((){
        if (isDrawerOpen != true && e.delta.dx > 0) {
          xOffset = 250;
          yOffset = 150;
          scaleFactor = .6;
          isDrawerOpen = true;
        } else if (isDrawerOpen == true && e.delta.dx < 0) {
          xOffset = 0;
          yOffset = 0;
          scaleFactor = 1;
          isDrawerOpen = false;
        }
      })
        
      ,
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(color: Colors.blue,borderRadius:isDrawerOpen!=true?BorderRadius.all(Radius.circular(0)): BorderRadius.all(Radius.circular(20))),
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: IconButton(
          icon: Icon(isDrawerOpen != true ? Icons.menu : Icons.arrow_back,
              size: 25, color: Colors.white),
          onPressed: () => setState(() {
            if (isDrawerOpen != true) {
              xOffset = 250;
              yOffset = 150;
              scaleFactor = .6;
              isDrawerOpen = true;
            } else {
              xOffset = 0;
              yOffset = 0;
              scaleFactor = 1;
              isDrawerOpen = false;
            }
          }),
        ),
      ),
    );
  }
}

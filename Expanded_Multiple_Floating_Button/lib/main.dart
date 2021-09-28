import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final isDialOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          /// close speed dial
          isDialOpen.value = false;
          return false;
        }
        return true;
      },
      child: Scaffold(
          appBar: AppBar(title: Text('Expanded Multiple Floating Button')),
          floatingActionButton: SpeedDial(
            overlayColor: Colors.black, // full screen color
            overlayOpacity: .3,
            animationSpeed: 500,
            animatedIcon: AnimatedIcons.menu_close,
            spacing: 10,
            openCloseDial: isDialOpen, // for controlling the back button
            children: [
              SpeedDialChild(child: Icon(Icons.camera), label: 'Camera'),
              SpeedDialChild(child: Icon(Icons.image), label: 'Images'),
              SpeedDialChild(child: Icon(Icons.copy), label: 'Copy'),
              SpeedDialChild(
                  child: Icon(Icons.facebook, color: Colors.white),
                  backgroundColor: Colors.blue),
            ],
          )),
    );
  }
}

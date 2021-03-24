import 'package:Orientation_Portrait_Landscape/AllWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orientation')),
      body: Container(
          margin: EdgeInsets.all(10),
          child: OrientationBuilder(
              builder: (context, orientation) =>
                  orientation == Orientation.portrait
                      ? _PortraitMode()
                      : _LandScape(context))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              child: Icon(Icons.cancel_outlined, size: 35),
              onPressed: () => reSetRotations(),
            ),
            FloatingActionButton(
              child: Icon(Icons.screen_rotation, size: 30),
              onPressed: () => setRotations(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _PortraitMode() =>
      ListView(children: [KtmImage(context), Descriptions(context)]);
  Widget _LandScape(BuildContext context) =>
      Row(children: [KtmImage(context), Descriptions(context)]);

  setRotations() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    isPortrait ? setLandScapMode() : setPortraitMode();
  }

  Future reSetRotations() =>
      SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  Future setLandScapMode() async => await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  Future setPortraitMode() async => await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

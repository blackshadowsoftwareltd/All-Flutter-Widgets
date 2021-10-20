import 'package:flutter/material.dart';
import 'pinch_to_zoom.dart';
import 'pinch_to_zoom_over_appbar.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pinch to zoom in/out'),
        ),
        body: const Center(child: PinchToZoomImageOverAppBar()));
  }
}

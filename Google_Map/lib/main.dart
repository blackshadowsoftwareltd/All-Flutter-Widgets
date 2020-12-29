import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CameraPosition _initialPosition =
      CameraPosition(target: LatLng(23.861650, 90.000320));
  GoogleMapController _controller;

  final List<Marker> marker = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Map')),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        mapType: MapType.hybrid,
        onMapCreated: (controller) {
          setState(() {
            _controller = controller;
          });
        },
        onTap: (cordinate) {
          _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
          addMarker(cordinate);
        },
        markers: marker.toSet(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.zoom_in, ),
      //   onPressed: () {
      //     _controller.animateCamera(CameraUpdate.zoomIn());
      //   },
      // ),
    );
  }

  addMarker(cordinate) {
    int id = Random().nextInt(100);
    setState(() {
      marker
          .add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
    });
  }
}

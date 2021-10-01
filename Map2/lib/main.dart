import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ///
  LatLng initialCameraPosition =
      const LatLng(23.868888254401853, 89.99902095726385);
  Completer<GoogleMapController> completerController = Completer();
  Location location = Location();

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: initialCameraPosition, zoom: 15),
                mapType: MapType.satellite,
                onMapCreated: onMapCreated,
                myLocationEnabled: true,
              ),
              Positioned(
                  left: 20,
                  bottom: 40,
                  right: 70,
                  child: Container(
                    color: Colors.white10,
                    height: 45,
                    child: FloatingActionButton.extended(
                        backgroundColor: Colors.white,
                        onPressed: () async {
                          await location
                              .getLocation()
                              .then((value) => print(value));
                        },
                        label: const Text('Set Location',
                            style: TextStyle(color: Colors.black))),
                  ))
            ])));
  }

  void onMapCreated(GoogleMapController gController) {
    completerController.complete(gController);
    location.onLocationChanged.listen((event) async {
      final GoogleMapController controller = await completerController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(event.latitude!, event.longitude!), zoom: 15)));
    });
  }
}

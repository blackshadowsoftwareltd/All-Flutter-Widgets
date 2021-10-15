import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animarker/flutter_map_marker_animation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//Setting dummies values
const kStartPosition = LatLng(23.78931275589739, 89.81012198084424);
const kSantoDomingo = CameraPosition(target: kStartPosition, zoom: 15);
const kMarkerId = MarkerId('MarkerId1');
const kDuration = Duration(seconds: 2);
const kLocations = [
  kStartPosition,
  LatLng(23.79151428788661, 89.81156842971208),
  LatLng(23.79545860619184, 89.81036544248242),
  LatLng(23.811313295376518, 89.81058026163791),
  LatLng(23.821663659589987, 89.81534924688916),
  LatLng(23.827454262805702, 89.81466182563516),
  LatLng(23.83600868546983, 89.81310080646342),
  LatLng(23.84346223230647, 89.81143953841575),
  LatLng(23.845400870195814, 89.818657461479),
  LatLng(23.845820031355856, 89.82949866795025),
  LatLng(23.845479463054417, 89.838893425565),
  LatLng(23.847260887456024, 89.84919042327765),
  LatLng(23.84998537156321, 89.86212253617592),
  LatLng(23.85158335970028, 89.87209014483356),
];

class SimpleMarkerAnimationExample extends StatefulWidget {
  @override
  SimpleMarkerAnimationExampleState createState() =>
      SimpleMarkerAnimationExampleState();
}

class SimpleMarkerAnimationExampleState
    extends State<SimpleMarkerAnimationExample> {
  final markers = <MarkerId, Marker>{};
  final controller = Completer<GoogleMapController>();
  final stream = Stream.periodic(kDuration, (count) => kLocations[count])
      .take(kLocations.length);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps Markers Animation Example',
      home: Animarker(
        curve: Curves.easeIn,
        rippleRadius: 0.2,
        useRotation: true,
        duration: const Duration(milliseconds: 2000),
        mapId: controller.future
            .then<int>((value) => value.mapId), //Grab Google Map Id
        markers: markers.values.toSet(),
        child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: kSantoDomingo,
            onMapCreated: (gController) {
              stream.forEach((value) => newLocationUpdate(value));
              controller.complete(gController);
              //Complete the future GoogleMapController
            }),
      ),
    );
  }

  void newLocationUpdate(LatLng latLng) {
    var marker = RippleMarker(
        markerId: kMarkerId,
        position: latLng,
        ripple: true,
        onTap: () {
          print('Tapped! $latLng');
        });
    setState(() => markers[kMarkerId] = marker);
  }
}

void main() {
  runApp(SimpleMarkerAnimationExample());
}

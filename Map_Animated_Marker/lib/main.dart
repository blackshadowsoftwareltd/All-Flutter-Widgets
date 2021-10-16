import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animarker/flutter_map_marker_animation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//Setting dummies values
const kStartPosition = LatLng(23.78931275589739, 89.81012198084424);
const kSantoDomingo = CameraPosition(target: kStartPosition, zoom: 15);
const kMarkerId = MarkerId('MarkerId1');
const kDuration = Duration(seconds: 2);

List<LatLng> latlong = [
  kStartPosition,
  const LatLng(23.79151428788661, 89.81156842971208),
  const LatLng(23.79545860619184, 89.81036544248242),
  const LatLng(23.811313295376518, 89.81058026163791),
  const LatLng(23.821663659589987, 89.81534924688916),
  const LatLng(23.827454262805702, 89.81466182563516),
  const LatLng(23.83600868546983, 89.81310080646342),
  const LatLng(23.84346223230647, 89.81143953841575),
  const LatLng(23.845400870195814, 89.818657461479),
  const LatLng(23.845820031355856, 89.82949866795025),
  const LatLng(23.845479463054417, 89.838893425565),
  const LatLng(23.847260887456024, 89.84919042327765),
  const LatLng(23.84998537156321, 89.86212253617592),
  const LatLng(23.85158335970028, 89.87209014483356),
];
final Set<Marker> _markers = {};
final Set<Polyline> _polyline = {};

class SimpleMarkerAnimationExample extends StatefulWidget {
  @override
  SimpleMarkerAnimationExampleState createState() =>
      SimpleMarkerAnimationExampleState();
}

class SimpleMarkerAnimationExampleState
    extends State<SimpleMarkerAnimationExample> {
  final markers = <MarkerId, Marker>{};
  final controller = Completer<GoogleMapController>();
  final stream = Stream.periodic(kDuration, (count) => latlong[count])
      .take(latlong.length);

  @override
  void initState() {
    super.initState();
    _onAddMarkerButtonPressed();
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
            polylines: _polyline,
            markers: _markers,
            myLocationEnabled: true,
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

  void _onAddMarkerButtonPressed() {
    // getDistanceTime();
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(kStartPosition.toString()),
        //_lastMapPosition is any coordinate which should be your default
        //position when map opens up
        position: kStartPosition,
        infoWindow: const InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      _polyline.add(Polyline(
          polylineId: PolylineId(kStartPosition.toString()),
          visible: true,
          //latlng is List<LatLng>
          points: latlong,
          color: Colors.blue,
          width: 5));
    });
  }
}

void main() {
  runApp(SimpleMarkerAnimationExample());
}



/// with original api key
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:flutter_polyline_points/flutter_polyline_points.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Polyline example',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.orange,
//       ),
//       home: MapScreen(),
//     );
//   }
// }

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   late GoogleMapController mapController;
//   // double _originLatitude = 6.5212402, _originLongitude = 3.3679965;
//   // double _destLatitude = 6.849660, _destLongitude = 3.648190;
//   double _originLatitude = 26.48424, _originLongitude = 50.04551;
//   double _destLatitude = 26.46423, _destLongitude = 50.06358;
//   Map<MarkerId, Marker> markers = {};
//   Map<PolylineId, Polyline> polylines = {};
//   List<LatLng> polylineCoordinates = [];
//   PolylinePoints polylinePoints = PolylinePoints();
//   String googleAPiKey = "AIzaSyCjgMEeIexEzBVe6rcYzCj10JExtbtUxys";

//   @override
//   void initState() {
//     super.initState();

//     /// origin marker
//     _addMarker(LatLng(_originLatitude, _originLongitude), "origin",
//         BitmapDescriptor.defaultMarker);

//     /// destination marker
//     _addMarker(LatLng(_destLatitude, _destLongitude), "destination",
//         BitmapDescriptor.defaultMarkerWithHue(90));
//     _getPolyline();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: GoogleMap(
//         initialCameraPosition: CameraPosition(
//             target: LatLng(_originLatitude, _originLongitude), zoom: 15),
//         myLocationEnabled: true,
//         tiltGesturesEnabled: true,
//         compassEnabled: true,
//         scrollGesturesEnabled: true,
//         zoomGesturesEnabled: true,
//         onMapCreated: _onMapCreated,
//         markers: Set<Marker>.of(markers.values),
//         polylines: Set<Polyline>.of(polylines.values),
//       )),
//     );
//   }

//   void _onMapCreated(GoogleMapController controller) async {
//     mapController = controller;
//   }

//   _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
//     MarkerId markerId = MarkerId(id);
//     Marker marker =
//         Marker(markerId: markerId, icon: descriptor, position: position);
//     markers[markerId] = marker;
//   }

//   _addPolyLine() {
//     PolylineId id = PolylineId("poly");
//     Polyline polyline = Polyline(
//         polylineId: id, color: Colors.red, points: polylineCoordinates);
//     polylines[id] = polyline;
//     setState(() {});
//   }

//   _getPolyline() async {
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//         googleAPiKey,
//         PointLatLng(_originLatitude, _originLongitude),
//         PointLatLng(_destLatitude, _destLongitude),
//         travelMode: TravelMode.driving,
//         wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]);
//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     }
//     _addPolyLine();
//   }
// }
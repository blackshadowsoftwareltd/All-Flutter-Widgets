import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'directions_model.dart';
import 'directions_repository.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(37.773972, -122.431297), zoom: 11.5);
  GoogleMapController _googleMapController;
  Marker _origin, _destination;
  Directions _info;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _googleMapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Google Map'),
        actions: [
          if (_origin != null)
            TextButton(
                child: Text('Origin'),
                style: TextButton.styleFrom(
                    primary: Colors.green,
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: () => _googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(CameraPosition(
                        target: _origin.position, zoom: 14.5, tilt: 50.0)))),
          if (_destination != null)
            TextButton(
                child: Text('Destination'),
                style: TextButton.styleFrom(
                    primary: Colors.blue,
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: () => _googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(CameraPosition(
                        target: _destination.position,
                        zoom: 14.5,
                        tilt: 50.0)))),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              if (_origin != null) _origin,
              if (_destination != null) _destination
            },
            onLongPress: _addMarker,
            polylines: {
              if (_info != null)
                Polyline(
                    polylineId: PolylineId('overview_polyline'),
                    color: Colors.red,
                    width: 3,
                    points: _info.polylinePoints
                        .map((e) => LatLng(e.latitude, e.longitude)))
            },
          ),
          if (_info != null)
            Positioned(
              top: 20,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0)
                    ]),
                child: Text(
                  '${_info.totalDestance}, ${_info.totalDuration}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.center_focus_weak),
        onPressed: () => _googleMapController.animateCamera(_info != null
            ? CameraUpdate.newLatLngBounds(_info.bounds, 100.0)
            : CameraUpdate.newCameraPosition(_initialCameraPosition)),
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      /// origin is not set or origin/destination are both set. set origin
      setState(() {
        _origin = Marker(
            markerId: MarkerId('origin'),
            infoWindow: InfoWindow(title: 'Origin'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            position: pos);

        /// reset destination
        _destination = null;
        _info = null;
      });
    } else {
      /// origin is already set. set destination
      setState(() {
        _destination = Marker(
            markerId: MarkerId('destination'),
            infoWindow: InfoWindow(title: 'Destination'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: pos);
      });

      /// get directions
      final directions = await DirectionsRepository().getDirections(
          origin: _origin.position, destination: _destination.position);
      setState(() => _info = directions);
    }
  }
}

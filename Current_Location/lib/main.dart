import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var locationMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Current Location')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.location_on,
                  size: 35,
                  color: Colors.blue,
                )),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Get user Location',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                locationMessage,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            FlatButton(
              color: Colors.grey[300],
              child: Text('Get Current lLocation'),
              onPressed: () {
                getCurrentLocation();
              },
            )
          ],
        ),
      ),
    );
  }

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("........${first.featureName} : ${first.addressLine}");
    setState(() {
      locationMessage = '${first.addressLine}';
    });
  }
}

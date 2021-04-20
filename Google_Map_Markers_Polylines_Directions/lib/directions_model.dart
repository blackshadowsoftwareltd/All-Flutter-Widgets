import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Directions {
  final LatLngBounds bounds;
  final List<PointLatLng> polylinePoints;
  final String totalDestance;
  final String totalDuration;

  Directions(
      {this.bounds,
      this.polylinePoints,
      this.totalDestance,
      this.totalDuration});

  factory Directions.fromMap(Map<String, dynamic> map) {
    /// check if route is not available

    if ((map['routes'] as List).isEmpty) return null;

    /// get route information
    final data = Map<String, dynamic>.from(map['routes'][0]);

    /// bounds
    final northeast = data['bounds']['northeast'];
    final southwest = data['bounds']['southwest'];
    final bounds = LatLngBounds(
        southwest: LatLng(southwest['lat'], southwest['lng']),
        northeast: LatLng(northeast['lat'], northeast['lng']));

    /// distance & duration
    String distance = '', duration = '';
    if ((data['legs'] as List).isNotEmpty) {
      final leg = data['legs'][0];
      distance = leg['distance']['text'];
      duration = leg['duration']['text'];
    }
    return Directions(
        bounds: bounds,
        polylinePoints: PolylinePoints()
            .decodePolyline(data['overview_polyline']['points']),
        totalDestance: distance,
        totalDuration: duration);
  }
}

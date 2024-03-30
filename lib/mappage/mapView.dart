import 'package:arosaje_mobile/mappage/mapViewController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:latlong2/latlong.dart';

class Flower {
  final LatLng position;
  final String imageUrl;

  Flower({required this.position, required this.imageUrl});
}

class MapView extends GetView<MapViewController> {
  MapView({Key? key}) : super(key: key);
  final _positionStream =
      const LocationMarkerDataStreamFactory().fromGeolocatorPositionStream(
    stream: Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        timeLimit: Duration(minutes: 1),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocator Settings Example'),
      ),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(0, 0),
          initialZoom: 15,
          minZoom: 0,
          maxZoom: 19,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName:
                'net.tlserver6y.flutter_map_location_marker.example',
            maxZoom: 19,
          ),
          CurrentLocationLayer(
            positionStream: _positionStream,
          ),
        ],
      ),
    );
  }
}

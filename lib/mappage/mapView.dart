import 'package:arosaje_mobile/uiKit/XNavbar.dart';
import 'package:arosaje_mobile/uiKit/XTextfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:arosaje_mobile/mappage/mapViewController.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class Flower {
  final LatLng position;
  final String imageUrl;

  Flower({required this.position, required this.imageUrl});
}

class MapView extends GetView<MapViewController> {
  MapView({Key? key}) : super(key: key);
  final List<Flower> flowers = [
    Flower(position: LatLng(48.866667, 2.333333), imageUrl: 'assets/rose.jpg'),
    Flower(
        position: LatLng(48.85684190130435, 2.143681502360275),
        imageUrl: 'assets/banzai.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Arrosaje",
        ),
        backgroundColor: const Color.fromARGB(255, 11, 225, 3),
        elevation: 3,
        toolbarHeight: 70,
      ),
      body: Container(
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(45.3, 14.2),
            zoom: 10,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              maxZoom: 19,
            ),
            CurrentLocationLayer(),
          ],
        ),
      ),
    );
  }
}

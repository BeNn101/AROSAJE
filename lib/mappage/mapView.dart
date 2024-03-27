import 'package:arosaje_mobile/uiKit/XNavbar.dart';
import 'package:arosaje_mobile/uiKit/XTextfiled.dart';
import 'package:flutter/material.dart';
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
    Flower(
        position: LatLng(45.3367, 14.1594),
        imageUrl: 'https://example.com/flower1.jpg'),
    Flower(
        position: LatLng(45.2641, 14.2525),
        imageUrl: 'https://example.com/flower2.jpg'),
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
      body:FlutterMap(
    options: MapOptions(
      initialCenter: LatLng(51.509364, -0.128928),
      initialZoom: 9.2,
    ),
    children: [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.app',
      ),
      RichAttributionWidget(
        attributions: [
          TextSourceAttribution(
            'OpenStreetMap contributors',
            onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
          ),
        ],
      ),
    ],
  )
    );
  }
}

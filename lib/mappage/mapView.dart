import 'dart:async';
import 'dart:math' as math;

import 'package:arosaje_mobile/uiKit/XNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatefulWidget {
  MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  LatLng _currentLocation = LatLng(0, 0);
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Arrosaje",
        ),
        backgroundColor: Color.fromARGB(0, 137, 51, 51),
        elevation: 3,
        toolbarHeight: 70,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : FlutterMap(
              options: MapOptions(
                center: _currentLocation,
                zoom: 15,
                minZoom: 2,
                maxZoom: 19,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  maxZoom: 19,
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 40,
                      height: 40,
                      point: _currentLocation,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Blue circle
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.withOpacity(0.4),
                            ),
                          ),
                          // Blue pulsating dot
                          TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0.0, end: 2 * math.pi),
                            duration: const Duration(milliseconds: 1000),
                            builder: (context, angle, child) {
                              return Transform.rotate(
                                angle: angle,
                                child: child,
                              );
                            },
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(45.819538, 4.899116),
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            // Action à effectuer lorsque le marqueur est cliqué
                            print('Marker clicked');
                          },
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Rose_Papa_Meilland.jpg/800px-Rose_Papa_Meilland.jpg',
                          ),
                        ),
                      ),
                    ),
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(45.821041, 4.894384),
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            // Action à effectuer lorsque le marqueur est cliqué
                            print('Marker clicked');
                          },
                          child: Image.network(
                            'https://www.shutterstock.com/image-photo/beauty-banzai-trees-600nw-1023682414.jpg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
      bottomNavigationBar: const XNavbar(),
    );
  }
}

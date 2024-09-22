import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:arosaje_mobile/freeze/plantes.dart';
import 'package:arosaje_mobile/freeze/user.dart';
import 'package:arosaje_mobile/uiKit/XNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class MapView extends StatefulWidget {
  MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  LatLng _currentLocation = LatLng(0, 0);
  bool _isLoading = true;
  var currentUser = Rx<User?>(null);
  var token=''.obs;
  var listPlant = <Plant>[].obs; 
  
  @override
  void initState() {
    super.initState();
    _getLocation();
        token.value = Get.arguments['token'] ?? 0;
    getCurrentUser();
    getAllPlant();
  }

  /* Future<void> _getLocation() async {
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
  } */
 Future<void> _getLocation() async {
  if (await Permission.location.request().isGranted) {
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
  } else {
    print('Location permission not granted');
  }
}

    Future<void> getCurrentUser() async {

  final url = Uri.parse('http://172.16.1.148:8000/api/me'); 
  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> user = json.decode(response.body);
    currentUser.value = User.fromJson(user['user']);

  } else {
     Get.offAllNamed('login');
    throw Exception('Erreur de chargement des données : ${response.statusCode}');
  }}


    Future<void> getAllPlant() async {
    try {
      final url = Uri.parse('http://172.16.1.148:8000/api/getAllPlantes');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> plantData = json.decode(response.body);
        listPlant.value = List<Plant>.from(plantData.map((plant) => Plant.fromJson(plant)));
      } else {
        Get.snackbar('Erreur', 'Identifiants invalides');
        throw Exception('Erreur de chargement des données : ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors du chargement des plantes: $e');
      Get.snackbar('Erreur', 'Erreur lors du chargement des plantes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'lib/assets/logo.png', // Assurez-vous que votre logo est dans le répertoire 'assets' et référencé dans pubspec.yaml
          height: 60, // Augmenter la taille du logo
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.white],
              begin: Alignment.topCenter, // Dégradé vertical de haut en bas
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 3,
        toolbarHeight: 70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
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
                    if(listPlant.value.isNotEmpty)
                    ...List.generate(4, (index) {
                      
                      final markerData = listPlant[index];
                      List<String> coordinates = markerData.localisationPlante.split(', '); 
double latitude = double.parse(coordinates[0]);
double longitude = double.parse(coordinates[1]);
                     return Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(latitude,longitude),
                  child: Container(
                    child: GestureDetector(
                      onTap: () {
                        print('Marker at index $index clicked');
                      },
                      child: Image.network('http://172.16.1.148:8000/'+markerData.image,  loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return const CircularProgressIndicator();
                                      },),
                    ),
                  ),
                );
                      
                    },)
                    /* Marker(
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
                    ), */
                  ],
                ),
              ],
            ),
      bottomNavigationBar: Obx(()=> XNavbar(token: token.value, currentIndex: 3,isadmin: currentUser.value?.userType)),
    );
  }
}

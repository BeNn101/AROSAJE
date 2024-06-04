
import 'dart:convert';

import 'package:arosaje_mobile/freeze/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';


class PublishViewViewController extends GetxController  {
  var userId = 0.obs; // Utilisez Rx<int> si vous souhaitez que les modifications soient observables.
  TextEditingController namePlanteTextingController =TextEditingController();
  TextEditingController namePlanteTexting = TextEditingController();
  TextEditingController localisationTexting = TextEditingController();
  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);
  LatLng currentLocation = LatLng(0, 0);
  
  @override
  void onInit() {
    super.onInit();
    getLocation();
    userId.value = Get.arguments['userId'] ?? 0; 
  }
  final ImagePicker _picker = ImagePicker();
  Rx<String?> imageFilePath = Rx<String?>(null);

  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFilePath.value = pickedFile.path;
    }
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      imageBytes.value = bytes;
    }

  }

  Future<void> pickImageFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imageFilePath.value = pickedFile.path;
    }
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      imageBytes.value = bytes;
    }

  }

Future<void> createPlante() async {

  final url = Uri.parse('http://172.16.1.49:8000/api/plantes');
  
  var imageBase64 =base64Encode(imageBytes.value!);
  
  // Les données que vous souhaitez envoyer dans le corps de la requête
  Map<String, dynamic> data = {
    'name_plante': namePlanteTextingController.value.text,
    'image': '${imageBase64}', // Assurez-vous que imageFilePath contient le chemin valide de l'image
    'localisation': 'currentLocation',
    'id_user': userId.value, // Assurez-vous que userId contient une valeur valide
    // Ajoutez d'autres données si nécessaire
  };

  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data), 
  );

  if (response.statusCode == 201) {

     Get.snackbar('Succes', 'Plante poster');
    print('Plante créée avec succès');
  } else {
   
 
  }
}

  void test() {
    if (namePlanteTextingController.value.text.isNotEmpty) {
      createPlante();
    } else {
      // Handle empty text case if needed
    }
  }

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
        currentLocation = LatLng(position.latitude, position.longitude);
    } catch (e) {
      print("Error: $e");
    }
  }
}
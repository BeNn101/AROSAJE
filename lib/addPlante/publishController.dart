
import 'dart:convert';

import 'package:arosaje_mobile/freeze/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


class PublishViewViewController extends GetxController  {
  var userId = 0.obs; // Utilisez Rx<int> si vous souhaitez que les modifications soient observables.
  TextEditingController namePlanteTextingController =TextEditingController();
  TextEditingController namePlanteTexting = TextEditingController();
   TextEditingController localisationTexting = TextEditingController();
  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);

  
  @override
  void onInit() {
    super.onInit();
    // Exemple de récupération de l'userId des arguments de navigation
    userId.value = Get.arguments['userId'] ?? 0; // Assurez-vous que cela est un int
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

  final url = Uri.parse('http://172.16.1.8:8000/api/plantes');
  
  var imageBase64 =base64Encode(imageBytes.value!);
  
  // Les données que vous souhaitez envoyer dans le corps de la requête
  Map<String, dynamic> data = {
    'name_plante': "namePlanteTexting.value.text",
    'image': '${imageBase64}', // Assurez-vous que imageFilePath contient le chemin valide de l'image
    'localisation': 'Loc5',
    'id_user': userId.value, // Assurez-vous que userId contient une valeur valide
    // Ajoutez d'autres données si nécessaire
  };

  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data), // Convertit les données en JSON
  );

  if (response.statusCode == 200) {
    // Plante créée avec succès
    print('Plante créée avec succès');
  } else {
    // Échec de la création de la plante
 
  }
}

  void test() {
    if (namePlanteTextingController.value.text.isNotEmpty) {
      createPlante();
    } else {
      // Handle empty text case if needed
    }
  }
  
}
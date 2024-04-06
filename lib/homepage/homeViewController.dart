import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:arosaje_mobile/freeze/plantes.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  var userId = Rxn<int>();
  var listPlant = <Plant>[].obs; // Utilisez RxList pour une liste observable
  late File imageFile; // Utilisez late pour une initialisation différée de l'image
  RxBool isSkeletonLoader= true.obs;
  @override
  void onInit() {
    // Ne pas oublier d'appeler super.onInit()
    super.onInit();
    // Charger les données des plantes lors de l'initialisation du contrôleur
    getAllPlant();
    // Récupérer et vérifier les arguments
    final argument = Get.arguments;
    if (argument is Map<String, dynamic> && argument.containsKey('userId')) {
      userId.value = argument['userId'];
    } else if (argument is int) {
      userId.value = argument;
    } else {
      print("Erreur: L'userId n'est pas fourni dans les arguments de navigation.");
    }
    isSkeletonLoader.value=false;
  }

  Future<void> getAllPlant() async {
    try {
      final url = Uri.parse('http://172.16.1.8:8000/api/getAllPlantes');
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
}

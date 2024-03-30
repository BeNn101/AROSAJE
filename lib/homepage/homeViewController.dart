import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:arosaje_mobile/freeze/plantes.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  var userId = Rxn<int>(); // Utilise Rxn pour une valeur pouvant être nulle.
   List<Plant> listPlant = [];
  File imageFile = File('/data/user/0/com.example.arosaje_mobile/cache/af21ebb7-1f7d-481d-9bde-65a6dc03dd7a6648591903563287108.jpg');

  @override 
  void onReady(){
    imageFile;
    getAllPlant();
    super.onReady();
  }
  @override
  void onInit() {
    getAllPlant();
    super.onInit();
    // Récupération et vérification des arguments
    final argument = Get.arguments;
    imageFile;
    // Si l'argument est une map et contient la clé 'userId'
    if (argument is Map<String, dynamic> && argument.containsKey('userId')) {
      // S'assurer que la valeur de 'userId' est bien un int avant de la définir
      userId.value = argument['userId'];
    } else if (argument is int) {
      // Si l'argument passé est directement un int, l'utiliser directement
      userId.value = argument;
    } else {
      // Logique par défaut ou gestion d'erreur si 'userId' n'est pas trouvé
      print("Erreur: L'userId n'est pas fourni dans les arguments de navigation.");
    }
  }
  Future<void> getAllPlant() async {
    final url = Uri.parse('http://192.168.1.40:8000/api/getAllPlantes');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> plantData = json.decode(response.body);
      listPlant = List<Plant>.from(plantData.map((plant) => Plant.fromJson(plant)));
    } else {
      Get.snackbar('Erreur', 'Identifiants invalides');
      throw Exception('Erreur de chargement des données : ${response.statusCode}');
      
    }
  }

}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:arosaje_mobile/freeze/plantes.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  var userId = Rxn<int>(); // Utilise Rxn pour une valeur pouvant être nulle.
   List<Plant> listPlant = [];

  @override 
  void onReady(){
    getAllPlant();
    super.onReady();
  }
  @override
  void onInit() {
    super.onInit();
    // Récupération et vérification des arguments
    final argument = Get.arguments;
    
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

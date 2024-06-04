
import 'dart:convert';

import 'package:arosaje_mobile/freeze/plantes.dart';
import 'package:arosaje_mobile/freeze/user.dart';
import 'package:arosaje_mobile/logPage/loginViewController.dart';
import 'package:arosaje_mobile/model/user_provider.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class AccountViewController extends GetxController {
  var userId = 0.obs;
 var currentUser = Rx<User?>(null);
 RxList<Plant> listUserPlant = <Plant>[].obs;

  @override
  void onInit() {
    userId.value = Get.arguments['userId'] ?? 0;
    getCurrentUser();
    getAllPlant();
    super.onInit();
  }

  Future<void> getCurrentUser() async {
    final url = Uri.parse('http://172.16.1.49:8000/api/users/${userId.value}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final userData = json.decode(response.body);
      currentUser.value = User.fromJson(userData);
      // Informe GetX que les valeurs ont été mises à jour
      update();
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<void> getAllPlant() async {
    try {
      final url = Uri.parse('http://172.16.1.49:8000/api/getAllPlantes');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> plantData = json.decode(response.body);
        listUserPlant.value = List<Plant>.from(plantData.map((plant) => Plant.fromJson(plant)));
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

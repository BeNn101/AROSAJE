
import 'dart:convert';

import 'package:arosaje_mobile/freeze/plantes.dart';
import 'package:arosaje_mobile/freeze/user.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class AccountViewController extends GetxController {
  var token = ''.obs;
 var currentUser = Rx<User?>(null);
 RxList<Plant> listUserPlant = <Plant>[].obs;
 RxList<Plant> listUserMyPlant = <Plant>[].obs;

  @override
  void onInit() {
    token.value = Get.arguments['token'] ?? 0;
    getCurrentUser().then((_) {
      getAllPlant();
    });
    super.onInit();
  }

  Future<void> getAllPlant() async {
    try {
      final url = Uri.parse('http://192.168.1.4:8000/api/getAllPlantes');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> plantData = json.decode(response.body);
        listUserMyPlant.value = List<Plant>.from(plantData.map((plant)  => Plant.fromJson(plant)).where((element) => element.idUser==currentUser.value?.idUser));
      } else {
        Get.snackbar('Erreur', 'Identifiants invalides');
        throw Exception('Erreur de chargement des données : ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors du chargement des plantes: $e');
      Get.snackbar('Erreur', 'Erreur lors du chargement des plantes');
    }
  }
Future<void> getCurrentUser() async {

  final url = Uri.parse('http://192.168.1.4:8000/api/me'); 
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
  }
}
}

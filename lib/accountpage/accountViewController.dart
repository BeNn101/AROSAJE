
import 'dart:convert';

import 'package:arosaje_mobile/freeze/user.dart';
import 'package:arosaje_mobile/logPage/loginViewController.dart';
import 'package:arosaje_mobile/model/user_provider.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class AccountViewController extends GetxController  {
  // Utilisez le suffixe 'Controller' pour distinguer les contrôleurs des instances de modèles
  var userId = 0.obs; // Utilisez Rx<int> si vous souhaitez que les modifications soient observables.
  User? currentUser ;
  @override
  
    @override 
  void onReady(){
     getCurrentUser();
    super.onReady();
  }
  
  void onInit() {
    userId.value = Get.arguments['userId'] ?? 0;
     getCurrentUser();
    super.onInit();
    // Exemple de récupération de l'userId des arguments de navigation
    
  }

 Future<void> getCurrentUser() async {
  final url = Uri.parse('http://192.168.1.40:8000/api/users/${userId.value}');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final userData = json.decode(response.body); // Pas besoin de le traiter comme une liste

    // Initialiser currentUser avec l'objet User récupéré
    currentUser = User.fromJson(userData);
  } else {
    throw Exception('Failed to load user data');
  }
}

  
}
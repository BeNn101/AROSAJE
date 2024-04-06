
import 'dart:convert';

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

  @override
  void onInit() {
    userId.value = Get.arguments['userId'] ?? 0;
    getCurrentUser();
    super.onInit();
  }

  Future<void> getCurrentUser() async {
    final url = Uri.parse('http://172.16.1.8:8000/api/users/${userId.value}');
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
}

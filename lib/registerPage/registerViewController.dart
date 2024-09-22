import 'dart:convert';

import 'package:arosaje_mobile/uiKit/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class RegisterViewController extends GetxController {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController surnameTextController = TextEditingController();
  var acceptsRgpd = false.obs;
  String ip = Constants.ipAddress;
  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> register() async {
    
  final url = Uri.parse('http://172.16.1.148:8000/api/users/createUser');

    Map<String, dynamic> data = {
      'mot_de_passe': passwordTextController.value.text,
      'email': emailTextController.value.text,
      'telephone': phoneTextController.value.text,
      'nom': nameTextController.value.text,
      'prenom': surnameTextController.value.text,
    };

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      Get.snackbar('Succes', 'Utilisateurs créé');
      Get.offAllNamed('/login');
    } else {
      Get.snackbar('Erreur', 'Identifiants invalides');
    }
  }
}

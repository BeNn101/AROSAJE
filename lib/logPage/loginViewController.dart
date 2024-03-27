import 'dart:convert';
import 'package:arosaje_mobile/freeze/user.dart';
import 'package:arosaje_mobile/model/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class LoginViewController extends GetxController {
  var name, password;
  List<User> listUser = [];
 
  
  @override
  void onInit() {
    getUsers(); 
    loginView(password, name);
    super.onInit();
  }

  Future<void> getUsers() async {
    final url = Uri.parse('http://192.168.1.40:8000/api/users/alluser');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> userData = json.decode(response.body);
      listUser = List<User>.from(userData.map((user) => User.fromJson(user)));
    } else {
      Get.snackbar('Erreur', 'Identifiants invalides');
      throw Exception('Erreur de chargement des données : ${response.statusCode}');
      
    }
  }

   loginView(password, name) {
    for (var i = 0; i < listUser.length; i++) {
      if (listUser[i].email == name && listUser[i].password == password) { 
        int currentUSer=listUser[i].idUser;
        Get.offAllNamed('home',arguments: currentUSer);
      }
    }
  }
}

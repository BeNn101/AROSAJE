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
    final url = Uri.parse('http://172.16.1.49:8000/api/users/alluser');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> userData = json.decode(response.body);
      listUser = List<User>.from(userData.map((user) => User.fromJson(user)));
    } else {
      Get.snackbar('Erreur', 'Identifiants invalides');
      throw Exception('Erreur de chargement des données : ${response.statusCode}');
      
    }
  }

   Future<void> postLogin(name, password,currentUSer) async {
    final url = Uri.parse('http://172.16.1.49:8000/api/login');
    Map<String, dynamic> data = {
      'email': name,
      'mot_de_passe': password,
    };

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      print('Message envoyé avec succès');
        Get.offAllNamed('home',arguments: currentUSer);

    } else {
      Get.snackbar('Erreur', 'Identifiants invalides');
      throw Exception('Erreur de chargement des données : ${response.statusCode}');
      
    }
  }

   loginView(password, name) {
    for (var i = 0; i < listUser.length; i++) {
      if (listUser[i].email == name ) { 
        int currentUSer=listUser[i].idUser;
        postLogin(name,password,currentUSer);
      }
    }
  }
}

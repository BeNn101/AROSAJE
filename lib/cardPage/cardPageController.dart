import 'dart:convert';

import 'package:arosaje_mobile/freeze/plantes.dart';
import 'package:arosaje_mobile/freeze/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class CardPageController extends GetxController {
  var token = '';
  
  String? imageUrl ;
  String? imageTitle ;
  Plant? plant;
  String? nameRecipient;
var currentUser = Rx<User?>(null);
  TextEditingController message = TextEditingController();

  @override
  void onInit() {
    token= Get.arguments[1];
    plant = Get.arguments[0];
    getCurrentUser();
    getCurrentUserRecipient();
    if (plant!.image.isNotEmpty) {
    imageUrl = 'http://192.168.1.4:8000/' + plant!.image;
  }
  imageTitle=plant!.namePlante;
    //userId.value = Get.arguments['userId'] ?? 0;
    super.onInit();
 
  }
  
   Future<void> register() async {
    
  final url = Uri.parse('http://192.168.1.4:8000/api/chats/insert');

    Map<String, dynamic> data = {
     'id_user' : currentUser.value?.idUser,
            'id_recipient' :  plant?.idUser,
            'title' : plant?.namePlante,
            'name_recipient' : nameRecipient,
    };

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      Get.snackbar('Succes', 'Message créé');
    } else {
      Get.snackbar('Erreur', 'Identifiants invalides');
    }
  }

  
  Future<void> getCurrentUser() async {

  final url = Uri.parse('http://192.168.1.4:8000/api/me'); 
  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer ${token}',
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

 Future<void> getCurrentUserRecipient() async {
    final url = Uri.parse('http://192.168.1.4:8000/api/users/${plant?.idUser}');
    final response = await http.get(url);
   print(response);
    if (response.statusCode == 200) {
      final userData = json.decode(response.body);
      currentUser.value = User.fromJson(userData);
      nameRecipient=currentUser.value?.firstName;
      // Informe GetX que les valeurs ont été mises à jour
      update();
    } else {
      throw Exception('Failed to load user data');
    }
  }
  
}

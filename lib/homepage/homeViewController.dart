import 'dart:convert';
import 'dart:io';

import 'package:arosaje_mobile/freeze/user.dart';
import 'package:arosaje_mobile/homepage/widget/XcustomShearch.dart';
import 'package:arosaje_mobile/uiKit/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:arosaje_mobile/freeze/plantes.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  var userId;
  var listPlant = <Plant>[].obs; 
  late File imageFile; 
  RxBool isSkeletonLoader= true.obs;
  String ip =Constants.ipAddress;
  var currentUser = Rx<User?>(null);
  var token;
  @override
  void onInit() {
    getAllPlant();
    final argument = Get.arguments;
    if (argument is Map<String, dynamic> && argument.containsKey('userId')) {
      userId = argument['userId'];
    } else if (argument is int) {
      userId = argument;
    } else {
    
      userId = argument[1];
      token=argument[1];
       getCurrentUser();
          super.onInit();
    }
    isSkeletonLoader.value=false;
  }

  Future<void> getAllPlant() async {
    try {
      final url = Uri.parse('http://172.16.1.148:8000/api/getAllPlantes');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> plantData = json.decode(response.body);
        listPlant.value = List<Plant>.from(plantData.map((plant) => Plant.fromJson(plant)));
      } else {
        Get.snackbar('Erreur', 'Identifiants invalides');
        throw Exception('Erreur de chargement des données : ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors du chargement des plantes: $e');
      Get.snackbar('Erreur', 'Erreur lors du chargement des plantes');
    }
  }

   void startSearch(BuildContext context) {
    showSearch(
      context: context,
      delegate: CustomSearchDelegate(listPlant),
    );
  }

  Future<void> getCurrentUser() async {

  final url = Uri.parse('http://172.16.1.148:8000/api/me'); 
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

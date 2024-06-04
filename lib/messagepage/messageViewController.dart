import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:arosaje_mobile/freeze/chatHistorical.dart';

class MessageViewController extends GetxController {
  var userId = 0.obs;
  var listMessage = RxList<ChatHistorical>();

  TextEditingController message = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    userId.value = Get.arguments['userId'] ?? 0;
    getMessage(); 
  }
  
  Future<void> getMessage() async {
    final url = Uri.parse('http://172.16.1.49:8000/api/getAllMessages');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> r = json.decode(response.body);
      listMessage.assignAll(
          r.map((message) => ChatHistorical.fromJson(message)).toList());
    } else {
      Get.snackbar('Erreur', 'Identifiants invalides');
      throw Exception('Erreur de chargement des données : ${response.statusCode}');
    }
  }

  Future<void> postMessage(message) async {
    final url = Uri.parse('http://172.16.1.49:8000/api/postMessages');
    Map<String, dynamic> data = {
      'id_user': userId.value,
      'id_destinataire': 2,
      'message': message,
      'image': 'l'
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
    } else {
      // Gérer les erreurs ici
    }
  }
}

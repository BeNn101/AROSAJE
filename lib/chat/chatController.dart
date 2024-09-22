import 'package:arosaje_mobile/freeze/chat.dart';
import 'package:arosaje_mobile/freeze/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:arosaje_mobile/freeze/chatHistorical.dart';

class ChatViewController extends GetxController {
  var token =''.obs;
  var listMessage = RxList<ChatHistorical>();
  var listMessageHistorical = RxList<ChatHistorical>();
  var listUserMessage = RxList<Chat>();
  var selectedRecipientId,selectedRecipientId2;
  User? currentUser;
  TextEditingController message = TextEditingController();

  @override
  void onInit() {
        token.value = Get.arguments[1];
        selectedRecipientId = Get.arguments[0];
        selectedRecipientId2 = Get.arguments[2];
    getCurrentUser();
    super.onInit();
    getMessage(); 


  }
  @override
void onReady() async {
  super.onReady();
  await getCurrentUser();
  if(selectedRecipientId != currentUser!.idUser){
     getChatHistorical(selectedRecipientId,currentUser!.idUser);
  }else if(selectedRecipientId2 != currentUser!.idUser){
    getChatHistorical(selectedRecipientId2,currentUser!.idUser);
  }
      
}
  
  Future<void> getMessage() async {
    final url = Uri.parse('http://172.16.1.148:8000/api/getAllMessages');
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

   Future<void> getChatHistorical(int idRecipient, int idUser) async {

  // Construire l'URL avec les paramètres idRecipient et idUser
  final url = Uri.parse('http://172.16.1.148:8000/api/chatHistorical?id_user=$idUser&id_destinataire=$idRecipient');
  
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> r = json.decode(response.body);
    listMessageHistorical.assignAll(
      r.map((message) => ChatHistorical.fromJson(message)).toList(),

    );
  } else {
    Get.snackbar('Erreur', 'Impossible de charger les messages');
    throw Exception('Erreur de chargement des données : ${response.statusCode}');
  }
}

  Future<void> postMessage(message, int idDestinataire) async {
   await getCurrentUser();
    final url = Uri.parse('http://172.16.1.148:8000/api/postMessages');
    if (currentUser?.idUser!=idDestinataire) {
       Map<String, dynamic> data = {
      'id_user': currentUser?.idUser,
      'id_destinataire': idDestinataire,
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
    }else{
      Get.snackbar('Erreur', "Impossible d'envoyer un message id incorrect");
    }
   
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
    currentUser = User.fromJson(user['user']);

  } else {
     Get.offAllNamed('login');
    throw Exception('Erreur de chargement des données : ${response.statusCode}');
  }
}

}

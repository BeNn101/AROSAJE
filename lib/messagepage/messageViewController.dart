import 'package:arosaje_mobile/freeze/chat.dart';
import 'package:arosaje_mobile/freeze/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:arosaje_mobile/freeze/chatHistorical.dart';

class MessageViewController extends GetxController {
  var token =''.obs;
  var listMessage = RxList<ChatHistorical>();
  var listMessageHistorical = RxList<ChatHistorical>();
  var listUserMessage = RxList<Chat>();
  var selectedRecipientId;
     var currentUser = Rx<User?>(null);
  TextEditingController message = TextEditingController();

  @override
  void onInit() {
        token.value = Get.arguments['token'] ?? 0;
    super.onInit();
    getMessage(); 

  }
  @override
void onReady() async {
  super.onReady();
  await getCurrentUser();
  if (currentUser.value != null) {
    getChatsByUser(currentUser.value!.idUser);
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
    final url = Uri.parse('http://172.16.1.148:8000/api/postMessages');
    Map<String, dynamic> data = {
      'id_user': currentUser.value?.idUser,
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

Future<void> getChatsByUser(int idUser) async {
  final url = Uri.parse('http://172.16.1.148:8000/api/chats/$idUser');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> chatData = json.decode(response.body);
    // Traite les données comme tu le souhaites, par exemple assigner à une liste
    List<Chat> chats = chatData.map((data) => Chat.fromJson(data)).toList();
   listUserMessage.value=chats;
   print('${listUserMessage.value}');
  } else {
    Get.snackbar('Erreur', 'Impossible de récupérer les chats');
  }
}
Future<void> getUserRecipient(int i, int recipientId) async {
    final url = Uri.parse('http://172.16.1.148:8000/api/users/$recipientId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final userData = json.decode(response.body);
      /* currentUser.value = User.fromJson(userData);
      listUserMessage[i].copyWith(name_recipient: currentUser.value!.firstName); */
      // Informe GetX que les valeurs ont été mises à jour
      update();
    } else {
      throw Exception('Failed to load user data');
    }
  }
}


import 'dart:convert';

import 'package:arosaje_mobile/freeze/chatHistorical.dart';
import 'package:arosaje_mobile/freeze/user.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class MessageViewController extends GetxController  {
  var userId = 0.obs; // Utilisez Rx<int> si vous souhaitez que les modifications soient observables.
  List<ChatHistorical> listMessage = [];
  TextEditingController message=TextEditingController();
  @override
  void onInit() {
    super.onInit();
    userId.value = Get.arguments['userId'] ?? 0; // Assurez-vous que cela est un int
  }

    Future<void> getMessage() async {
    final url = Uri.parse('http://192.168.1.40:8000/api/getAllMessages');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> r = json.decode(response.body);
      listMessage = List<ChatHistorical>.from(r.map((listMessage) => ChatHistorical.fromJson(listMessage)));
    } else {
      Get.snackbar('Erreur', 'Identifiants invalides');
      throw Exception('Erreur de chargement des données : ${response.statusCode}');
      
    }
  }


  Future<void> postMessage(message) async {
  final url = Uri.parse('http://192.168.1.40:8000/api/postMessages');
  // Les données que vous souhaitez envoyer dans le corps de la requête
  Map<String, dynamic> data = {
    'id_user':userId.value,
    'id_destinataire':2,
    'message':message,
  };

  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data), 
  );
  if (response.statusCode == 200) {
    print('Plante créée avec succès');
  } else {
   
 
  }
}
  }
  
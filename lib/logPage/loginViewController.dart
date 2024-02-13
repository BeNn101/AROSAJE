
import 'dart:convert';
import 'dart:io';


import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';
import 'package:http/http.dart' as http;

class LoginViewController extends GetxController {
 var email,password;
  @override
  void onInit() {
    super.onInit();
    
  }
Future<void> fetchData() async {
  final url = Uri.parse('http://10.52.73.187:3000/api/user');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Le corps de la réponse est une chaîne JSON que nous devons décoder.
      final jsonData = jsonDecode(response.body);

      // Faites quelque chose avec les données ici.
      print(jsonData);
    } else {
      // Gérer les erreurs ici, par exemple :
      print('Erreur de requête: ${response.statusCode}');
    }
  } catch (e) {
    // Gérer les erreurs ici, par exemple :
    print('Erreur: $e');
  }
}



}

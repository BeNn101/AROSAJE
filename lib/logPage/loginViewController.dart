import 'dart:convert';
import 'package:arosaje_mobile/freeze/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginViewController extends GetxController {
  var email, password;
  List<User> listUser = [];

  @override
  void onInit() {
    getUsers(); 
    super.onInit();
  }

  Future<void> getUsers() async {
    final url = Uri.parse('http://192.168.1.40:8000/api/users/alluser');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> userData = json.decode(response.body);
      listUser = List<User>.from(userData.map((user) => User.fromJson(user)));
    } else {
      throw Exception('Erreur de chargement des données : ${response.statusCode}');
    }
  }

    loginView(password, name) {
    for (var i = 0; i < listUser.length; i++) {
      if (listUser[i].email==name && listUser[i].password==password) {
          Get.offAllNamed('home' , arguments: listUser[i]);
      }else{
         Get.snackbar('Erreur', 'Identifiants invalides');
      }
    }
  }
}

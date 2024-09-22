
import 'package:arosaje_mobile/freeze/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class AdminPageViewController extends GetxController {
  var token =''.obs;
  var currentUser = Rx<User?>(null);
 RxList<User> listUser = <User>[].obs;

  @override
  void onInit() {
        token.value = Get.arguments['token'] ?? 0;
    getCurrentUser();
    getUsers();
    super.onInit();

  }
  @override
void onReady() async {
  super.onReady();
  await getCurrentUser();
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

 Future<void> getUsers() async {
    final url = Uri.parse('http://172.16.1.148:8000/api/users/alluser');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> userData = json.decode(response.body);
      listUser.value= List<User>.from(userData.map((user) => User.fromJson(user)));
    } else {
      Get.snackbar('Erreur', 'chargement des donnéess');
      throw Exception('Erreur de chargement des données : ${response.statusCode}');
      
    }
  }

   Future<void> deleteUser(int idUser) async {
    final url = Uri.parse('http://172.16.1.148:8000/api/usersDelete/$idUser');
    final response = await http.delete(url);

    if (response.statusCode == 200) {
       Get.snackbar('Succes', 'Utilisateurs supprimer');
    } else {
      throw Exception('Failed to load user data');
    }
  }

}

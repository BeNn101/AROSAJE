import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:arosaje_mobile/freeze/user.dart';

class UserRepositiry implements Repository{
  

  Future<List<User>> getUsers() async {
  final response = await http.get('$apiUrl/plants');

  if (response.statusCode == 200) {
    final List<dynamic> User = json.decode(response.body);
    return List<User>.from(jsonData.map((user) => User.fromJson(user)));
  } else {
    throw Exception('Erreur de chargement des données : ${response.statusCode}');
  }
}
}


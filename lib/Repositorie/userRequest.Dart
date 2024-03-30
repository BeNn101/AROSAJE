import 'package:flutter/material.dart';

class UserRepositiry {
  

  Future<List<Plant>> getPlants() async {
  final response = await http.get('$apiUrl/plants');

  if (response.statusCode == 200) {
    final List<dynamic> plantData = json.decode(response.body);
    return plantData.map((data) => Plant.fromJson(data)).toList();
  } else {
    throw Exception('Erreur de chargement des données : ${response.statusCode}');
  }
}
}


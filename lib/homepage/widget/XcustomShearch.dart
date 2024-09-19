import 'package:arosaje_mobile/freeze/plantes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List data;
  final String token;
   // La liste de données à rechercher

  CustomSearchDelegate(this.data,this.token);

 @override
Widget buildSuggestions(BuildContext context) {
  List<Plant> matchQuery = [];
  for (var plant in data) {
    if (plant != null &&
        plant.namePlante.toLowerCase().contains(query.toLowerCase())) {
      matchQuery.add(plant);
    }
  }

  return ListView.builder(
    itemBuilder: (context, index) {
      var plant = matchQuery[index];
      return ListTile(
        title: Text(plant.namePlante),
        onTap: () {
          Get.toNamed('plantView',arguments: [plant,token]);
        },
        // Ajoutez ici d'autres éléments de Player que vous souhaitez afficher
      );
    },
    itemCount: matchQuery.length,
  );
}



  @override
  Widget buildResults(BuildContext context) {
    // Mettez en œuvre la logique pour afficher les résultats de la recherche ici
    return Center(
      child: Text('Résultats de recherche pour : $query'),
    );
  }
  
  @override
  List<Widget>? buildActions(BuildContext context) {
   return[
 IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        query="";
      },
    )
   ];  
  }
  
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){close(context ,null);},
     icon: Icon(Icons.arrow_back_ios)
     );
    
  }
}

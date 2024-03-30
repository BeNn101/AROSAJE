import 'dart:convert';
import 'dart:typed_data';

import 'package:arosaje_mobile/freeze/user.dart';
import 'package:arosaje_mobile/homepage/homeViewController.dart';
import 'package:arosaje_mobile/homepage/widget/plant-body.dart';
import 'package:arosaje_mobile/uiKit/XNavbar.dart';
import 'package:arosaje_mobile/uiKit/XTextfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HomeView extends GetView<HomeViewController> {
  const HomeView({Key? key});
  
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Arrosaje",
        ),
        backgroundColor: const Color.fromARGB(255, 11, 225, 3),
        elevation: 3,
        toolbarHeight: 70,
      ),
      body: Column(
        children: [
          Xtextfield(
            onPressed: () {
              //controller.search();
            },
          ).build(),
           Text(
            "Annonce ",
            textAlign: TextAlign.left,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: controller.listPlant.length,
              itemBuilder: (context, index) {
               String base64String = controller.listPlant[index].image; // Récupérer la chaîne Base64
    if (base64String.length % 4 != 0) {
      // Si la longueur n'est pas un multiple de 4, ajouter des signes "=" pour la compléter
      while (base64String.length % 4 != 0) {
        base64String += '=';
      }
    }
    print(base64String);
    // Décoder la chaîne Base64 et créer un widget Image à partir des bytes décodés
    Uint8List imageBytes = base64Decode(base64String);
                return Card(
     child: Center(
       child: Column(children: [
        SizedBox(height: 10,),
       Image.memory(imageBytes,
       height: 100,
       width: 100,),
      /*   Text('data'), */
        Text(controller.listPlant[index].namePlante),
        /* Text('hgs69') */
       ]),
     ),
    );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar:  XNavbar(userId: controller.userId.value!??1)

    );
  }
}

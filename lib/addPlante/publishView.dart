import 'dart:io';

import 'package:arosaje_mobile/addPlante/publishController.dart';
import 'package:arosaje_mobile/uiKit/XNavbar.dart';
import 'package:arosaje_mobile/uiKit/Xtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PublishView extends GetView<PublishViewViewController> {
  const PublishView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'lib/assets/logo.png', // Assurez-vous que votre logo est dans le répertoire 'assets' et référencé dans pubspec.yaml
            height: 60, // Augmenter la taille du logo
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.white],
                begin: Alignment.topCenter, // Dégradé vertical de haut en bas
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 3,
          toolbarHeight: 70,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            color: Colors.white70,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 5,
                  ),
                  const Text('Déposer une Annonces'),
                  const SizedBox(
                    height: 20,
                  ),
                  XTextField(
                      hintText: 'Nom de la plante',
                      controller: controller.namePlanteTextingController),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: controller.pickImageFromGallery,
                    child: Container(
                      width: 200,
                      height: 50,
                      color: const Color.fromARGB(255, 11, 225, 3),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          Text('Sélectionner une image ',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: controller.pickImageFromCamera,
                    child: Container(
                      width: 200,
                      height: 50,
                      color: const Color.fromARGB(255, 11, 225, 3),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.file_copy,
                            color: Colors.white,
                          ),
                          Text('Prendre une photo',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(() {
                    final String? imageFilePath =
                        controller.imageFilePath.value;
                    return imageFilePath != null
                        ? Image.file(
                            File(imageFilePath),
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        : const Text('Aucune image sélectionnée');
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () async {
                        controller.test();
                      },
                      child:  Text('Post'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color.fromARGB(255, 42, 228, 49),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: XNavbar(token: controller.token.value, currentIndex: 2,)
    );
  }
}

/* Widget boutton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ElevatedButton(

        onPressed: () async {
          controller.
        },
        child: Text('LOGIN'),
        style: ElevatedButton.styleFrom(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: const Color.fromARGB(255, 42, 228, 49),
        ),
      ),
    );
  } */


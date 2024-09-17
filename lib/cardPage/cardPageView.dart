
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arosaje_mobile/cardPage/cardPageController.dart';

class CardPage extends GetView<CardPageController> {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {  Get.offAllNamed('home',arguments: controller.token); },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  ),
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
            ))
      ),
      body: Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center, // Centre verticalement
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              controller.imageUrl!,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
      const SizedBox(height: 16), // Espacement entre l'image et le texte
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          controller.imageTitle!,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ),
 // Espacement entre le texte et le bouton
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ElevatedButton(
          onPressed: () async {
            // Your action here
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            shadowColor: Colors.grey.withOpacity(0.5),
            elevation: 2,
          ),
          child: const Text(
            'Envoyer message',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  ),
),

     /*  bottomNavigationBar: XNavbar(
        token: controller.token.value,
        currentIndex: 4,
      ), */
    );
  }
}

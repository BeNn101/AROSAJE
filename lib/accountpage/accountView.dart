import 'package:arosaje_mobile/accountpage/accountViewController.dart';
import 'package:arosaje_mobile/uiKit/XNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class AccountView extends GetView<AccountViewController> {
  const AccountView({super.key});
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
      body: Center(
        child: Obx(
          () => Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Mon profil :',
                textAlign: TextAlign.left,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      const Text(
                        'Email :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${controller.currentUser?.value?.email.obs}',
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      const Text(
                        'Nom :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${controller.currentUser?.value?.lastName}',
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      const Text(
                        'Prénom :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${controller.currentUser?.value?.firstName}',
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      const Text(
                        'Téléphone :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${controller.currentUser?.value?.telephone}',
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                "Mes annonces :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white70,
                    child: RefreshIndicator(
                      onRefresh: () => controller.getAllPlant(),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: controller.listUserMyPlant.length,
                        itemBuilder: (context, index) {
                          String imagePath =
                              controller.listUserMyPlant[index].image;
                          String imageUrl = 'http://172.16.1.148:8000/' + imagePath;
                          if (controller.listUserMyPlant[index].idUser ==
                              controller.currentUser.value?.idUser) {
                            return Card(
                              child: Center(
                                child: Column(
                                  children: [
                                     SizedBox(
                                      height: 10,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                         /*  IconButton(onPressed: () => controller.deletePlante(controller.listUserMyPlant[index].idPlante), 
                                          icon: */ InkWell(
  onTap: () {
    Get.snackbar("Test", "InkWell fonctionne");
   // controller.deletePlante(controller.listUserMyPlant[index].idPlante);
  },
  child: Icon(Icons.cancel, size: 30),
),

                                        ],
                                      ),

                                    ),
                                    const SizedBox(height: 30,),
                                    Image.network(
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return const CircularProgressIndicator();
                                      },
                                      imageUrl,
                                      height: 80,
                                      width: 80,
                                    ),
                                    Text(controller
                                        .listUserMyPlant[index].namePlante),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            // Retourne un widget vide si la condition n'est pas vérifiée
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                    
                  ),
                ),
              ),
              SizedBox(height: 4,),
                SizedBox(
  height: 50, // Augmenter la hauteur du bouton pour mieux ajuster le texte
  width: 160, // Augmenter la largeur pour permettre au texte d'être affiché correctement
  child: ElevatedButton(
    onPressed: () async {
      Get.offAllNamed('login');
    },
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Ajuster les marges internes
      shadowColor: const Color.fromARGB(255, 132, 156, 108).withOpacity(0.5),
      elevation: 1,
    ),
    child: const Text(
      'Se déconnecter',
      style: TextStyle(
        fontSize: 16, // Taille de police plus lisible
        fontWeight: FontWeight.bold, // Rendre le texte plus visible
        color: Color.fromARGB(255, 117, 154, 97), // Assurez-vous que le texte est bien visible sur le bouton
      ),
    ),
  ),
),

            ],
          ),
        ),
      ),
      bottomNavigationBar:
          Obx(()=> XNavbar(token: controller.token.value, currentIndex: 1,isadmin: controller.currentUser.value?.userType,)),
    );
  }
}

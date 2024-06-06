import 'package:arosaje_mobile/accountpage/accountViewController.dart';
import 'package:arosaje_mobile/logPage/loginViewController.dart';
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
          decoration: BoxDecoration(
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Center(
        child: Obx(
          () => Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
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
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Text(
                        'Email :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '${controller.currentUser?.value?.email.obs}',
                        style: TextStyle(
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
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Text(
                        'Nom :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '${controller.currentUser?.value?.lastName}',
                        style: TextStyle(
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
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Text(
                        'Prénom :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '${controller.currentUser?.value?.firstName}',
                        style: TextStyle(
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
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Text(
                        'Téléphone :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '${controller.currentUser?.value?.telephone}',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Mes annonces :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
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
                        itemCount: controller.listUserPlant.length,
                        itemBuilder: (context, index) {
                          String imagePath =
                              controller.listUserPlant[index].image;
                          String imageUrl = 'http:/localhost:8000/' + imagePath;
                          if (controller.listUserPlant[index].idUser ==
                              controller.currentUser.value?.idUser) {
                            return Card(
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Image.network(
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return CircularProgressIndicator();
                                      },
                                      imageUrl,
                                      height: 80,
                                      width: 80,
                                    ),
                                    Text(controller
                                        .listUserPlant[index].namePlante),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            // Retourne un widget vide si la condition n'est pas vérifiée
                            return SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          XNavbar(userId: controller.userId.value, currentIndex: 1),
    );
  }
}

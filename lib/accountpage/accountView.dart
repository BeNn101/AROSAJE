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
      title: const Text(
        "Arrosaje",
      ),
      backgroundColor: const Color.fromARGB(255, 11, 225, 3),
      elevation: 3,
      toolbarHeight: 70,
      shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20), // Spécifie le rayon de la partie inférieure de l'appbar
            ))
    ),
    body:  Center(
      child: Obx(()=>
        Column(
          children: [
                SizedBox(height: 10,),
            Text(
              'Mon profil :',
              textAlign: TextAlign.left,
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white60,
                child: Row(
                  children: [
                    Text('Email :'),
                    Text('${controller.currentUser?.value?.email.obs}'),
                  ],
                )),
            )
            , Expanded(
              flex: 1,
              child: Container(
                
                color: Colors.white60,
                child: Row(
                  children: [
                    Text('Nom :'),
                    Text('${controller.currentUser?.value?.lastName}'),
                  ],
                )),
            )
            , Expanded(
              flex: 1,
              child: Container(
                color: Colors.white60,
                child: Row(
                  children: [
                    Text('Prénom:'),
                    Text('${controller.currentUser?.value?.firstName}'),
                  ],
                )),
            )
            , Expanded(
              flex: 1,
              child: Container(
                color: Colors.white60,
                child: Row(
                  children: [
                    Text('Téléphone :'),
                    Text('${controller.currentUser?.value?.telephone}'),
                  ],
                )),
            ),
            Text("Mes annonces :"),
            SizedBox(height: 10,),
            Expanded(
  flex: 6,
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      width: double.infinity,
      color: Colors.white70,
      child: controller.listUserPlant.isEmpty
          ? Center(child: Text('Aucune annonce disponible'))
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: controller.listUserPlant.length,
              itemBuilder: (context, index) {
                String imagePath = controller.listUserPlant[index].image;
                String imageUrl = 'http://192.168.1.40:8000/' + imagePath;
                return Card(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Image.network(
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                  return child;
                }
                return CircularProgressIndicator();
              
                          },
                          imageUrl,
                          height: 80,
                          width: 80,
                        ),
                        Text(controller.listUserPlant[index].namePlante),
                      ],
                    ),
                  ),
                );
              },
            ),
    ),
  ),
)

            
            
          ],
        ),
      ),
    ),
  
    bottomNavigationBar: 
   XNavbar(userId: controller.userId.value,currentIndex: 1),
  );
  }
}
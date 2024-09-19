import 'package:arosaje_mobile/adminPage/adminPageController.dart';
import 'package:arosaje_mobile/uiKit/XNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AdminPageView extends GetView<AdminPageViewController> {
  const AdminPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'lib/assets/logo.png',
          height: 60,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.white],
              begin: Alignment.topCenter,
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
      body: Column( // Flex widget that can accept Flexible
        children: [
          const Text("Page Admin:"),
          const SizedBox(height: 10),
          Flexible( // Use Flexible directly inside Column
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Obx(() => RefreshIndicator(
      onRefresh: () => controller.getUsers(),
      child: ListView.builder(
        itemCount: controller.listUser.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded( 
                  flex: 3,
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Tooltip(
                               message: 'Nom complet : ${controller.listUser[index].email}',
                              child: Text(
                                controller.listUser[index].email,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Expanded(
                                child: Tooltip(
                                   message: 'Nom complet : ${controller.listUser[index].firstName} ${controller.listUser[index].lastName}',
                                  child: Text(
                                    '${controller.listUser[index].firstName}  ${controller.listUser[index].lastName}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              const SizedBox(width: 10,),
                Expanded(             
                  child: InkWell(
                    onTap:() {
                     showAlertDialog(context,controller,controller.listUser[index].idUser);  
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.redAccent,
                      ),
                      height: 70,
                      child: Icon(Icons.clear, color: Colors.white,)),
                  ),
                ), // Icône de suppression à droite
              ],
            ),
          );
        },
      ),
    )),
  ),
),

        
        ],
      ),
      bottomNavigationBar:
          Obx(()=> XNavbar(token: controller.token.value, currentIndex: 5,isadmin: controller.currentUser?.userType,)),
    );
  }
}


void showAlertDialog(BuildContext context,AdminPageViewController controller, int idUser) {
  // Définir le bouton
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      // Fermer le dialogue
      controller.deleteUser(idUser);
      Navigator.of(context).pop();
    },
  );

  // Créer l'AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Attention"),
    content: Text("Êtes-vous sûr de vouloir supprimer l'utilisateur?"),
    actions: [
      okButton,
    ],
  );

  // Afficher l'AlertDialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
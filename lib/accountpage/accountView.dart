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
    ),
    body:  Center(
      child: Column(
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
                  Text('${controller.currentUser?.email.obs}'),
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
                  Text('${controller.currentUser?.lastName}'),
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
                  Text('${controller.currentUser?.firstName}'),
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
                  Text('${controller.currentUser?.telephone}'),
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
                color: const Color.fromARGB(153, 228, 222, 222),
                child: Text('')),
            ),
          )
          
          
        ],
      ),
    ),
  
    bottomNavigationBar: 
   XNavbar(userId: controller.userId.value),
  );
  }
}
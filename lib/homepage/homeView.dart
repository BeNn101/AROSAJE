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
                return PlantBody();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar:  XNavbar(userId: controller.userId.value!??1)

    );
  }
}

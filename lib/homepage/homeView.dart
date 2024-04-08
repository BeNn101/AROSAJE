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
import 'package:skeletonizer/skeletonizer.dart';

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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
        ),
      ),
      body: Column(
        children: [
          Xtextfield(
            onTap: () {
              controller.startSearch(context);
            }, onPressed: (){controller.startSearch(context);},
          ).build(),
          Text(
            "Annonce ",
            textAlign: TextAlign.left,
          ),
          Expanded(
            child: Obx(() => RefreshIndicator(
              onRefresh: () => controller.getAllPlant(), // Fonction à appeler lors du rafraîchissement
              child: Skeletonizer(
                enabled: controller.isSkeletonLoader.value,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: controller.listPlant.length,
                  itemBuilder: (context, index) {
                    String imagePath = controller.listPlant[index].image;
                    String imageUrl = 'http://172.16.1.8:8000/'+imagePath;
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
                            Text(controller.listPlant[index].namePlante),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )),
          ),
        ],
      ),
      bottomNavigationBar: XNavbar(userId: controller.userId.value!??1, currentIndex: 0),
    );
  }
}

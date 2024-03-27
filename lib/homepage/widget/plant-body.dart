import 'package:arosaje_mobile/homepage/homeViewController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PlantBody extends StatelessWidget {
   PlantBody({super.key});
  final HomeViewController controller = Get.find<HomeViewController>();
  @override
  Widget build(BuildContext context) {
    return  Card(
     child: Center(
       child: Column(children: [
        SizedBox(height: 10,),
       Image.network(controller.listPlant.single.firstName,
       height: 100,
       width: 100,),
      /*   Text('data'), */
        Text(controller.listPlant.single.email),
        /* Text('hgs69') */
       ]),
     ),
    );
  }
}
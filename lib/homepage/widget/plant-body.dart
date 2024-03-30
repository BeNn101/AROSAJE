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
       Image.network('/data/user/0/com.example.arosaje_mobile/cache/af21ebb7-1f7d-481d-9bde-65a6dc03dd7a6648591903563287108.jpg',
       height: 100,
       width: 100,),
      /*   Text('data'), */
        Text('r'),
        /* Text('hgs69') */
       ]),
     ),
    );
  }
}
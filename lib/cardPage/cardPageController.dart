import 'package:arosaje_mobile/freeze/plantes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CardPageController extends GetxController {
  var userId = 0.obs;

  String? imageUrl ;
  String? imageTitle ;
  Plant? url;
  TextEditingController message = TextEditingController();

  @override
  void onInit() {
    url = Get.arguments;
    if (url!.image.isNotEmpty) {
    imageUrl = 'http://192.168.1.40:8000/' + url!.image;
  }
  imageTitle=url!.namePlante;
    //userId.value = Get.arguments['userId'] ?? 0;
    super.onInit();
 
  }
  
  
}

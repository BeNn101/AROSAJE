


import 'package:arosaje_mobile/messagepage/messageViewController.dart';
import 'package:get/get.dart';


class MessageBindings extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(()=>MessageViewController());
  }
}
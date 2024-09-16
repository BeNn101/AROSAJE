import 'package:arosaje_mobile/chat/chatController.dart';
import 'package:arosaje_mobile/homepage/homeViewController.dart';
import 'package:get/get.dart';

class ChatBindings extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(()=>ChatViewController());
  }
}
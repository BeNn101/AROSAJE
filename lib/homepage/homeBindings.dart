import 'package:arosaje_mobile/homepage/homeViewController.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(()=>HomeViewController());
  }
}
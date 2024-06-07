import 'package:get/get.dart';
import 'package:arosaje_mobile/cardPage/cardPageController.dart';
class CardBindings extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(()=>CardPageController());
  }
}
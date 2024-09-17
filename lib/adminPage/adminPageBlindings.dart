import 'package:arosaje_mobile/adminPage/adminPageController.dart';
import 'package:get/get.dart';


class AdminPageBindings extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(()=>AdminPageViewController());
  }
}
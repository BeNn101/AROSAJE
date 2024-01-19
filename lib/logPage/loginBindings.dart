
import 'package:arosaje_mobile/logPage/loginViewController.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(()=>LoginViewController());
  }
}
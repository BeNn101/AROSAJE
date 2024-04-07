import 'package:arosaje_mobile/mappage/mapViewController.dart';
import 'package:arosaje_mobile/registerPage/registerViewController.dart';
import 'package:get/get.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterViewController());
  }
}

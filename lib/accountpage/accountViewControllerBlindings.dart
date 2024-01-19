
import 'package:arosaje_mobile/accountpage/accountViewController.dart';
import 'package:get/get.dart';


class AccountBindings extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(()=>AccountViewController());
  }
}
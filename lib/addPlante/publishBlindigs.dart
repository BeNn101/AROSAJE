
import 'package:arosaje_mobile/addPlante/publishController.dart';
import 'package:arosaje_mobile/logPage/loginViewController.dart';
import 'package:get/get.dart';

class PublishBindings extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(()=>PublishViewViewController());
  }
}
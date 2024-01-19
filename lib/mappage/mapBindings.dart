import 'package:arosaje_mobile/mappage/mapViewController.dart';
import 'package:get/get.dart';

class MapBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapViewController());
  }
}

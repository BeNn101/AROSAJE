
import 'package:arosaje_mobile/freeze/user.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';

class MessageViewController extends GetxController  {
  var userId = 0.obs; // Utilisez Rx<int> si vous souhaitez que les modifications soient observables.

  @override
  void onInit() {
    super.onInit();
    // Exemple de récupération de l'userId des arguments de navigation
    userId.value = Get.arguments['userId'] ?? 0; // Assurez-vous que cela est un int
  }

  
}
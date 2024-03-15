import 'package:arosaje_mobile/freeze/user.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  var userId = Rxn<int>(); // Utilise Rxn pour une valeur pouvant être nulle.

  @override
  void onInit() {
    super.onInit();
    // Récupération et vérification des arguments
    final argument = Get.arguments;
    
    // Si l'argument est une map et contient la clé 'userId'
    if (argument is Map<String, dynamic> && argument.containsKey('userId')) {
      // S'assurer que la valeur de 'userId' est bien un int avant de la définir
      userId.value = argument['userId'];
    } else if (argument is int) {
      // Si l'argument passé est directement un int, l'utiliser directement
      userId.value = argument;
    } else {
      // Logique par défaut ou gestion d'erreur si 'userId' n'est pas trouvé
      print("Erreur: L'userId n'est pas fourni dans les arguments de navigation.");
    }
  }

  search() {}
  getPlants() {}
}

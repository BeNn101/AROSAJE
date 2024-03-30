import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
/* 
class XButtomNavigationBar extends StatefulWidget {
  int currentIndex, unreadNotifCount;

  /// Barre de navigation sur mobile
  ///
  /// ```
  /// XButtomNavigationBar(
  ///   currentIndex: currentIndex,
  /// ),
  /// ```
  ///
  XButtomNavigationBar({
    Key? key,
    required this.unreadNotifCount,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<XButtomNavigationBar> createState() => _XButtomNavigationBarState();
}

class _XButtomNavigationBarState extends State<XButtomNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        backgroundColor: white,
        label: 'accueil'.tr,
        icon: const Icon(
          Icons.home,
        ),
      ),
      BottomNavigationBarItem(
        backgroundColor: white,
        label: 'tasks'.tr.capitalizeFirst,
        icon: const Icon(Icons.event_available),
      ),
      BottomNavigationBarItem(
        backgroundColor: white,
        label: 'comptes'.tr,
        icon: const Icon(
          Icons.contact_page,
        ),
      ),
      BottomNavigationBarItem(
        backgroundColor: white,
        label: 'devis'.tr,
        icon: const Icon(
          Icons.description,
        ),
      ),
      BottomNavigationBarItem(
        backgroundColor: white,
        label: 'menu'.tr,
        icon: Stack(
          children: [
            const Icon(
              LineAwesomeIcons.bars,
            ),
            widget.unreadNotifCount > 0
                ? Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 4),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Get.theme.colorScheme.secondary),
                      child: Text(
                        '${widget.unreadNotifCount}',
                        style: Get.textTheme.bodySmall!
                            .copyWith(color: white, fontSize: 9),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    ];
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedItemColor: Get.theme.colorScheme.secondary,
      unselectedItemColor: Get.theme.hintColor,
      currentIndex: widget.currentIndex,
      onTap: (value) {
        if (widget.currentIndex != value) toPage(value);
      },
      // Liste des pages navigables depuis le menu
      items: items,
    );
  }

  /// Permet d'être redirigé sur la page voulu
  void toPage(int value) async {
    try {
      switch (value) {
        case 0:
          Get.offAllNamed(Routes.home);
          break;
        case 1:
          Get.offNamedUntil(Routes.activites, ModalRoute.withName(Routes.home));
          break;
        case 2:
          Get.offNamedUntil(Routes.accounts, ModalRoute.withName(Routes.home));
          //Get.offAllNamed(Routes.accounts + Routes.newCustomer);
          break;
        case 3:
          Get.offNamedUntil(Routes.quote, ModalRoute.withName(Routes.home));
          break;
        case 4:
          Get.offNamedUntil(Routes.menu, ModalRoute.withName(Routes.home));
          break;
        default:
          Get.offAllNamed(Routes.home);
          break;
      }
    } catch (exception, stackTrace) {
      Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
} */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XNavbar extends StatefulWidget {
  int currentIndex;
  final int userId;
  /// Barre de navigation sur mobile
  ///
  /// ```
  /// XButtomNavigationBar(
  ///   currentIndex: currentIndex,
  /// ),
  /// ```
  ///
  XNavbar({
    Key? key,
    required this.currentIndex,
     required this.userId
  }) : super(key: key);

  @override
  State<XNavbar> createState() => _XNavbarState();
}

class _XNavbarState extends State<XNavbar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_sharp),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
        BottomNavigationBarItem(
          icon: Icon(Icons.place),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: '',
        )
          ];
      
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedItemColor: Colors.green,
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
            Get.toNamed('/home', arguments: {'userId': widget.userId});
            break;
          case 1:
            Get.toNamed('/account', arguments: {'userId': widget.userId});
            break;
          case 2:
            Get.toNamed('/publish', arguments: {'userId': widget.userId});
            break;
          case 3:
            Get.toNamed('/map', arguments: {'userId': widget.userId});
            break;
          case 4:
            Get.toNamed('/message', arguments: {'userId': widget.userId});
            break;
        }
    } catch (exception, stackTrace) {
      
      rethrow;
    }
  }
}

/* 
class XButtomNavigationBar extends StatefulWidget {
  int currentIndex, unreadNotifCount;
  final int userId;
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
     required this.userId
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
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_sharp),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
        BottomNavigationBarItem(
          icon: Icon(Icons.place),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: '',
        )
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
          switch (index) {
          case 0:
            Get.toNamed('/home', arguments: {'userId': widget.userId});
            break;
          case 1:
            Get.toNamed('/account', arguments: {'userId': widget.userId});
            break;
          case 2:
            Get.toNamed('/publish', arguments: {'userId': widget.userId});
            break;
          case 3:
            Get.toNamed('/map', arguments: {'userId': widget.userId});
            break;
          case 4:
            Get.toNamed('/message', arguments: {'userId': widget.userId});
            break;
        }
    } catch (exception, stackTrace) {
      
      rethrow;
    }
  }
} */
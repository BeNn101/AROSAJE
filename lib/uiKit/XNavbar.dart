import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XNavbar extends StatefulWidget {
  final int userId; // Ajoutez un champ pour stocker l'ID de l'utilisateur

  const XNavbar({Key? key, required this.userId}) : super(key: key); // Ajoutez le paramètre userId au constructeur

  @override
  _XNavbarState createState() => _XNavbarState();
}

class _XNavbarState extends State<XNavbar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_sharp),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.send_rounded),
          label: '',
        ),
      ],
      onTap: (index) {
        setState(() {
          currentPageIndex = index;
        });

        switch (index) {
          case 0:
            Get.offNamed('/home', arguments: {'userId': widget.userId}); // Utilisez widget.userId pour accéder à l'ID de l'utilisateur
            break;
          case 1:
            Get.offNamed('/account', arguments: {'userId': widget.userId});
            break;
          case 2:
            Get.toNamed('/message', arguments: {'userId': widget.userId});
            break;
        }
      },
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      currentIndex: currentPageIndex,
    );
  }
}

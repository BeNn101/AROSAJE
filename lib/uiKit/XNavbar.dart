import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XNavbar extends StatefulWidget {
  const XNavbar({Key? key}) : super(key: key);

  @override
  _XNavbarState createState() => _XNavbarState();
}

class _XNavbarState extends State<XNavbar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items:  [
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
            Get.offNamed('/home', arguments: index);
            break;
          case 1:
            Get.offNamed('/account', arguments: index);
            break;
          case 2:
            Get.toNamed('/message', arguments: index);
            break;
        }
      },
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      currentIndex: currentPageIndex,
    );
  }
}

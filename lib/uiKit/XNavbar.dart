import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XNavbar extends StatefulWidget {
  final int userId;

  const XNavbar({Key? key, required this.userId}) : super(key: key);

  @override
  _XNavbarState createState() => _XNavbarState();
}

class _XNavbarState extends State<XNavbar> {
  int currentIndex = 0;

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
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });

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
      },
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
    );
  }
}

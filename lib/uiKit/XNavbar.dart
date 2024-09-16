import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XNavbar extends StatefulWidget {
  int currentIndex;
  final String token;

  XNavbar({
    Key? key,
    required this.currentIndex,
    required this.token,
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
      BottomNavigationBarItem(
        icon: Icon(Icons.add),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.place),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.chat_bubble_outline),
        label: '',
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.green],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: Colors.green,
        unselectedItemColor: Get.theme.hintColor,
        currentIndex: widget.currentIndex,
        onTap: (value) {
          if (widget.currentIndex != value) toPage(value);
        },
        items: items.map((item) {
          int index = items.indexOf(item);
          return BottomNavigationBarItem(
            icon: Transform.scale(
              scale: widget.currentIndex == index ? 1.5 : 1.0,
              child: item.icon,
            ),
            label: '',
          );
        }).toList(),
      ),
    );
  }

  void toPage(int value) async {
    try {
      switch (value) {
        case 0:
          Get.toNamed('/home', arguments: {'token': widget.token});
          break;
        case 1:
          Get.toNamed('/account', arguments: {'token': widget.token});
          break;
        case 2:
          Get.toNamed('/publish', arguments: {'token': widget.token});
          break;
        case 3:
          Get.toNamed('/map', arguments: {'token': widget.token});
          break;
        case 4:
          Get.toNamed('/message', arguments: {'token': widget.token});
          break;
      }
    } catch (exception, stackTrace) {
      rethrow;
    }
  }
}

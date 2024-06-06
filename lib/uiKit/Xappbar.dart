import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;

  CustomAppBar({required this.title, this.centerTitle = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: centerTitle
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              Image.asset(
                'lib/assets/logo.png',
                height: 40,
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}

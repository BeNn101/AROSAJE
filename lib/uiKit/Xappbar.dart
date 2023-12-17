import 'package:flutter/material.dart';

class XappBar extends AppBar {
   XappBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        title: Text("Arrosaje" , textAlign: TextAlign.center),
        backgroundColor: Color.fromARGB(255, 11, 225, 3),
        elevation: 3,
        toolbarHeight: 70,
      );
  }
}
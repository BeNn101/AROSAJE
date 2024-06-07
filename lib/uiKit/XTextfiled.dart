import 'package:flutter/material.dart';

class Xtextfield {
  final Function onPressed;
  final Function? onTap;

  Xtextfield({
    required this.onPressed,
    this.onTap,
  });

  Widget build() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Color.fromARGB(255, 241, 240, 240),
        child: Column(children: [
          InkWell(
            onTap: onTap as void Function()?,
            child: SizedBox(
              height: 40,
              child: Row(
                children: [
                  IconButton(
                    onPressed: onPressed as void Function()?,
                    icon: Icon(Icons.search),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Xtextfield {
  final Function onPressed;

  Xtextfield({
    required this.onPressed,
  });

  Widget build() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Color.fromARGB(255, 241, 240, 240),
        child: Column(children: [
          Container(
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
        ]),
      ),
    );
  }
}

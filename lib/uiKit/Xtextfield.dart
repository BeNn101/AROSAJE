import 'package:flutter/material.dart';

class XTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool obscuroty = false;
  //final Function()? onTap;

  const XTextField({Key? key, this.hintText, this.controller, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textFieldWidth = screenWidth / 2;
    double fontSize = screenWidth > 600 ? 16 : 14;

    return Container(
      width: textFieldWidth,
      child: GestureDetector(
        //onTap: onTap,
        child: TextFormField(
          obscureText: obscuroty,
          controller: controller,
          autofocus: true,
          cursorColor: Colors.green,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            hintText: hintText,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Colors.grey.shade200,
          ),
          style: TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}

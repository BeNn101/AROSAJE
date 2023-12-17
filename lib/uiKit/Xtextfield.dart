import 'package:flutter/material.dart';

class XTextField extends StatelessWidget {
  final String? hintText;
  final Function()? onTap; // Déclarer la variable de fonction

  const XTextField({Key? key, this.hintText, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textFieldWidth = screenWidth / 2;
    double fontSize = screenWidth > 600 ? 16 : 14;
    
    return Container(
      width: textFieldWidth,
     
      child: GestureDetector(
        
        // Utiliser la fonction onTap
        child: TextFormField(
          onTap: onTap,
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
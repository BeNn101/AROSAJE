import 'package:arosaje_mobile/logPage/loginViewController.dart';
import 'package:arosaje_mobile/uiKit/Xappbar.dart';
import 'package:arosaje_mobile/uiKit/Xtextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginViewController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Arrosaje" ,),
        backgroundColor: Color.fromARGB(255, 11, 225, 3),
        elevation: 3,
        toolbarHeight: 70,
      ),
      body:  Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center, // Centrer verticalement
    children: [
      XTextField(onTap: () {
        // Votre logique
      }, hintText: 'mail'),
      SizedBox(height: 10),
      XTextField(onTap: () {
        // Votre logique
      }, hintText: 'Password'),
      boutton(),
    ],
  ),
)
    );
  }
}

Widget boutton() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 110),
    child: TextField(
      textAlign: TextAlign.center,
      onTap: () { print('true');},
      autofocus: true,
      enabled: false,
      decoration: InputDecoration(
        hintText: 'LOGIN',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        alignLabelWithHint: true,
        filled: true,
        fillColor: const Color.fromARGB(255, 42, 228, 49),
       // Ajustez cette valeur selon vos besoins
      ),
      style: TextStyle(fontSize: 20, color: Colors.white),
    ),
  );
}

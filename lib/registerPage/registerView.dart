import 'package:arosaje_mobile/registerPage/registerViewController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterViewController>  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Arrosaje",
        ),
        backgroundColor: Color.fromARGB(255, 11, 225, 3),
        elevation: 3,
        toolbarHeight: 70,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ))
      ),
      body: 
       Center(
         child: SingleChildScrollView(
           
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
              /*  Container(
                 width: 17 0,
                 height: 170,
                  decoration: const BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage('logo.png'),
                     fit: BoxFit.contain,
                   ),
                 ), 
               ),
               */
               const Text(
                 'Inscription',
                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
               ),
               const SizedBox(height: 30),
                RegistrationFormField(label: 'Prénom',controllerText: controller.surnameTextController),
               const SizedBox(height: 12),
                RegistrationFormField(label: 'Nom',controllerText: controller.nameTextController),
               const SizedBox(height: 12),
                RegistrationFormField(
                 label: 'Email',
                 keyboardType: TextInputType.emailAddress,
                 controllerText: controller.emailTextController,
               ),
               const SizedBox(height: 12),
                RegistrationFormField(
                 label: 'Mot de passe',
                 obscureText: true,
                 controllerText: controller.passwordTextController,
               ),
               const SizedBox(height: 12),
                RegistrationFormField(
                 label: 'Téléphone',
                 keyboardType: TextInputType.phone,
                 controllerText: controller.phoneTextController,
               ),
               const SizedBox(height: 20),
               GestureDetector(
                 onTap: () {
                   Get.offAllNamed('/login');
                 },
                 child: const Text(
                   'Déjà inscrit ? Connectez-vous',
                   style: TextStyle(
                     color: Colors.blue,
                     decoration: TextDecoration.underline,
                   ),
                 ),
               ),
               const SizedBox(height: 20),
               ElevatedButton(
                 onPressed: () {
                   controller.register();
                 },
                 style: ElevatedButton.styleFrom(
                   primary: Colors.white,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(8.0),
                   ),
                   side: const BorderSide(color: Colors.black),
                 ),
                 child: Container(
                   width: 300,
                   padding: const EdgeInsets.symmetric(vertical: 14),
                   color: Colors.white,
                   child: const Center(
                     child: const Text(
                       'S\'inscrire',
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 20,
                       ),
                     ),
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
      );
    
  }
}

class RegistrationFormField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController controllerText;
  const RegistrationFormField({
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text, 
    required this.controllerText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controllerText,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey[200], 
          border: const OutlineInputBorder(),
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arosaje_mobile/registerPage/registerViewController.dart';

class RegisterView extends GetView<RegisterViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 170,
                height: 170,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Inscription',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              RegistrationFormField(label: 'Prénom' ,controller: controller.surnameTextController,),
              const SizedBox(height: 12),
              RegistrationFormField(label: 'Nom',controller: controller.nameTextController,),
              const SizedBox(height: 12),
              RegistrationFormField(
                  label: 'Email', keyboardType: TextInputType.emailAddress,controller: controller.emailTextController,),
              const SizedBox(height: 12),
              RegistrationFormField(label: 'Mot de passe', obscureText: true,controller: controller.passwordTextController,),
              const SizedBox(height: 12),
              RegistrationFormField(
                  label: 'Téléphone', keyboardType: TextInputType.phone,controller: controller.phoneTextController,),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.offNamed("/login");
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
              // Bouton d'inscription personnalisé
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    controller.register();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Fond blanc
                    onPrimary: Colors.black, // Texte noir
                    elevation: 5, // Ombre noire
                    shadowColor: Colors.black, // Couleur de l'ombre
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Bords arrondis
                      side: const BorderSide(
                          color: Colors.black, width: 2), // Bordure noire
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'S\'inscrire',
                      style: TextStyle(
                        fontSize: 16,
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
  final TextEditingController controller;
  const RegistrationFormField({
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text, 
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: (value) {
          if(value!=null)  false;
        },
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black), // Couleur du label
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.green,
                width: 2), // Bordure verte lorsque le champ est sélectionné
          ),
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
      ),
    );
  }
}

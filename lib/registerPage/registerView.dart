import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arosaje_mobile/registerPage/registerViewController.dart';

class RegisterView extends GetView<RegisterViewController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child:  Form(
              key: _formKey,  // Liez le formulaire à la clé
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
                  RegistrationFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Champ vide";
                      }
                      return null;
                    },
                    label: 'Prénom',
                    controller: controller.surnameTextController,
                  ),
                  const SizedBox(height: 12),
                  RegistrationFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Champ vide";
                      }
                      return null;
                    },
                    label: 'Nom',
                    controller: controller.nameTextController,
                  ),
                  const SizedBox(height: 12),
                  RegistrationFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Champ vide";
                      }
                      return null;
                    },
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailTextController,
                  ),
                  const SizedBox(height: 12),
                  RegistrationFormField(
                    validator: (value) {
                      if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$').hasMatch(value ?? '')) {
                        return 'Le mot de passe doit contenir au moins 8 caractères, une majuscule, un chiffre et un caractère spécial';
                      }
                      return null;
                    },
                    label: 'Mot de passe',
                    obscureText: true,
                    controller: controller.passwordTextController,
                  ),
                  const SizedBox(height: 12),
                  RegistrationFormField(
                    validator: (value) {
                     
                      if (controller.passwordTextController.text!=value) {
                        return "Le mot de passe n'est pas le même";
                      }
                      return null;
                    },
                    label: 'Confirmer Mot de passe',
                    obscureText: true,
                    controller: controller.confirmPasswordTextController,
                  ),
                  const SizedBox(height: 12),
                  RegistrationFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Numéro de téléphone requis';
                      }
                     
                      return null;
                    },
                    label: 'Téléphone',
                    keyboardType: TextInputType.phone,
                    controller: controller.phoneTextController,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Checkbox(
                            value: controller.acceptsRgpd.value,
                            onChanged: (bool? value) {
                              controller.acceptsRgpd.value = value ?? false;
                            },
                          )),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed("/cgu");
                        },
                        child: const Text(
                          'J\'accepte les termes et conditions CGU',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (controller.acceptsRgpd.value) {
                            controller.register();
                          } else {
                            Get.snackbar(
                              "Erreur",
                              "Vous devez accepter les termes et conditions CGU",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        elevation: 5,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: const BorderSide(color: Colors.black, width: 2),
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
        ),
      );
    
  }
}

class RegistrationFormField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const RegistrationFormField({
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
      ),
    );
  }
}

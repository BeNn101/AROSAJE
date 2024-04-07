import 'package:arosaje_mobile/uiKit/Xtextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Connexion',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              XTextField(
                controller: emailController,
                hintText: 'Email',
              ),
              SizedBox(height: 10),
              XTextField(
                controller: passwordController,
                hintText: 'Password',
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.toNamed("/register");
                },
                child: Text(
                  "Pas de compte ? Inscrivez-vous",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 10),
              boutton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget boutton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 110),
      child: ElevatedButton(
        onPressed: () async {
          final String email = emailController.text;
          final String password = passwordController.text;
          Get.toNamed("/home");
        },
        child: Text('LOGIN'),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          primary: const Color.fromARGB(255, 42, 228, 49),
        ),
      ),
    );
  }
}

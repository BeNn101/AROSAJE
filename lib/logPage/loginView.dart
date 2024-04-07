import 'package:arosaje_mobile/logPage/loginViewController.dart';
import 'package:arosaje_mobile/uiKit/Xtextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginViewController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double fontSize = screenWidth > 600 ? 16 : 14;
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
                    image: AssetImage('lib/assets/logo.png'),
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
              Padding(
            
              padding: const EdgeInsets.symmetric(horizontal: 98),
              child: TextFormField(
                        obscureText: true,
                        controller: passwordController,
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
              hintText: 'password',
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              fillColor: Colors.grey.shade200,
                        ),
                        style: TextStyle(fontSize: screenWidth > 600 ? 16 : 14),
                      ),
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
          controller.loginView(password,email);
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

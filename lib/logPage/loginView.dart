import 'package:arosaje_mobile/logPage/loginViewController.dart';
import 'package:arosaje_mobile/uiKit/Xappbar.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            boutton(),
            SizedBox(height: 10,),
            InkWell(onTap: () =>Get.toNamed("/register") ,child: Text("S'incrire ?"),)
          ]
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

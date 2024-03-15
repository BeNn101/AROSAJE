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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Arrosaje",
        ),
        backgroundColor: Color.fromARGB(255, 11, 225, 3),
        elevation: 3,
        toolbarHeight: 70,
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
            XTextField(
              controller: passwordController,
              hintText: 'Password',
            ),
            boutton(),
          ],
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

import 'package:arosaje_mobile/messagepage/chat.dart';
import 'package:arosaje_mobile/messagepage/messageViewController.dart';
import 'package:arosaje_mobile/uiKit/XNavbar.dart';
import 'package:arosaje_mobile/uiKit/Xappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MessageView extends GetView<MessageViewController> {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'lib/assets/logo.png', // Assurez-vous que votre logo est dans le répertoire 'assets' et référencé dans pubspec.yaml
            height: 60, // Augmenter la taille du logo
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.white],
                begin: Alignment.topCenter, // Dégradé vertical de haut en bas
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 3,
          toolbarHeight: 70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: Column(
          children: [
            const Text("Mes messages:"),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    controller.getMessage();
                    Get.to(const ChatView());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Jean',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Tulipe',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: XNavbar(userId: controller.userId.value, currentIndex: 4,)
    );
  }
}

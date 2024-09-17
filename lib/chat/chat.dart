import 'package:arosaje_mobile/chat/chatController.dart';
import 'package:arosaje_mobile/uiKit/XNavbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ChatView extends GetView<ChatViewController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'lib/assets/logo.png',
          height: 60,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 3,
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Obx(
  () => Column(
    children: [  // Ajout des accolades manquantes
      Expanded(
        child: ListView.builder(
          itemCount: controller.listMessageHistorical.length,
          itemBuilder: (context, index) {
            return Align(
              alignment: controller.listMessageHistorical[index].idUser == controller.currentUser?.idUser
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: controller.listMessageHistorical[index].idUser == controller.currentUser?.idUser
                      ? Colors.blue
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(controller.listMessageHistorical[index].message),
              ),
            );
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onSubmitted: (value) {
                  controller.postMessage(value, controller.selectedRecipientId);
                  controller.message.clear();
                  controller.getMessage();
                },
                controller: controller.message,
                decoration: const InputDecoration(
                  hintText: 'Type your message...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                controller.postMessage(controller.message.value.text, controller.selectedRecipientId);
                controller.message.clear();
                controller.getMessage();
              },
            ),
          ],
        ),
      ),
    ],
  ),
),

      bottomNavigationBar: Obx(()
        => XNavbar(
          token: controller.token.value,
          currentIndex: 4,
          isadmin: controller.currentUser?.userType,
        ),
      ),
    );
  }
}

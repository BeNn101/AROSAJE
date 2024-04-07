import 'package:arosaje_mobile/messagepage/messageViewController.dart';
import 'package:arosaje_mobile/uiKit/XNavbar.dart';
import 'package:arosaje_mobile/uiKit/Xappbar.dart';
import 'package:arosaje_mobile/uiKit/Xtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatView extends GetView<MessageViewController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Arrosaje"),
        backgroundColor: Color.fromARGB(255, 11, 225, 3),
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
          Expanded(
            child: ListView.builder(
              itemCount: controller.listMessage.length, // Remplacez 5 par le nombre d'éléments dans votre liste
              itemBuilder: (context, index) {
                // Replacez ces widgets par vos propres widgets de message
                return Align(
                  alignment: index % 2 == 0
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: index % 2 == 0 ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(controller.listMessage[index].message), // Exemple de texte
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
                    controller: controller.message,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    controller.postMessage(controller.message.value.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: XNavbar(
        userId: controller.userId.value,
        currentIndex: 4,
      ),
    );
  }
}

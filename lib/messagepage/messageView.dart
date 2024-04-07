import 'package:arosaje_mobile/messagepage/char.dart';
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
       appBar:AppBar(
        centerTitle: true,
        title: const Text("Arrosaje" ,),
        backgroundColor: const Color.fromARGB(255, 11, 225, 3),
        elevation: 3,
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20), 
            ))
      ),
      body:Column(
        children: [
          const Text("Mes messages:"),
          const SizedBox(height: 10,),
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
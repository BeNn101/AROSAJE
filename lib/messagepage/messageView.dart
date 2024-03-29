import 'package:arosaje_mobile/messagepage/messageViewController.dart';
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
        title: Text("Arrosaje" ,),
        backgroundColor: Color.fromARGB(255, 11, 225, 3),
        elevation: 3,
        toolbarHeight: 70,
      ),
      body: ListView(),
      bottomNavigationBar: XappBar(),//créer une classe card pour les messages
    );
  }
}
import 'package:arosaje_mobile/accountpage/accountViewController.dart';
import 'package:arosaje_mobile/logPage/loginViewController.dart';
import 'package:arosaje_mobile/uiKit/XNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class AccountView extends GetView<AccountViewController> {
  const AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: const Text(
        "Arrosaje",
      ),
      backgroundColor: const Color.fromARGB(255, 11, 225, 3),
      elevation: 3,
      toolbarHeight: 70,
    ),
    body:  Center(
      child: Column(
        children: [
          Text(
            'Title',
            textAlign: TextAlign.left,
          ),
          Expanded(
            flex: 2,
            child: SizedBox(             
              width: 120,             
              child: Container(
                color: Colors.white60,
                child: Text('${controller.currentUser?.email}')),
            ),
          )
          , Expanded(
            flex: 2,
            child: SizedBox(             
              width: 120,             
              child: Container(
                color: Colors.white60,
                child: Text('${controller.currentUser?.email}')),
            ),
          )
          , Expanded(
            flex: 2,
            child: SizedBox(             
              width: 120,             
              child: Container(
                color: Colors.white60,
                child: Text('${controller.currentUser?.email}')),
            ),
          )
          , Expanded(
            flex: 2,
            child: SizedBox(             
              width: 120,             
              child: Container(
                color: Colors.white60,
                child: Text('${controller.currentUser?.email}')),
            ),
          )
          
          
        ],
      ),
    ),
  
    bottomNavigationBar: 
   XNavbar(userId: controller.userId.value),
  );
  }
}
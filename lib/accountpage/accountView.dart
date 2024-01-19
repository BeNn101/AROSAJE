import 'package:arosaje_mobile/accountpage/accountViewController.dart';
import 'package:arosaje_mobile/uiKit/XNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    body: const SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Text(
              'Title',
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    ),
    bottomNavigationBar: 
     XNavbar(),
  );
  }
}
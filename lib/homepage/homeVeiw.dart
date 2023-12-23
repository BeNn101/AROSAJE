import 'package:arosaje_mobile/homepage/homeViewController.dart';
import 'package:arosaje_mobile/uiKit/XTextfiled.dart';
import 'package:arosaje_mobile/uiKit/Xappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HomeView extends GetView<HomeViewController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: XappBar(),
      body: Column(children: [
        Xtextfield(onPressed: (){
          controller.search();
        }).build(),
        GridView.count(crossAxisCount: 2,
        children: [],)
      ]),
    );
  }
}
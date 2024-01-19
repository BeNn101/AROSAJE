import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class XNavbarV2 extends StatelessWidget {
  const XNavbarV2({super.key});

  @override
  Widget build(BuildContext context) {
    return  BottomAppBar(
                height: 50,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed('/home');
                      },
                      child: const Column(
                        children: [
                          Icon(Icons.home),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/account');
                      },
                      child: const Column(
                        children: [
                         Icon(Icons.account_circle_sharp),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/message');
                      },
                      child: const Column(
                        children: [
                         Icon(Icons.send_rounded),
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
}
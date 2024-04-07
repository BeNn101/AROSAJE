import 'dart:collection';

import 'package:arosaje_mobile/accountpage/accountView.dart';
import 'package:arosaje_mobile/accountpage/accountViewControllerBlindings.dart';
import 'package:arosaje_mobile/homepage/homeBindings.dart';
import 'package:arosaje_mobile/homepage/homeView.dart';
import 'package:arosaje_mobile/logPage/loginBindings.dart';
import 'package:arosaje_mobile/logPage/loginView.dart';
import 'package:arosaje_mobile/mappage/mapBindings.dart';
import 'package:arosaje_mobile/mappage/mapView.dart';
import 'package:arosaje_mobile/messagepage/messageView.dart';
import 'package:arosaje_mobile/messagepage/messageViewControllerBlindings.dart';
import 'package:arosaje_mobile/registerPage/registerView.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'test',
      getPages: [
        GetPage(
          name: '/home',
          title: 'Home page',
          page: () => const HomeView(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: '/login',
          title: 'Login page',
          page: () => LoginView(),
          binding: LoginBindings(),
        ),
        GetPage(
          name: '/account',
          title: 'Acoount',
          page: () => const AccountView(),
          binding: AccountBindings(),
        ),
        GetPage(
          name: '/message',
          title: 'Message',
          page: () => const MessageView(),
          binding: MessageBindings(),
        ),
        GetPage(
          name: '/map',
          title: 'Map',
          page: () => MapView(),
          binding: MapBindings(),
        )
      ],
      initialRoute: '/login',
    return MaterialApp(
      home: RegisterView(),
    );
  }
}

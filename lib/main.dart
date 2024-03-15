import 'package:arosaje_mobile/accountpage/accountView.dart';
import 'package:arosaje_mobile/accountpage/accountViewControllerBlindings.dart';
import 'package:arosaje_mobile/homepage/homeBindings.dart';
import 'package:arosaje_mobile/homepage/homeVeiw.dart';
import 'package:arosaje_mobile/logPage/loginBindings.dart';
import 'package:arosaje_mobile/logPage/loginView.dart';
import 'package:arosaje_mobile/messagepage/messageView.dart';
import 'package:arosaje_mobile/messagepage/messageViewControllerBlindings.dart';
import 'package:arosaje_mobile/model/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainApp(),);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'test',
       getPages: [
        GetPage(
          name: '/home',
          title: 'Home page',
          page: () =>  const HomeView(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: '/login',
          title: 'Login page',
          page: () =>   LoginView(),
          binding: LoginBindings(),
        ),
        GetPage(
          name: '/account',
          title: 'Acoount',
          page: () =>  const AccountView(),
          binding: AccountBindings(),
        ),
          GetPage(
          name: '/message',
          title: 'Message',
          page: () => const MessageView(), // Utilisez la page qui affiche la liste de rarités
          binding: MessageBindings(), // Lier le contrôleur à la page
        ),
 
       
      ],
      initialRoute: '/login',
    );
  }
}

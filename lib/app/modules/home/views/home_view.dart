import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phone_auth/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("welcome to home page"),
          ElevatedButton(
            onPressed: () {
              firebaseAuth.signOut();
              Get.offAllNamed(Routes.LOGIN);
            },
            child: Text("LogOut"),
          )
        ],
      ),
    ));
  }
}

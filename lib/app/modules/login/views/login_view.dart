import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phone_auth/app/modules/login/views/localwidget/index.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageView(),
            EnterMobileNumber(),
            MobileNumberFeeld(),
            SubmitButton(
              text: "login",
              onPressed: () => controller.submit(),
            ),
          ],
        ),
      ),
    ));
  }
}

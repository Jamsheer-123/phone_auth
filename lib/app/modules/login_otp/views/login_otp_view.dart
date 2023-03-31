import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phone_auth/app/modules/login/views/localwidget/index.dart';
import 'package:phone_auth/app/modules/login_otp/views/localwidget/index.dart';

import '../controllers/login_otp_controller.dart';

class LoginOtpView extends GetView<LoginOtpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          ImageView(),
          EnterCodeText(),
          OtpPinField(),
          SubmitButton(
              text: "Verify",
              onPressed: () =>
                  controller.isLoading.value ? null : controller.submitOtp()),
          // OtpCancelButton(),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth/app/routes/app_pages.dart';

class LoginController extends GetxController {
  var mobileNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  // var userFirebase = FriebaseUser();
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void submit() async {
    isLoading(true);
    if (formKey.currentState!.validate()) {
      Get.toNamed(Routes.LOGIN_OTP);
    }
    isLoading(false);
  }
}

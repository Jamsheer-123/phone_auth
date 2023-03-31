import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_auth/app/modules/login/controllers/login_controller.dart';

class SubmitButton extends GetView<LoginController> {
  final String text;
  final VoidCallback onPressed;
  const SubmitButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      width: double.infinity,
      // height: 50,
      child: Obx(() {
        return ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
          child: controller.isLoading.value
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(text, style: const TextStyle(fontSize: 16)),
        );
      }),
    );
  }
}

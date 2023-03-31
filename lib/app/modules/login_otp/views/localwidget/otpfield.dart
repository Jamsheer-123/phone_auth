import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:phone_auth/app/modules/login/controllers/login_controller.dart';
import 'package:phone_auth/app/modules/login_otp/controllers/login_otp_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPinField extends GetView<LoginOtpController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: 250,
      child: Form(
        key: controller.formKey,
        child: Container(
          child: Theme(
            data: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
                  fillColor: Theme.of(context).canvasColor),
            ),
            child: PinCodeTextField(
              textStyle: TextStyle(color: Colors.blue),
              appContext: context,
              pastedTextStyle: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              length: 6,
              enablePinAutofill: true,
              obscureText: false,
              animationType: AnimationType.fade,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (v) {
                if (v!.length < 6) {
                  return "Please enter your OTP";
                } else {
                  return null;
                }
              },
              pinTheme: PinTheme(
                inactiveColor: Colors.blue,
                activeColor: Colors.blueAccent,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 36,
                fieldWidth: 36,
              ),
              animationDuration: Duration(milliseconds: 300),
              enableActiveFill: false,
              controller: controller.otp,
              onCompleted: (v) {},
              keyboardType: TextInputType.number,
              onChanged: controller.textFieldOnchange,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered

              beforeTextPaste: (text) {
                return true;
              },
            ),
          ),
        ),
      ),
    );
  }
}

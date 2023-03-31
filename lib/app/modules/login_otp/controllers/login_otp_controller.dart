import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:phone_auth/app/constands/toast_msg.dart';
import 'package:phone_auth/app/data/firbase_auth.dart';
import 'package:phone_auth/app/modules/login/controllers/login_controller.dart';

import '../../../routes/app_pages.dart';

class LoginOtpController extends GetxController {
  var attept = 0.obs;
  Timer? _timer;

  var mobileNumber = ''.obs;
  var mobileNumberController = Get.find<LoginController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final otp = TextEditingController();
  final _authFirebase = FirebaseAuthHelper();
  String? verificationId;
  final isLoading = false.obs;
  final _durationTimeOut = Duration(seconds: 60);
  final isCanResendCode = false.obs;
  final durationCountdown = 0.obs;
  var isShowWrongOtpText = false.obs;
  @override
  void onInit() async {
    mobileNumber.value = mobileNumberController.mobileNumberController.text;
    verifyPhoneNumber();

    // _listenForCode();
    super.onInit();
  }

  // Future<void> _listenForCode() async {
  //   try {
  //     String signature = await SmsAutoFill().getAppSignature;
  //     print('App Signature: $signature');
  //   } catch (e) {
  //     print('Error getting app signature: $e');
  //   }

  //   await SmsAutoFill()
  //       .listenForCode(
  //     smsCodeRegexPattern: r'\b\d{6}\b',
  //   )
  //       .then((value) {
  //     return value;
  //   });
  // }

  @override
  void onReady() {
    super.onReady();
  }

  void textFieldOnchange(e) {
    isShowWrongOtpText.value = false;
  }

  void verifyPhoneNumber() async {
    isLoading.value = true;

    isCanResendCode.value = false;
    await _authFirebase.sendSms(
      mobileNumber: mobileNumber.value,
      verificationFailed: (FirebaseAuthException e) async {
        isLoading.value = false;
        isCanResendCode.value = true;
        Get.snackbar(
          "Verification Failed",
          e.message ?? '',
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      codeSent: (verificationId, forceResendingToken) async {
        this.verificationId = verificationId;
        isLoading.value = false;
        _validateCountdownResendCode();
      },
    );
  }

  void _validateCountdownResendCode() {
    isCanResendCode.value = false;
    var maxDurationInSecond = _durationTimeOut.inSeconds;
    var currentDurationSecond = 0;
    durationCountdown.value = maxDurationInSecond;

    Timer.periodic(Duration(seconds: 1), (timer) {
      currentDurationSecond++;
      if (maxDurationInSecond - currentDurationSecond >= 0) {
        durationCountdown.value = maxDurationInSecond - currentDurationSecond;
      } else {
        isCanResendCode.value = true;
        timer.cancel();
      }
    });
  }

  void submitOtp() async {
    if (attept.value < 6) {
      isLoading.value = true;
      if (formKey.currentState!.validate() && verificationId != null) {
        isLoading.value = true;
        var result =
            await _authFirebase.verifySmsCode(otp.text, verificationId!);
        isLoading.value = false;
        if (result.isSuccess) {
          // await _userFirebase.setUser(mobileNumber.value);
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.snackbar(
            "Invalid Code",
            "Please enter the correct code",
            animationDuration: Duration(seconds: 1),
            backgroundColor: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
          attept.value = attept.value + 1;
          if (attept.value == 5) {
            // Disable phone number verification for 30 seconds
            Timer(Duration(seconds: 30), () {
              attept.value = 0;
            });
          }
        }
      }
      isLoading.value = false;
    } else {
      // showToastMsg("5 Invalid attempt,try again after 30 second");
      Fluttertoast.showToast(
        msg: "5 Invalid attempt,try again after 30 second",
      );
    }
  }

  @override
  void onClose() {}
}

class name extends StatefulWidget {
  const name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:get/get.dart';

import '../controllers/login_otp_controller.dart';

class LoginOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginOtpController>(
      () => LoginOtpController(),
    );
  }
}

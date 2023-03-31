import 'package:get/get.dart';

import 'package:phone_auth/app/modules/home/bindings/home_binding.dart';
import 'package:phone_auth/app/modules/home/views/home_view.dart';
import 'package:phone_auth/app/modules/login/bindings/login_binding.dart';
import 'package:phone_auth/app/modules/login/views/login_view.dart';
import 'package:phone_auth/app/modules/login_otp/bindings/login_otp_binding.dart';
import 'package:phone_auth/app/modules/login_otp/views/login_otp_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_OTP,
      page: () => LoginOtpView(),
      binding: LoginOtpBinding(),
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:phone_auth/app/constands/colors.constants.dart';
import 'package:phone_auth/app/constands/textStayles.constants.dart';

class EnterMobileNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      margin: EdgeInsets.only(bottom: 20, top: 10),
      child: Text(
        'Enter Your Mobile Number to Login',
        textAlign: TextAlign.center,
        style: AppTextStyles.bold.copyWith(
          color: AppColors.blue2,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    );
  }
}

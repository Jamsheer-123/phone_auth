import 'package:flutter/widgets.dart';

import 'colors.constants.dart';

class AppTextStyles {
  static const bold = TextStyle(
      fontSize: 30, fontFamily: AppFonts.lorinBold, color: AppColors.white);
  static const regular =
      TextStyle(fontSize: 14, fontFamily: AppFonts.lorinRegular);
  static const extraBold =
      TextStyle(fontSize: 14, fontFamily: AppFonts.lorinExtraBold);
  static const normal =
      TextStyle(fontSize: 18, fontFamily: AppFonts.lorinRegular);
}

class AppFonts {
  static const lorinRegular = 'Lorinregular';
  static const lorinBold = 'Lorinbold';
  static const lorinExtraBold = 'Lorinextrabold';
}

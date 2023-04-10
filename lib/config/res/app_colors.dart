import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Colors.blueAccent;
  static const Color primaryLightColor = Color(0xffff5131);
  static const Color primaryDarkColor = Color(0xff9b0000);
  static const Color textPrimaryColor = Color(0xffffffff);

  static const Color facebookColor = Color(0xff4267B2);
  static const Color googleColor = Colors.blueAccent;

  static const Color splashEffectColor = Color(0x33000000);
  static const Color dividerWhiteColor = Colors.white70;
  static const Color dividerBlackColor = Colors.black;
  static const Color navDrawerColor = Colors.black45;
  static const Color borderSideColor = Colors.black26;
  static const Color borderSideSelectedColor = Colors.lightBlue;
  static const Color headerBackgroundColor = Colors.black12;
  static const Color bottomSheetBgColor = Colors.white;
  static const Color disableColor = Colors.black12;
  static const Color errorColor = Color(0xffFFCCCC);
  static const Color textClickableColor = Colors.blueAccent;

  static const Color lightTextColor = Color(0x80000000);
  static const Color normalTextColor = Colors.black87;

  static Color getColorSelected(bool isChosen) {
    return isChosen
        ? AppColors.borderSideSelectedColor
        : AppColors.borderSideColor;
  }
}

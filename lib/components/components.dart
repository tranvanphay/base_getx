import 'dart:io';

import 'package:base_getx/config/res/app_colors.dart';
import 'package:base_getx/config/res/app_dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Components {
  static BottomNavigationBarItem buildNavItem(Widget icon,
      {String label = ""}) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.only(bottom: 3),
        child: icon,
      ),
      label: label,
    );
  }

  /// ========== appbar
  static AppBar buildPrimaryAppBar(
      {String title = "",
      double titleSize = 18,
      VoidCallback? onBackClick,
      List<Widget>? actions,
      bool centerTitle = false}) {
    return AppBar(
      leading: onBackClick != null
          ? IconButton(onPressed: onBackClick, icon: Icon(Icons.arrow_back_ios))
          : null,
      title: Text(
        title,
        style: TextStyle(fontSize: titleSize),
      ),
      centerTitle: centerTitle,
      backgroundColor: AppColors.primaryColor,
      actions: actions,
    );
  }

  static Widget buildSimpleHeader(String title) {
    return SizedBox(
        height: AppDimens.headerTypeHeight,
        child: Row(
          children: [
            Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: AppDimens.mediumTextSize,
                          color: AppColors.normalTextColor,
                          fontWeight: AppDimens.semiBold),
                    ))),
          ],
        ));
  }

  /// ========= search view
  static Widget buildSearchField(
      {Function(String?)? onSummited, String hint = ""}) {
    TextEditingController editingController = TextEditingController();
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          controller: editingController,
          textInputAction: TextInputAction.search,
          onFieldSubmitted: onSummited,
          style: const TextStyle(
            color: AppColors.normalTextColor,
          ),
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.search),
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: IconButton(
                onPressed: () {
                  if (editingController.text.isNotEmpty) {
                    editingController.text = '';
                  } else {
                    Get.focusScope?.unfocus();
                  }
                },
                icon: const Icon(Icons.close),
              )),
        ))
      ],
    );
  }

  /// horizontal item display: [Title ________ Value]
  static Widget buildRowTextItem(
          {String title = "",
          String value = "",
          FontWeight? titleFontWeight,
          FontWeight? valueFontWeight,
          Color? titleColor,
          Color? valueColor}) =>
      Row(children: [
        /// Title
        Expanded(
            child: Text(title,
                style: TextStyle(
                    color: titleColor,
                    fontSize: AppDimens.smallTextSize,
                    fontWeight: titleFontWeight))),

        /// Value
        Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppDimens.smallSpacingHor),
            child: Text(value,
                style: TextStyle(
                    color: valueColor,
                    fontSize: AppDimens.smallTextSize,
                    fontWeight: valueFontWeight)))
      ]);

  static Widget buildPrimaryButton(
      {String title = "",
      VoidCallback? onClick,
      EdgeInsets padding = EdgeInsets.zero}) {
    return Padding(
        padding: padding,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.primaryColor),
            onPressed: onClick,
            child: Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppDimens.buttonTextSize,
                    color: AppColors.textPrimaryColor))));
  }

  /// Input text field
  ///
  /// [isHideText]: for hide/show password
  static Widget buildTextFormField(
      {required String label,
      required void Function(String) onChanged,
      String? Function(String?)? onValidate,
      bool isHideText = false,
      VoidCallback? onHideText}) {
    return Row(children: [
      Expanded(
          child: TextFormField(
              onChanged: onChanged,
              validator: onValidate,
              obscureText: isHideText,
              decoration: InputDecoration(
                  suffixIcon: onHideText != null
                      ? IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: onHideText,
                          icon: isHideText
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off))
                      : null,
                  labelText: label,
                  labelStyle: TextStyle(
                      color: AppColors.lightTextColor,
                      fontSize: AppDimens.labelEditTextSize.sp))))
    ]);
  }

  static Widget buildEmptySearchData() => SizedBox.expand(
      child: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                "search_result_empty".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.normalTextColor,
                    fontSize: AppDimens.mediumTextSize),
              ))));

  static Widget buildSearchSuggestion() => SizedBox.expand(
          child: Center(
              child: Text(
        "Let's search".tr,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.normalTextColor,
            fontSize: AppDimens.mediumTextSize),
      )));

  static void configLoading() {
    if (Platform.isAndroid) {
      EasyLoading.instance
        ..displayDuration = const Duration(milliseconds: 500)
        ..indicatorType = EasyLoadingIndicatorType.fadingCircle
        // use EasyLoadingStyle.custom to apply others property
        ..loadingStyle = EasyLoadingStyle.custom
        ..indicatorSize = 48.0
        ..radius = 12.0
        ..progressColor = AppColors.primaryColor
        ..backgroundColor = Colors.white70
        ..indicatorColor = AppColors.primaryColor
        ..textColor = Colors.black
        ..textStyle =
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
        ..maskColor = Colors.blue.withOpacity(0.5)
        ..userInteractions = true
        ..dismissOnTap = false;
    } else {
      EasyLoading.instance
        ..indicatorWidget = Container(
            margin: const EdgeInsets.all(4),
            child: const CupertinoActivityIndicator(radius: 18))
        ..displayDuration = const Duration(milliseconds: 500)
        ..indicatorType = EasyLoadingIndicatorType.fadingCircle
        // use EasyLoadingStyle.custom to apply others property
        ..loadingStyle = EasyLoadingStyle.custom
        ..radius = 12.0
        ..progressColor = AppColors.primaryColor
        ..backgroundColor = Colors.white70
        ..indicatorColor = AppColors.primaryColor
        ..textColor = Colors.black
        ..textStyle =
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
        ..maskColor = Colors.blue.withOpacity(0.5)
        ..userInteractions = true
        ..dismissOnTap = false;
    }
  }
}

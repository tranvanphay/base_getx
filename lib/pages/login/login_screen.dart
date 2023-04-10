import 'package:base_getx/config/res/app_dimens.dart';
import 'package:base_getx/config/res/app_images.dart';
import 'package:base_getx/pages/login/login_controller.dart';
import 'package:base_getx/routes/app_pages.dart';
import 'package:base_getx/widget/core/base_button.dart';
import 'package:base_getx/widget/core/base_textview.dart';
import 'package:base_getx/widget/core/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  static void showMe() {
    Get.offAllNamed(AppRoutes.LOGIN);
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimens.mediumSpacingHor,
                  right: AppDimens.mediumSpacingHor,
                  bottom: AppDimens.mediumSpacingHor),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: AppDimens.mediumSpacingVer),
                    Image(
                      image: AppImages.icLogo,
                      width: AppDimens.logoSize,
                      height: AppDimens.logoSize / 2,
                    ),
                    SizedBox(height: AppDimens.aBitSpacingVer),
                    BaseTextView(
                        backgroundColor: Colors.grey[300],
                        paddingVer: 10,
                        textAlign: TextAlign.center,
                        text: 'message_on_login_screen'.tr),
                    SizedBox(height: AppDimens.mediumSpacingHor),
                    Row(
                      children: [
                        BaseTextField(
                            flex: 1,
                            hint: 'Email or ID',
                            controller: controller.usernameController,
                            textInputType: TextInputType.emailAddress,
                            node: node),
                      ],
                    ),
                    SizedBox(height: AppDimens.aBitSpacingVer),
                    Row(
                      children: [
                        BaseTextField(
                            flex: 1,
                            hint: 'Password',
                            controller: controller.passwordController,
                            textInputType: TextInputType.text,
                            isPasswordFiled: true,
                            node: node),
                      ],
                    ),
                    SizedBox(height: AppDimens.smallSpacingVer),
                    Obx(() => CheckboxListTile(
                        title: Text('Stay signed in'.tr),
                        value: controller.isAutoLogin.value,
                        onChanged: (isChecked) {
                          controller.changeAutoLogin(
                              isChecked: isChecked ?? false);
                        })),
                    SizedBox(height: AppDimens.smallSpacingVer),
                    BaseButton(
                        height: AppDimens.buttonHeight,
                        textButton: 'login'.tr,
                        buttonColor: Colors.blue[200]!,
                        textColor: Colors.white,
                        hasIcon: false,
                        isFullWidth: true,
                        onPressed: () {
                          controller.doLogin();
                        }),
                    SizedBox(height: AppDimens.aBitSpacingVer),
                    BaseButton(
                        height: AppDimens.buttonHeight,
                        textButton: 'Membership Inquiry'.tr,
                        buttonColor: Colors.orange[200]!,
                        textColor: Colors.white,
                        hasIcon: false,
                        isFullWidth: true,
                        onPressed: () {
                          controller.showRegisterScreen();
                        }),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 5,
                right: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseTextView(
                        textColor: Colors.grey[400],
                        text: 'Service Provider'.tr,
                        fontSize: 9.w,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image(
                          image: AppImages.icWorkIT,
                          height: AppDimens.iconSmallSize,
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}

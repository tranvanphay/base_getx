import 'package:base_getx/config/res/app_dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppDialog {
  static Future<String?> showDialogCreateAccount() async {
    TextEditingController controller = TextEditingController();
    GlobalKey<FormState> formState = GlobalKey();
    return await Get.dialog(
        _buildCreateAccount("create_account_dialog_title".tr,
            textEditingController: controller,
            formState: formState,
            actions: [
              CupertinoDialogAction(
                child: Text('Cancel'.tr),
                isDestructiveAction: true,
                onPressed: Get.back,
              ),
              CupertinoDialogAction(
                  child: Text('Confirm'.tr),
                  isDefaultAction: true,
                  onPressed: () {
                    if (formState.currentState!.validate()) {
                      Get.back(result: controller.text);
                    }
                  }),
            ],
            hintText: "Input folder name".tr,
            isOutlineBorder: false));
  }

  /// Default dialog với 1 action
  static Widget commonDialog({
    required String title,
    required String action,
    String? content,
    Function()? onPressed,
  }) {
    return CupertinoAlertDialog(
      title: Text(title.tr,
          style: Get.textTheme.bodyText1
              ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20.sp)),
      content: Text(
        content ?? '',
        style: Get.textTheme.bodyText1,
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: onPressed ??
              () {
                Get.back<void>();
              },
          child: Text(action),
        )
      ],
    );
  }

  static Widget actionsDialog({
    required String title,
    required String content,
    required List<CupertinoDialogAction> actions,
  }) {
    return CupertinoAlertDialog(
      title: Text(title,
          style: TextStyle(
              fontSize: AppDimens.largeTextSize, fontWeight: FontWeight.w700)),
      content: Padding(
          padding: EdgeInsets.only(top: 6.h),
          child: Text(
            content,
            style: Get.textTheme.bodyText1,
          )),
      actions: actions,
    );
  }

  static Future<bool> askStoragePermission() async {
    bool? isConfirm = await Get.dialog(_buildConfirmDialog(
        title: 'Permission required',
        message: 'Please access Storage permission for save file on download',
        buttonConfirm: 'Yes',
        isDangerCancel: true,
        isDefaultConfirm: true));
    return isConfirm ?? false;
  }

  static Widget _buildConfirmDialog(
      {String title = "",
      String message = "",
      String buttonCancel = 'Cancel',
      String buttonConfirm = 'OK',
      bool isDefaultConfirm = false,
      bool isDangerCancel = false,
      bool isDangerConfirm = false}) {
    return actionsDialog(title: title, content: message, actions: [
      CupertinoDialogAction(
          isDestructiveAction: isDangerCancel,
          child: Text(buttonCancel.tr),
          onPressed: () => Get.back(result: false)),
      CupertinoDialogAction(
          isDefaultAction: isDefaultConfirm,
          isDestructiveAction: isDangerConfirm,
          child: Text(buttonConfirm.tr),
          onPressed: () => Get.back(result: true))
    ]);
  }

  static Widget _buildCreateAccount(String title,
      {required TextEditingController textEditingController,
      required GlobalKey<FormState> formState,
      required List<Widget> actions,
      String? initValue = "",
      String? hintText,
      bool isObscureText = false,
      bool isOutlineBorder = true}) {
    textEditingController.text = initValue ?? "";
    return CupertinoAlertDialog(
      title: Text(title,
          style: TextStyle(
              fontSize: AppDimens.smallTextSize, fontWeight: FontWeight.w300)),
      content: Form(
          key: formState,
          child: Container(
              margin: EdgeInsets.only(top: 3.h),
              child: TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'field_must_not_empty'.tr;
                  }
                  return null;
                },
                controller: textEditingController,
                style: const TextStyle(fontSize: 12),
                obscureText: isObscureText,
                decoration: InputDecoration(
                    hintText: hintText,
                    border:
                        isOutlineBorder ? const OutlineInputBorder() : null),
              ))),
      actions: actions,
    );
  }

  static Future<bool> confirmSignOut() async {
    bool? isConfirmSignout = await Get.dialog(_buildConfirmDialog(
        title: 'confirm'.tr,
        message: 'sign_out_msg'.tr,
        buttonConfirm: 'yes'.tr,
        buttonCancel: 'cancel'.tr,
        isDangerConfirm: true));
    return isConfirmSignout ?? false;
  }

  static Future<bool> confirmDelete() async {
    bool? isConfirmDelete = await Get.dialog(_buildConfirmDialog(
        title: 'confirm'.tr,
        message: 'confirm_delete_mess'.tr,
        buttonConfirm: 'yes'.tr,
        buttonCancel: 'cancel'.tr,
        isDangerConfirm: true));
    return isConfirmDelete ?? false;
  }
}

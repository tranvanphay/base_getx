import 'package:base_getx/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:base_getx/base/base_controller.dart';
import 'package:base_getx/repositories/remote/auth_api.dart';

class BaseWidgetListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BaseWidgetListController>(BaseWidgetListController());
  }
}

class BaseWidgetListController extends BaseController {
  GlobalKey<FormState> formKey = GlobalKey();
  // TextEditingController usernameController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // RxBool isAutoBaseWidgetList = false.obs;
  // final AuthApi authApi;
  // final AppProvider appProvider;
  final RxInt currentIndex = 0.obs;
  final RxInt currentIndexMore = (-1).obs;

  final RxBool showMore = false.obs;
  BaseWidgetListController();

  @override
  void onInit() {
    super.onInit();
  }

  void onChanged(int index) {
    if (index == 3) {
      showMore.value = true;
      return;
    } else {
      currentIndex.value = index;
      showMore.value = false;
    }
  }

  void onChangedMore(int index) {
    currentIndexMore.value = index;
  }
}

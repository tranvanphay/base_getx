import 'package:base_getx/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:base_getx/base/base_controller.dart';
import 'package:base_getx/repositories/remote/auth_api.dart';

class BaseWidgetListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BaseWidgetListController>(
        BaseWidgetListController(authApi: Get.find(), appProvider: Get.find()));
  }
}

class BaseWidgetListController extends BaseController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isAutoBaseWidgetList = false.obs;
  final AuthApi authApi;
  final AppProvider appProvider;
  BaseWidgetListController({required this.authApi, required this.appProvider});

  @override
  void onInit() {
    super.onInit();
    final _username = appProvider.getUserName();
    final _password = appProvider.getPassword();
    if (_username != null) {
      usernameController.text = _username;
      passwordController.text = _password ?? '';
    } else {
      usernameController.text = "admin@example.com";
      passwordController.text = "admin";
    }
  }

  void changeAutoBaseWidgetList({required bool isChecked}) {
    isAutoBaseWidgetList.value = isChecked;
  }

  void showRegisterScreen() {
    // RegisterScreen.showMe();
  }

  void _showHomeScreen() {
    // HomeScreen.showMe();
  }
}

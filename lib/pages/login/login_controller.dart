import 'dart:developer';

import 'package:base_getx/constant/globals.dart';
import 'package:base_getx/model/req/login_req.dart';
import 'package:base_getx/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:base_getx/base/base_controller.dart';
import 'package:base_getx/repositories/remote/auth_api.dart';
import 'package:jwt_decode/jwt_decode.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
        LoginController(authApi: Get.find(), appProvider: Get.find()));
  }
}

class LoginController extends BaseController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isAutoLogin = false.obs;
  final AuthApi authApi;
  final AppProvider appProvider;
  LoginController({required this.authApi, required this.appProvider});

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

  void changeAutoLogin({required bool isChecked}) {
    isAutoLogin.value = isChecked;
  }

  void showRegisterScreen() {
    // RegisterScreen.showMe();
  }

  void _showHomeScreen() {
    // HomeScreen.showMe();
  }

  void doLogin() {
    showLoading();
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      authApi
          .login(LoginReq(
              email: usernameController.text,
              password: passwordController.text))
          .then((res) {
        dismissLoading();
        if (res.data != null) {
          appProvider.setStayLogin(isAutoLogin.value);
          appProvider.setUserName(usernameController.text);
          appProvider.setPassword(passwordController.text);
          token = "Bearer ${res.data?.token}";
          userName = usernameController.text;
          Map<String, dynamic> payload = Jwt.parseJwt(res.data?.token ?? '');
          userRole = payload["dailyLogMenuType"];
          siteCode = payload["siteCode"];
          userId = payload['id'];
          log(userRole);
          _showHomeScreen();
        } else {
          EasyLoading.showError(res.message ?? '');
        }
      });
    } else {
      EasyLoading.showToast("User name and password cannot empty");
    }
  }
}

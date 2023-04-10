import 'package:base_getx/components/components.dart';
import 'package:base_getx/constant/globals.dart';
import 'package:base_getx/pages/webview_page/webview_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../routes/app_pages.dart';

class WebviewPageScreen extends GetView<WebviewPageController> {
  static void showMe(String title, String url) {
    Get.toNamed(AppRoutes.WEBVIEW_PAGE, arguments: [title, url]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: Components.buildPrimaryAppBar(title: controller.title),
        body: SafeArea(child: Container(child: _buildWebviewPageScreen())));
  }

  Widget _buildWebviewPageScreen() {
    return WebView(
      onWebViewCreated: (webviewController) {
        EasyLoading.show(status: "Loading");
        Map<String, String> headers = {
          "Authorization": token,
          "User-Agent": "Chrome/102.0.5005.134"
        };
        webviewController.loadUrl(controller.url, headers: headers);
      },
      onPageStarted: (data) {},
      onPageFinished: (data) {
        if (EasyLoading.isShow) {
          EasyLoading.dismiss();
        }
      },
    );
  }
}

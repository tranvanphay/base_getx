import 'package:base_getx/pages/base_widget_list/base_widget_list_controller.dart';
import 'package:base_getx/routes/app_pages.dart';
import 'package:base_getx/widget/core/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseWidgetListScreen extends GetView<BaseWidgetListController> {
  static void showMe() {
    Get.offAllNamed(AppRoutes.BASE);
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              children: [
                BaseTextField(
                    hint: 'Name',
                    controller: TextEditingController(),
                    textInputType: TextInputType.text,
                    node: node),
              ],
            )
          ],
        )),
      ),
    ));
  }
}

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
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                BaseTextField(
                    hint: 'Name',
                    controller: TextEditingController(),
                    textInputType: TextInputType.text,
                    node: node),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                BaseTextField(
                    hint: 'Name',
                    controller: TextEditingController(),
                    textInputType: TextInputType.text,
                    node: node),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                BaseTextField(
                    hint: 'Name',
                    controller: TextEditingController(),
                    textInputType: TextInputType.text,
                    node: node),
              ],
            ),
            SizedBox(
              height: 100,
            ),
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
      bottomNavigationBar: Obx(() => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.showMore.value == true
                  ? BottomNavigationBar(
                      showUnselectedLabels: true,
                      unselectedItemColor: Colors.grey,
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'More1',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.business),
                          label: 'More2',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.school),
                          label: 'More3',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.school),
                          label: 'More4',
                        ),
                      ],
                      currentIndex: controller.currentIndexMore.value,
                      selectedItemColor: Colors.grey,
                      onTap: (index) {
                        controller.onChangedMore(index);
                      },
                    )
                  : const SizedBox.shrink(),
              BottomNavigationBar(
                showUnselectedLabels: true,
                unselectedItemColor: Colors.grey,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.business),
                    label: 'Business',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.school),
                    label: 'School',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.school),
                    label: 'School1',
                  ),
                ],
                currentIndex: controller.currentIndex.value,
                selectedItemColor: Colors.amber[800],
                onTap: (index) {
                  controller.onChanged(index);
                },
              )
            ],
          )),
    ));
  }
}

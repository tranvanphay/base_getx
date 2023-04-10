import 'package:base_getx/base/base_controller.dart';
import 'package:get/get.dart';

class WebviewPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WebviewPageController());
  }
}

class WebviewPageController extends BaseController {
  WebviewPageController();
  late String title;
  late String url;
  void onInit() async {
    super.onInit();
    initData();
  }

  void initData() {
    var data = Get.arguments;
    if (data != null && data[0] is String) {
      title = data[0];
    }
    if (data != null && data[1] is String) {
      url = data[1];
    }
  }
}

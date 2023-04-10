import 'package:base_getx/pages/base_widget_list/base_widget_list_controller.dart';
import 'package:base_getx/pages/base_widget_list/base_widget_list_screen.dart';
import 'package:base_getx/pages/login/login_controller.dart';
import 'package:base_getx/pages/login/login_screen.dart';
import 'package:base_getx/pages/webview_page/webview_page_controller.dart';
import 'package:base_getx/pages/webview_page/webview_page_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  // static const INITIAL = Routes.HOME;

  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginScreen(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: AppRoutes.BASE,
      page: () => BaseWidgetListScreen(),
      bindings: [BaseWidgetListBinding()],
    ),
    GetPage<dynamic>(
      name: AppRoutes.WEBVIEW_PAGE,
      page: () => WebviewPageScreen(),
      bindings: [WebviewPageBinding()],
    ),
  ];
}

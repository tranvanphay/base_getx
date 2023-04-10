import 'package:base_getx/config/languages/mobile_language_config.dart';
import 'package:base_getx/provider/app_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app_scope_binding.dart';
import '../routes/app_pages.dart';

class MyApplication extends StatelessWidget {
  final AppProvider _appProvider = Get.find();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
        child: ScreenUtilInit(
            designSize: const Size(375, 667),
            builder: (BuildContext c, Widget? widget) => GetMaterialApp(
                  builder: EasyLoading.init(),
                  initialRoute: AppRoutes.BASE,
                  getPages: AppPages.routes,
                  debugShowCheckedModeBanner: false,
                  initialBinding: AppBinding(),
                  defaultTransition: Transition.fadeIn,
                  transitionDuration: const Duration(milliseconds: 375),
                  locale: getAppLocale(),
                  translations: MobileLangConfig(),
                  fallbackLocale: MobileLangConfig.fallbackLocale,
                )));
  }

  Locale? getAppLocale() {
    return Locale('ko', 'KR');
    // return _appProvider.getAppLocale() ?? Get.deviceLocale;
  }
}

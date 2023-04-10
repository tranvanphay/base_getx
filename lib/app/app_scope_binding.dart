import 'package:base_getx/app/modules/provider_module.dart';
import 'package:get/get.dart';

import 'modules/network_module.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    ProviderModule.init();

    NetworkModule.init();
  }
}

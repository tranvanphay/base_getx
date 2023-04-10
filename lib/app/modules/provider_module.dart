import 'package:base_getx/provider/app_provider.dart';
import 'package:base_getx/provider_impl/share_pref_provider_impl.dart';
import 'package:get/get.dart';

class ProviderModule {
  static Future init() async {
    await Get.putAsync<AppProvider>(() => SharePrefProviderImpl.init());
  }
}

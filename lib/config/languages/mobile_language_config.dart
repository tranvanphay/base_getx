import 'dart:ui';

import 'package:base_getx/provider/language_provider.dart';
import 'package:get/get.dart';

class MobileLangConfig extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      LanguageProvider.getSupportedLang();

  static final fallbackLocale = Locale('ko', 'KR');

  static final langCodes = [
    'en',
    'ko',
  ];

  static final locales = [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
  ];
}

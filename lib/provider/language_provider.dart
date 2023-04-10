import 'package:base_getx/constant/languages_constants.dart';

class LanguageProvider {
  static Map<String, Map<String, String>> getSupportedLang() {
    return {
      'ko_KR': LangConstants.kr,
      'en_US': LangConstants.en,
    };
  }
}

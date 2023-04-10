import 'dart:ui';

import 'package:base_getx/constant/pref_constants.dart';
import 'package:base_getx/provider/app_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefProviderImpl extends AppProvider {
  final SharedPreferences _prefs;

  SharePrefProviderImpl._(this._prefs);

  static Future<SharePrefProviderImpl> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return SharePrefProviderImpl._(prefs);
  }

  @override
  String getLangCode() {
    String localLangCode =
        _prefs.getString(PrefConstants.PREFS_LANG_CODE) ?? "";
    return localLangCode;
  }

  @override
  void saveLanguage(String langCode) {
    _prefs.setString(PrefConstants.PREFS_LANG_CODE, langCode);
  }

  @override
  Locale? getAppLocale() {
    String langCode = getLangCode();
    if (langCode.isNotEmpty) return Locale(langCode);
    return null;
  }

  @override
  bool isStayLogin() {
    return _prefs.getBool(PrefConstants.PREFS_STAY_LOGIN) ?? false;
  }

  @override
  void setStayLogin(bool value) {
    _prefs.setBool(PrefConstants.PREFS_STAY_LOGIN, value);
  }

  @override
  String? getPassword() {
    return _prefs.getString(PrefConstants.PREFS_PASSWORD);
  }

  @override
  String? getUserName() {
    return _prefs.getString(PrefConstants.PREFS_USER_NAME);
  }

  @override
  void setPassword(String password) {
    _prefs.setString(PrefConstants.PREFS_PASSWORD, password);
  }

  @override
  void setUserName(String userName) {
    _prefs.setString(PrefConstants.PREFS_USER_NAME, userName);
  }

  @override
  String? getToken() {
    return _prefs.getString(PrefConstants.PREFS_TOKEN);
  }

  @override
  void setToken(String token) {
    _prefs.setString(PrefConstants.PREFS_TOKEN, token);
  }
}

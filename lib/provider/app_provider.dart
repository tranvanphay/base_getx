import 'dart:ui';

/// Share preference
abstract class AppProvider {
  bool isStayLogin();

  void setStayLogin(bool value);

  void saveLanguage(String langCode);

  String getLangCode();

  String? getUserName();
  void setUserName(String userName);

  String? getPassword();
  void setPassword(String password);

  Locale? getAppLocale();

  String? getToken();
  void setToken(String token);
}

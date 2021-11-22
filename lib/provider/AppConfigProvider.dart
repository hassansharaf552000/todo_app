import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en'; // Todo:read this value from sharedprefences
  ThemeMode appTheme =
      ThemeMode.light; //  Todo:read this value from sharedprefences
  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }

  void changeTheme(ThemeMode newMode) {
    if (newMode == appTheme) {
      return;
    }
    appTheme = newMode;
    //Todo:Save this value to sharedprefences
    notifyListeners();
  }

  void changeLanguage(String langCode) {
    if (langCode == appLanguage) {
      return;
    }
    //Todo:Save this value to sharedprefences
    appLanguage = langCode;
    notifyListeners();
  }
}
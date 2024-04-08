import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = const Locale('en');

  Locale get appLocal => _appLocale;
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = const Locale('en');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code') ?? 'en');
    return Null;
  }

  // void changeLanguage(Locale type) async {
  //   var prefs = await SharedPreferences.getInstance();
  //   if (_appLocale == type) {
  //     return;
  //   }
  //   if (type == const Locale("ar")) {
  //     _appLocale = const Locale("ar");
  //     await prefs.setString('language_code', 'ar');
  //     await prefs.setString('countryCode', '');
  //   } else if (type == const Locale("es")) {
  //     _appLocale = const Locale("es");
  //     await prefs.setString('language_code', 'es');
  //     await prefs.setString('countryCode', '');
  //   } else if (type == const Locale("zh")) {
  //     _appLocale = const Locale("zh");
  //     await prefs.setString('language_code', 'zh');
  //     await prefs.setString('countryCode', '');
  //   } else {
  //     _appLocale = const Locale("en");
  //     await prefs.setString('language_code', 'en');
  //     await prefs.setString('countryCode', 'US');
  //   }
  //   notifyListeners();
  // }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    _appLocale = type;
    notifyListeners();
    if (type.languageCode == "ar") {
      _appLocale = const Locale("ar", "");
      await prefs.setString('language_code', 'ar');
      await prefs.setString('countryCode', '');
    } else if (type.languageCode == "es") {
      _appLocale = const Locale("es", "");
      await prefs.setString('language_code', 'es');
      await prefs.setString('countryCode', '');
    } else if (type.languageCode == "zh") {
      _appLocale = const Locale("zh", "");
      await prefs.setString('language_code', 'zh');
      await prefs.setString('countryCode', '');
    } else {
      _appLocale = const Locale("en", "US");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
    notifyListeners();
  }
}

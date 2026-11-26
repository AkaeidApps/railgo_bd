import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

class StorageService extends GetxService {
  late SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  String get language => _prefs.getString(AppConstants.keyLanguage) ?? 'bn';
  Future<bool> setLanguage(String lang) =>
      _prefs.setString(AppConstants.keyLanguage, lang);

  bool get isDarkMode => _prefs.getBool(AppConstants.keyIsDarkMode) ?? false;
  Future<bool> setDarkMode(bool value) =>
      _prefs.setBool(AppConstants.keyIsDarkMode, value);

  bool get isFirstTime => _prefs.getBool(AppConstants.keyIsFirstTime) ?? true;
  Future<bool> setFirstTimeDone() =>
      _prefs.setBool(AppConstants.keyIsFirstTime, false);

  String? get token => _prefs.getString(AppConstants.keyAuthToken);
  Future<bool> setToken(String token) =>
      _prefs.setString(AppConstants.keyAuthToken, token);
  Future<bool> clearToken() => _prefs.remove(AppConstants.keyAuthToken);
}

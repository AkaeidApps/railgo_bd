import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/services/storage_service.dart';
import '../../core/theme/theme_controller.dart';

class SettingsController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();
  late final ThemeController _themeController = Get.find<ThemeController>();

  final isBengali = true.obs;

  @override
  void onInit() {
    super.onInit();
    isBengali.value = _storageService.language == 'bn';
  }

  void toggleLanguage(bool value) {
    isBengali.value = value;
    final lang = value ? 'bn' : 'en';
    _storageService.setLanguage(lang);
    Get.updateLocale(Locale(lang, lang == 'bn' ? 'BD' : 'US'));
  }

  void setThemeMode(ThemeMode mode) {
    _themeController.setThemeMode(mode);
  }
}

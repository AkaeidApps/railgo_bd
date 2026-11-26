import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/storage_service.dart';

class ThemeController extends GetxController {
  final StorageService _storage = Get.find<StorageService>();

  late Rx<ThemeMode> themeMode;

  @override
  void onInit() {
    super.onInit();
    final isDark = _storage.isDarkMode;
    themeMode = (isDark ? ThemeMode.dark : ThemeMode.light).obs;
  }

  bool get isDarkMode {
    if (themeMode.value == ThemeMode.system) {
      return WidgetsBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;
    }
    return themeMode.value == ThemeMode.dark;
  }

  void setThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    Get.changeThemeMode(mode);
    bool dark = mode == ThemeMode.dark;
    if (mode == ThemeMode.system) {
      dark =
          WidgetsBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;
    }
    _storage.setDarkMode(dark);
  }

  void toggleTheme() {
    if (themeMode.value == ThemeMode.dark) {
      setThemeMode(ThemeMode.light);
    } else {
      setThemeMode(ThemeMode.dark);
    }
  }
}

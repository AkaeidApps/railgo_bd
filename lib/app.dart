import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constants/app_constants.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'core/services/localization_service.dart';
import 'core/services/storage_service.dart';
import 'core/theme/app_theme.dart';

class RailGoApp extends StatelessWidget {
  const RailGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = Get.find<StorageService>();
    final initialLang = storage.language;

    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: storage.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      translations: LocalizationService(),
      locale: Locale(initialLang, initialLang == 'bn' ? 'BD' : 'US'),
      fallbackLocale: const Locale('bn', 'BD'),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
    );
  }
}

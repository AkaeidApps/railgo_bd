import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app.dart';
import 'core/services/storage_service.dart';
import 'core/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('bn_BD');
  await Get.putAsync(() => StorageService().init());
  Get.put(ThemeController(), permanent: true);
  runApp(const RailGoApp());
}

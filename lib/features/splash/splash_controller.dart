import 'package:get/get.dart';

import '../../core/routes/app_routes.dart';
import '../../core/services/storage_service.dart';

class SplashController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();

  @override
  void onInit() {
    super.onInit();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 2));
    if (_storageService.isFirstTime) {
      Get.offAllNamed(AppRoutes.onboarding);
    } else {
      Get.offAllNamed(AppRoutes.mainNav);
    }
  }
}

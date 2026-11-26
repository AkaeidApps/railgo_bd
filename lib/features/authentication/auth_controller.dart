import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/routes/app_routes.dart';
import '../../data/repositories/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepo = AuthRepository();

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final nidController = TextEditingController();
  final otpController = TextEditingController();

  final isLoading = false.obs;

  void login() async {
    if (phoneController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in mobile number and password',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
      return;
    }

    isLoading.value = true;
    final success = await _authRepo.login(
      phoneController.text,
      passwordController.text,
    );
    isLoading.value = false;

    if (success) {
      Get.offAllNamed(AppRoutes.mainNav);
    }
  }

  void register() async {
    if (nameController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty ||
        nidController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all required registration fields',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
      return;
    }

    Get.toNamed(AppRoutes.otpVerification);
  }

  void verifyOtp() async {
    isLoading.value = true;
    final success = await _authRepo.register(
      nameController.text,
      phoneController.text,
      emailController.text,
      nidController.text,
      passwordController.text,
    );
    isLoading.value = false;

    if (success) {
      Get.offAllNamed(AppRoutes.mainNav);
    }
  }
}

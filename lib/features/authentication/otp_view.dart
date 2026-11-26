import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/rail_button.dart';
import '../../core/widgets/rail_text_field.dart';
import 'auth_controller.dart';

class OtpView extends GetView<AuthController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('OTP Verification')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Verify Phone Number',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'We have sent a 6-digit verification code to ${controller.phoneController.text.isEmpty ? "+8801700000000" : controller.phoneController.text}',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 32),
              RailTextField(
                label: 'Enter 6-Digit OTP',
                hint: '1 2 3 4 5 6',
                controller: controller.otpController,
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(
                  Icons.pin_rounded,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 32),
              Obx(
                () => RailButton(
                  text: 'Verify & Create Profile',
                  isLoading: controller.isLoading.value,
                  onPressed: controller.verifyOtp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

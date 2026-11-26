import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/rail_button.dart';
import '../../core/widgets/rail_text_field.dart';
import 'auth_controller.dart';

class ForgotPasswordView extends GetView<AuthController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Reset Password')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Forgot Your Password?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter your registered Bangladesh mobile number to receive password reset OTP.',
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 32),
              RailTextField(
                label: 'Mobile Number',
                hint: '017XXXXXXXX',
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(
                  Icons.phone_android_rounded,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 32),
              RailButton(
                text: 'Send Reset Code',
                onPressed: () {
                  Get.snackbar(
                    'OTP Sent',
                    'Reset OTP sent to mobile number',
                    backgroundColor: AppColors.lightGreen,
                    colorText: AppColors.primary,
                  );
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

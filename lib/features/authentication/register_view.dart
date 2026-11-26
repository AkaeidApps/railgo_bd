import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/rail_button.dart';
import '../../core/widgets/rail_text_field.dart';
import 'auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Create Account')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Register RailGo BD Profile',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'NID or Birth Registration is required for Bangladesh Railway verification.',
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 24),
              RailTextField(
                label: 'Full Name (as in NID)',
                hint: 'MD. TANVIR HOSSAIN',
                controller: controller.nameController,
                prefixIcon: const Icon(
                  Icons.person_outline_rounded,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              RailTextField(
                label: 'Mobile Number',
                hint: '017XXXXXXXX',
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(
                  Icons.phone_android_rounded,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              RailTextField(
                label: 'Email Address (Optional)',
                hint: 'name@example.com',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              RailTextField(
                label: 'NID / Birth Registration Number',
                hint: '17-digit NID or Smart Card No.',
                controller: controller.nidController,
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(
                  Icons.badge_outlined,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              RailTextField(
                label: 'Password',
                hint: '••••••••',
                controller: controller.passwordController,
                obscureText: true,
                prefixIcon: const Icon(
                  Icons.lock_outline_rounded,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 32),
              RailButton(
                text: 'Send Verification OTP',
                onPressed: controller.register,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already registered? ',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.login),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/rail_button.dart';
import '../../core/widgets/rail_text_field.dart';

class ProfileSetupView extends StatelessWidget {
  const ProfileSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Complete Profile')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 44,
                  backgroundColor: AppColors.lightGreen,
                  child: Icon(
                    Icons.person_rounded,
                    size: 48,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Personal & Travel Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              RailTextField(
                label: 'Emergency Mobile Number',
                hint: '018XXXXXXXX',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              RailTextField(label: 'Post Code / Address', hint: 'Dhaka-1212'),
              const SizedBox(height: 32),
              RailButton(
                text: 'Save & Continue to App',
                onPressed: () => Get.offAllNamed(AppRoutes.mainNav),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

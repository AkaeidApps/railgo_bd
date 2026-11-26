import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/rail_button.dart';
import '../../core/widgets/rail_text_field.dart';

class PassengerInfoView extends StatelessWidget {
  const PassengerInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};

    final nameController = TextEditingController(text: 'MD. TANVIR HOSSAIN');
    final phoneController = TextEditingController(text: '+8801700000000');
    final nidController = TextEditingController(text: '19952691234567891');

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Passenger Information')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Verify Passenger Details (Bangladesh Railway Policy)',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Passenger name and NID must match official photo ID during journey verification.',
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 24),
              RailTextField(
                label: 'Passenger Full Name',
                controller: nameController,
                prefixIcon: const Icon(
                  Icons.person_outline_rounded,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              RailTextField(
                label: 'Mobile Number',
                controller: phoneController,
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(
                  Icons.phone_android_rounded,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              RailTextField(
                label: 'NID / Birth Certificate Number',
                controller: nidController,
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(
                  Icons.badge_outlined,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 32),
              RailButton(
                text: 'Proceed to Booking Review',
                onPressed: () {
                  args['passengerName'] = nameController.text;
                  args['passengerPhone'] = phoneController.text;
                  args['passengerNid'] = nidController.text;
                  Get.toNamed(AppRoutes.bookingReview, arguments: args);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

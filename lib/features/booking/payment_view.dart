import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/rail_card.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};

    final methods = [
      {'name': 'bKash Mobile Banking', 'icon': 'assets/bkash.png'},
      {'name': 'Nagad Mobile Banking', 'icon': 'assets/nagad.png'},
      {'name': 'Rocket', 'icon': 'assets/rocket.png'},
      {'name': 'Visa / Mastercard / DBBL', 'icon': 'assets/card.png'},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Payment Gateway')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Payment Method',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            ...methods.map(
              (m) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: RailCard(
                  onTap: () {
                    Get.toNamed(AppRoutes.bookingStatus, arguments: args);
                  },
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.account_balance_wallet_rounded,
                            color: AppColors.primary,
                            size: 24,
                          ),
                          const SizedBox(width: 14),
                          Text(
                            m['name']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

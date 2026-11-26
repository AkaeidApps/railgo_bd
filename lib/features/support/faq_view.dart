import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/rail_card.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Frequently Asked Questions')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          RailCard(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How do I verify my ticket during journey?',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'You can present the digital E-Ticket QR code from the RailGo BD app along with your NID or Birth Certificate.',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

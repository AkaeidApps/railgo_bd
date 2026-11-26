import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../data/models/train_model.dart';
import '../theme/app_text_styles.dart';

class PremiumTrainCard extends StatelessWidget {
  final TrainModel train;
  final VoidCallback onTap;

  const PremiumTrainCard({super.key, required this.train, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Material(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        elevation: 0,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colorScheme.outline.withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.train,
                            color: colorScheme.primary,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              train.nameEn,
                              style: AppTextStyles.titleMedium(context),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Train No: ${train.trainNumber} • ${train.category}',
                              style: AppTextStyles.bodySmall(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        train.verificationStatus,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(height: 1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Departure',
                          style: AppTextStyles.bodySmall(context),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          train.departureTime,
                          style: AppTextStyles.titleMedium(context),
                        ),
                        Text(
                          train.originStationNameEn,
                          style: AppTextStyles.bodySmall(context),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: colorScheme.secondary,
                          size: 20,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          train.journeyDuration,
                          style: AppTextStyles.bodySmall(context),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Arrival',
                          style: AppTextStyles.bodySmall(context),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          train.arrivalTime,
                          style: AppTextStyles.titleMedium(context),
                        ),
                        Text(
                          train.destinationStationNameEn,
                          style: AppTextStyles.bodySmall(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1, end: 0);
  }
}

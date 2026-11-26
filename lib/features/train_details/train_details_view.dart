import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/utils/currency_formatter.dart';
import '../../core/widgets/rail_button.dart';
import '../../core/widgets/rail_card.dart';
import '../../core/widgets/verified_badge.dart';
import '../../data/models/train_model.dart';

class TrainDetailsView extends StatelessWidget {
  const TrainDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final TrainModel train =
        Get.arguments ??
        TrainModel(
          trainId: 'default',
          trainNumber: '701',
          nameEn: 'Suborno Express',
          nameBn: 'সুবর্ণ এক্সপ্রেস',
          category: 'Intercity',
          originStationCode: 'CGP',
          originStationNameEn: 'Chattogram Central',
          originStationNameBn: 'চট্টগ্রাম সেন্ট্রাল',
          destinationStationCode: 'DAK',
          destinationStationNameEn: 'Dhaka Kamalapur',
          destinationStationNameBn: 'ঢাকা কমলাপুর',
          departureTime: '07:00',
          arrivalTime: '12:15',
          journeyDuration: '5h 15m',
          weeklyOffDay: 'Monday',
          availableClasses: ['Shovon Chair', 'Snigdha'],
          routeStoppages: [],
          fares: [],
          operationalStatus: 'Active',
          source: 'https://railway.gov.bd/',
          verificationStatus: 'verified',
          lastVerifiedAt: DateTime.now().toIso8601String(),
        );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(train.nameEn),
        actions: [
          IconButton(
            onPressed: () =>
                Get.toNamed(AppRoutes.routeTimeline, arguments: train),
            icon: const Icon(Icons.timeline_rounded),
            tooltip: 'Route Timeline',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RailCard(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${train.nameEn} (${train.trainNumber})',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      VerifiedBadge(status: train.verificationStatus),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${train.nameBn} • Category: ${train.category}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const Divider(height: 24, color: AppColors.divider),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Origin',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Text(
                            train.originStationNameEn,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            train.departureTime,
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        color: AppColors.primary,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Destination',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Text(
                            train.destinationStationNameEn,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            train.arrivalTime,
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_rounded,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Weekly Off-Day: ${train.weeklyOffDay}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Route & Stoppages',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            RailCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: train.routeStoppages.map((stop) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.fiber_manual_record,
                              size: 12,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              stop.stationNameEn,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${stop.arrivalTime} / ${stop.departureTime}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Fare Structure',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            RailCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: train.fares.map((fare) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          fare.trainClass,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          CurrencyFormatter.format(fare.totalFare),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 30),
            RailButton(
              text: 'Book Tickets for this Train',
              onPressed: () =>
                  Get.toNamed(AppRoutes.seatSelection, arguments: train),
            ),
          ],
        ),
      ),
    );
  }
}

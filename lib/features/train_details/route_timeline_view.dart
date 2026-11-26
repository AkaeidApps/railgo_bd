import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/rail_card.dart';
import '../../data/models/train_model.dart';

class RouteTimelineView extends StatelessWidget {
  const RouteTimelineView({super.key});

  @override
  Widget build(BuildContext context) {
    final TrainModel train = Get.arguments;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text('${train.nameEn} - Route Timeline')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: train.routeStoppages.length,
        itemBuilder: (context, index) {
          final stop = train.routeStoppages[index];
          final isFirst = index == 0;
          final isLast = index == train.routeStoppages.length - 1;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: isFirst || isLast
                          ? AppColors.primary
                          : AppColors.lightGreen,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 2),
                    ),
                  ),
                  if (!isLast)
                    Container(
                      width: 2,
                      height: 60,
                      color: AppColors.primary.withValues(alpha: 0.4),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: RailCard(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stop.stationNameEn,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            stop.stationNameBn,
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Distance: ${stop.distanceKm} km',
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Arr: ${stop.arrivalTime}',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Dep: ${stop.departureTime}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

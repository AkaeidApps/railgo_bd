import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/rail_button.dart';
import '../../core/widgets/rail_card.dart';
import 'train_search_controller.dart';

class TrainSearchView extends GetView<TrainSearchController> {
  const TrainSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrainSearchController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Search Trains')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RailCard(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Find Bangladesh Railway Trains',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // From Station
                    Obx(
                      () => ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: AppColors.border),
                        ),
                        leading: const Icon(
                          Icons.trip_origin_rounded,
                          color: AppColors.primary,
                        ),
                        title: const Text(
                          'From Station',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        subtitle: Text(
                          controller.fromStation.value != null
                              ? '${controller.fromStation.value!.stationNameEn} (${controller.fromStation.value!.stationCode})'
                              : 'Select Station',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        onTap: () => _showStationPicker(context, true),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // To Station
                    Obx(
                      () => ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: AppColors.border),
                        ),
                        leading: const Icon(
                          Icons.location_on_rounded,
                          color: AppColors.error,
                        ),
                        title: const Text(
                          'To Station',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        subtitle: Text(
                          controller.toStation.value != null
                              ? '${controller.toStation.value!.stationNameEn} (${controller.toStation.value!.stationCode})'
                              : 'Select Station',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        onTap: () => _showStationPicker(context, false),
                      ),
                    ),
                    const SizedBox(height: 20),
                    RailButton(
                      text: 'Search Available Trains',
                      icon: Icons.search_rounded,
                      onPressed: () {
                        controller.performSearch();
                        Get.toNamed(AppRoutes.searchResults);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showStationPicker(BuildContext context, bool isFrom) {
    // Station picker dialog
  }
}

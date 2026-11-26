import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/rail_card.dart';
import '../../core/widgets/rail_text_field.dart';
import 'station_controller.dart';

class StationDirectoryView extends GetView<StationController> {
  const StationDirectoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StationController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Station Directory')),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: RailTextField(
                label: 'Search Station',
                hint: 'Type station name or code (e.g. DAK, Kamalapur)',
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.primary,
                ),
                onChanged: controller.searchStations,
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.stations.length,
                  itemBuilder: (context, index) {
                    final station = controller.stations[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: RailCard(
                        onTap: () => Get.toNamed(
                          AppRoutes.stationDetails,
                          arguments: station,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: AppColors.lightGreen,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.location_city_rounded,
                                    color: AppColors.primary,
                                    size: 22,
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${station.stationNameEn} (${station.stationCode})',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '${station.stationNameBn} • ${station.district} Division',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
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
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

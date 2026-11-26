import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/rail_badge.dart';
import '../../core/widgets/rail_card.dart';
import '../../core/widgets/verified_badge.dart';
import '../../data/models/station_model.dart';

class StationDetailsView extends StatelessWidget {
  const StationDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final StationModel station = Get.arguments;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text(station.stationNameEn)),
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
                        '${station.stationNameEn} (${station.stationCode})',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      VerifiedBadge(status: station.verificationStatus),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${station.stationNameBn} • ${station.railwayZone}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const Divider(height: 24, color: AppColors.divider),
                  _detailRow('District', station.district),
                  const SizedBox(height: 8),
                  _detailRow('Division', station.division),
                  const SizedBox(height: 8),
                  _detailRow('Station Type', station.stationType),
                  const SizedBox(height: 8),
                  _detailRow(
                    'Coordinates',
                    '${station.latitude}, ${station.longitude}',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Station Facilities',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: station.facilities
                  .map(
                    (f) => RailBadge(
                      label: f,
                      backgroundColor: AppColors.lightGreen,
                      textColor: AppColors.primary,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

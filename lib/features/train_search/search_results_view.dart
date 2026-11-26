import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/routes/app_routes.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/currency_formatter.dart';
import '../../core/widgets/empty_state_widget.dart';
import 'train_search_controller.dart';

class SearchResultsView extends GetView<TrainSearchController> {
  const SearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.fromStation.value != null &&
                    controller.toStation.value != null
                ? '${controller.fromStation.value!.stationCode} → ${controller.toStation.value!.stationCode}'
                : 'Search Results',
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.searchResults.isEmpty) {
          return EmptyStateWidget(
            title: 'No Trains Found',
            message: 'Try changing your origin or destination stations to find active Bangladesh Railway routes.',
            actionText: 'Modify Search',
            onAction: () => Get.back(),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.searchResults.length,
          itemBuilder: (context, index) {
            final train = controller.searchResults[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Material(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  onTap: () =>
                      Get.toNamed(AppRoutes.trainDetails, arguments: train),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: colorScheme.outline.withOpacity(0.2),
                      ),
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
                                    color: colorScheme.primary.withOpacity(
                                      0.15,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.train_rounded,
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
                                      '#${train.trainNumber} • ${train.category}',
                                      style: AppTextStyles.bodySmall(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Divider(
                            height: 1,
                            color: colorScheme.outline.withOpacity(0.2),
                          ),
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
                                Text(
                                  train.journeyDuration,
                                  style: AppTextStyles.bodySmall(context)
                                      .copyWith(
                                        color: colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(height: 2),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 18,
                                  color: colorScheme.primary,
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
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              train.fares.isNotEmpty
                                  ? 'Starts from ${CurrencyFormatter.format(train.fares.first.totalFare)}'
                                  : 'Fare unavailable',
                              style: AppTextStyles.titleMedium(context)
                                  .copyWith(color: colorScheme.primary),
                            ),
                            ElevatedButton(
                              onPressed: () => Get.toNamed(
                                AppRoutes.seatSelection,
                                arguments: train,
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(110, 38),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Book Seats',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

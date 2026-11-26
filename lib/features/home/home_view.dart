import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_constants.dart';
import '../../core/routes/app_routes.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/station_selector_widget.dart';
import '../../core/widgets/journey_date_picker_widget.dart';
import '../../core/widgets/passenger_counter_widget.dart';
import '../../core/widgets/train_class_selector_widget.dart';
import '../../core/widgets/premium_search_button.dart';
import '../../core/widgets/banner_slider_widget.dart';
import '../../core/widgets/glass_card.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 16),
              const BannerSliderWidget(),
              const SizedBox(height: 16),
              _buildSearchCard(context),
              const SizedBox(height: 24),
              _buildPopularRoutes(context),
              const SizedBox(height: 24),
              _buildTrainCategories(context),
              const SizedBox(height: 24),
              _buildQuickServices(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: colorScheme.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.train_rounded,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        AppConstants.appName,
                        style: AppTextStyles.titleLarge(context),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'BD',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Bangladesh Railway Platform',
                    style: AppTextStyles.bodySmall(context),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () => Get.toNamed(AppRoutes.notifications),
                icon: Icon(
                  Icons.notifications_outlined,
                  color: colorScheme.onSurface,
                ),
              ),
              IconButton(
                onPressed: () => Get.toNamed(AppRoutes.settings),
                icon: Icon(
                  Icons.settings_outlined,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: GlassCard(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Train Search', style: AppTextStyles.titleLarge(context)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Verified',
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Column(
                  children: [
                    Obx(
                      () => StationSelectorWidget(
                        label: 'From Station',
                        station:
                            controller.fromStation.value?.stationNameEn ?? '',
                        icon: Icons.trip_origin_rounded,
                        onTap: () => _showStationPicker(context, true),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => StationSelectorWidget(
                        label: 'To Station',
                        station: controller.toStation.value?.stationNameEn ?? '',
                        icon: Icons.location_on_rounded,
                        onTap: () => _showStationPicker(context, false),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 16,
                  child: FloatingActionButton.small(
                    heroTag: 'swap_stations',
                    onPressed: controller.swapStations,
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    child: const Icon(Icons.swap_vert_rounded),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Obx(
              () => JourneyDatePickerWidget(
                selectedDate: controller.journeyDate.value,
                onDateSelected: (date) => controller.journeyDate.value = date,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => PassengerCounterWidget(
                      count: controller.passengerCount.value,
                      onChanged: (count) =>
                          controller.passengerCount.value = count,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Obx(
              () => TrainClassSelectorWidget(
                selectedClass: controller.selectedClass.value,
                onChanged: (cls) => controller.selectedClass.value = cls,
              ),
            ),
            const SizedBox(height: 20),
            PremiumSearchButton(
              text: 'Search Available Trains',
              onPressed: controller.searchTrains,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularRoutes(BuildContext context) {
    final routes = [
      {
        'name': 'Dhaka ➔ Chattogram',
        'from': 'DAK',
        'to': 'CTG',
        'trains': 'Subarna, Sonar Bangla',
      },
      {
        'name': 'Dhaka ➔ Cox\'s Bazar',
        'from': 'DAK',
        'to': 'CXB',
        'trains': 'Cox\'s Bazar Express',
      },
      {
        'name': 'Dhaka ➔ Sylhet',
        'from': 'DAK',
        'to': 'SYL',
        'trains': 'Parabat, Jayantika',
      },
      {
        'name': 'Dhaka ➔ Rajshahi',
        'from': 'DAK',
        'to': 'RAJ',
        'trains': 'Padma, Dhumketu',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Popular Routes', style: AppTextStyles.titleLarge(context)),
          const SizedBox(height: 12),
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: routes.length,
              itemBuilder: (context, index) {
                final route = routes[index];
                return Container(
                  width: 220,
                  margin: const EdgeInsets.only(right: 12),
                  child: GlassCard(
                    padding: const EdgeInsets.all(14),
                    onTap: () => controller.selectPopularRoute(
                      route['from']!,
                      route['to']!,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          route['name']!,
                          style: AppTextStyles.titleMedium(context),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          route['trains']!,
                          style: AppTextStyles.bodySmall(context),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              'Book Now',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: 14,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrainCategories(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final categories = [
      {'title': 'Intercity', 'icon': Icons.train, 'desc': 'Fast & Scheduled'},
      {
        'title': 'Mail / Express',
        'icon': Icons.directions_railway,
        'desc': 'Affordable Travel',
      },
      {'title': 'Commuter', 'icon': Icons.subway, 'desc': 'Daily Suburbs'},
      {'title': 'Shuttle', 'icon': Icons.tram, 'desc': 'Local Routes'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Train Categories', style: AppTextStyles.titleLarge(context)),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 2.2,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final cat = categories[index];
              return GlassCard(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        cat['icon'] as IconData,
                        color: colorScheme.primary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cat['title'] as String,
                            style: AppTextStyles.titleMedium(context),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            cat['desc'] as String,
                            style: AppTextStyles.bodySmall(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuickServices(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Quick Services', style: AppTextStyles.titleLarge(context)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildServiceButton(
                context,
                'Stations',
                Icons.location_city_rounded,
                () => Get.toNamed(AppRoutes.stationDirectory),
              ),
              _buildServiceButton(
                context,
                'My Tickets',
                Icons.confirmation_number_rounded,
                () => Get.toNamed(AppRoutes.myTickets),
              ),
              _buildServiceButton(
                context,
                'Help & FAQ',
                Icons.help_outline_rounded,
                () => Get.toNamed(AppRoutes.helpSupport),
              ),
              _buildServiceButton(
                context,
                'About',
                Icons.info_outline_rounded,
                () => Get.toNamed(AppRoutes.about),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceButton(
    BuildContext context,
    String label,
    IconData icon,
    VoidCallback onTap,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 78,
      child: GlassCard(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
        onTap: onTap,
        child: Column(
          children: [
            Icon(icon, color: colorScheme.primary, size: 24),
            const SizedBox(height: 8),
            Text(
              label,
              style: AppTextStyles.bodySmall(context)
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 11),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  void _showStationPicker(BuildContext context, bool isFrom) {
    final colorScheme = Theme.of(context).colorScheme;
    showModalBottomSheet(
      context: context,
      backgroundColor: colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isFrom ? 'Select Origin Station' : 'Select Destination Station',
                style: AppTextStyles.titleLarge(context),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.allStations.length,
                  itemBuilder: (context, index) {
                    final station = controller.allStations[index];
                    return ListTile(
                      leading: Icon(Icons.train, color: colorScheme.primary),
                      title: Text(
                        station.stationNameEn,
                        style: AppTextStyles.titleMedium(context),
                      ),
                      subtitle: Text(
                        '${station.district} • Code: ${station.stationCode}',
                        style: AppTextStyles.bodySmall(context),
                      ),
                      onTap: () {
                        if (isFrom) {
                          controller.fromStation.value = station;
                        } else {
                          controller.toStation.value = station;
                        }
                        Get.back();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

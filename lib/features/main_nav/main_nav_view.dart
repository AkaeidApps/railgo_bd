import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/animated_bottom_navigation.dart';
import '../home/home_view.dart';
import '../tickets/my_tickets_view.dart';
import '../stations/station_directory_view.dart';
import '../profile/profile_view.dart';
import 'main_nav_controller.dart';

class MainNavView extends GetView<MainNavController> {
  const MainNavView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainNavController());
    final List<Widget> pages = [
      const HomeView(),
      const MyTicketsView(),
      const StationDirectoryView(),
      const ProfileView(),
    ];

    return Scaffold(
      body: Obx(
        () =>
            IndexedStack(index: controller.currentIndex.value, children: pages),
      ),
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigation(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
        ),
      ),
    );
  }
}

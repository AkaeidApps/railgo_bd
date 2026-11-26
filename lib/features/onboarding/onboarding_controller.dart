import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/routes/app_routes.dart';
import '../../core/services/storage_service.dart';

class OnboardingController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();
  final pageController = PageController();
  final currentPage = 0.obs;

  final List<Map<String, String>> pages = [
    {
      'title': 'Explore Bangladesh',
      'bengaliTitle': 'বাংলাদেশের রেলপথে ঘুরে দেখুন',
      'subtitle': 'Experience authentic intercity train travel through the lush green countryside of Bangladesh.',
      'image': 'https://images.unsplash.com/photo-1596176530529-78163a4f7af2?auto=format&fit=crop&w=1200&q=80',
    },
    {
      'title': 'Discover Every Journey',
      'bengaliTitle': 'আপনার পছন্দের ট্রেন ও রুট খুঁজুন',
      'subtitle': 'Find verified schedules, exact fares, and optimal routes across all Bangladesh Railway networks.',
      'image': 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?auto=format&fit=crop&w=1200&q=80',
    },
    {
      'title': 'Your Journey Starts Here',
      'bengaliTitle': 'সহজেই খুঁজুন এবং ভ্রমণের পরিকল্পনা করুন',
      'subtitle': 'Plan your seamless railway journey with interactive seat selection and digital e-tickets.',
      'image': 'https://images.unsplash.com/photo-1474487548417-781cb71495f3?auto=format&fit=crop&w=1200&q=80',
    },
  ];

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      finishOnboarding();
    }
  }

  void skipOnboarding() {
    finishOnboarding();
  }

  void finishOnboarding() async {
    await _storageService.setFirstTimeDone();
    Get.offAllNamed(AppRoutes.mainNav);
  }
}

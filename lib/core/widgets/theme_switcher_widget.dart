import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme_controller.dart';
import '../theme/app_text_styles.dart';
import 'glass_card.dart';

class ThemeSwitcherWidget extends StatelessWidget {
  const ThemeSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() {
      return GlassCard(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Appearance & Theme', style: AppTextStyles.titleMedium(context)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildThemeOption(
                  context,
                  'Light',
                  Icons.light_mode_rounded,
                  themeController.themeMode.value == ThemeMode.light,
                  () => themeController.setThemeMode(ThemeMode.light),
                ),
                _buildThemeOption(
                  context,
                  'Dark',
                  Icons.dark_mode_rounded,
                  themeController.themeMode.value == ThemeMode.dark,
                  () => themeController.setThemeMode(ThemeMode.dark),
                ),
                _buildThemeOption(
                  context,
                  'System',
                  Icons.phone_android_rounded,
                  themeController.themeMode.value == ThemeMode.system,
                  () => themeController.setThemeMode(ThemeMode.system),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _buildThemeOption(
    BuildContext context,
    String label,
    IconData icon,
    bool isSelected,
    VoidCallback onTap,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary.withOpacity(0.15)
              : colorScheme.surface.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.outline.withOpacity(0.2),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.onSurface.withOpacity(0.7),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? colorScheme.primary : colorScheme.onSurface,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

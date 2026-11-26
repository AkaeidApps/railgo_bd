import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/routes/app_routes.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/theme_switcher_widget.dart';
import 'settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings & Preferences')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            children: [
              const ThemeSwitcherWidget(),
              const SizedBox(height: 20),
              GlassCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Language / ভাষা', style: AppTextStyles.titleMedium(context)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() => ChoiceChip(
                                label: const Text('বাংলা (Bengali)'),
                                selected: controller.isBengali.value,
                                onSelected: (val) => controller.toggleLanguage(true),
                                selectedColor: colorScheme.primary,
                                labelStyle: TextStyle(
                                  color: controller.isBengali.value ? colorScheme.onPrimary : colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Obx(() => ChoiceChip(
                                label: const Text('English'),
                                selected: !controller.isBengali.value,
                                onSelected: (val) => controller.toggleLanguage(false),
                                selectedColor: colorScheme.primary,
                                labelStyle: TextStyle(
                                  color: !controller.isBengali.value ? colorScheme.onPrimary : colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GlassCard(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.help_outline_rounded, color: colorScheme.primary, size: 20),
                      ),
                      title: Text('FAQ & Help', style: AppTextStyles.titleMedium(context)),
                      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 14, color: colorScheme.onSurface.withOpacity(0.6)),
                      onTap: () => Get.toNamed(AppRoutes.faq),
                    ),
                    Divider(height: 1, color: colorScheme.outline.withOpacity(0.15)),
                    ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.info_outline_rounded, color: colorScheme.primary, size: 20),
                      ),
                      title: Text('About RailGo BD', style: AppTextStyles.titleMedium(context)),
                      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 14, color: colorScheme.onSurface.withOpacity(0.6)),
                      onTap: () => Get.toNamed(AppRoutes.about),
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
}

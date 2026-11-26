import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

class StationSelectorWidget extends StatelessWidget {
  final String label;
  final String station;
  final IconData icon;
  final VoidCallback onTap;

  const StationSelectorWidget({
    super.key,
    required this.label,
    required this.station,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorScheme.outline.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Icon(icon, color: colorScheme.primary, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: AppTextStyles.bodySmall(context)),
                  const SizedBox(height: 2),
                  Text(
                    station.isEmpty ? 'Select Station' : station,
                    style: AppTextStyles.titleMedium(context).copyWith(
                      color: station.isEmpty
                          ? colorScheme.onSurface.withOpacity(0.5)
                          : colorScheme.onSurface,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: colorScheme.onSurface.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }
}

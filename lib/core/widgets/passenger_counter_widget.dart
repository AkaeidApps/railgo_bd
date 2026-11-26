import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

class PassengerCounterWidget extends StatelessWidget {
  final int count;
  final ValueChanged<int> onChanged;

  const PassengerCounterWidget({
    super.key,
    required this.count,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outline.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.person_outline_rounded,
                color: colorScheme.primary,
                size: 22,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Passengers', style: AppTextStyles.bodySmall(context)),
                  const SizedBox(height: 2),
                  Text(
                    '$count Person(s)',
                    style: AppTextStyles.titleMedium(context),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                color: colorScheme.primary,
                onPressed: count > 1 ? () => onChanged(count - 1) : null,
              ),
              Text('$count', style: AppTextStyles.titleLarge(context)),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                color: colorScheme.primary,
                onPressed: count < 5 ? () => onChanged(count + 1) : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

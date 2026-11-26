import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../theme/app_text_styles.dart';

class FareCardWidget extends StatelessWidget {
  final String className;
  final double price;
  final bool available;
  final VoidCallback onSelect;

  const FareCardWidget({
    super.key,
    required this.className,
    required this.price,
    required this.available,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colorScheme.outline.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(className, style: AppTextStyles.titleMedium(context)),
              const SizedBox(height: 4),
              Text(
                available ? 'Seats Available' : 'Sold Out',
                style: TextStyle(
                  fontSize: 12,
                  color: available ? colorScheme.primary : colorScheme.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '${AppConstants.currencySymbol} ${price.toStringAsFixed(0)}',
                style: AppTextStyles.titleLarge(context)
                    .copyWith(color: colorScheme.primary),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: available ? onSelect : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(80, 36),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Book', style: TextStyle(fontSize: 13)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

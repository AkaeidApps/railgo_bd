import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../theme/app_text_styles.dart';

class TrainClassSelectorWidget extends StatelessWidget {
  final String selectedClass;
  final ValueChanged<String> onChanged;

  const TrainClassSelectorWidget({
    super.key,
    required this.selectedClass,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outline.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.airline_seat_recline_normal_rounded,
                color: colorScheme.primary,
                size: 22,
              ),
              const SizedBox(width: 12),
              Text('Select Class', style: AppTextStyles.bodySmall(context)),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: AppConstants.trainClasses.length,
              itemBuilder: (context, index) {
                final cls = AppConstants.trainClasses[index];
                final isSelected = cls == selectedClass;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(cls),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) onChanged(cls);
                    },
                    selectedColor: colorScheme.primary,
                    labelStyle: TextStyle(
                      color: isSelected
                          ? colorScheme.onPrimary
                          : colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    backgroundColor: colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.outline.withOpacity(0.3),
                      ),
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
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme/app_text_styles.dart';

class JourneyDatePickerWidget extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const JourneyDatePickerWidget({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final formattedDate = DateFormat('EEE, dd MMM yyyy').format(selectedDate);

    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 10)),
        );
        if (picked != null) {
          onDateSelected(picked);
        }
      },
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
            Icon(
              Icons.calendar_today_rounded,
              color: colorScheme.primary,
              size: 22,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Journey Date', style: AppTextStyles.bodySmall(context)),
                  const SizedBox(height: 2),
                  Text(
                    formattedDate,
                    style: AppTextStyles.titleMedium(context),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.edit_calendar_rounded,
              color: colorScheme.onSurface.withOpacity(0.6),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

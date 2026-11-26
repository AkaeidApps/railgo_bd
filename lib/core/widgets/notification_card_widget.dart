import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

class NotificationCardWidget extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final bool isUnread;
  final VoidCallback onTap;

  const NotificationCardWidget({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    required this.isUnread,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        color: isUnread
            ? colorScheme.primary.withOpacity(0.05)
            : colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outline.withOpacity(0.2)),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.notifications_outlined,
            color: colorScheme.primary,
            size: 20,
          ),
        ),
        title: Text(title, style: AppTextStyles.titleMedium(context)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(message, style: AppTextStyles.bodySmall(context)),
            const SizedBox(height: 4),
            Text(
              time,
              style: AppTextStyles.bodySmall(context).copyWith(fontSize: 10),
            ),
          ],
        ),
        trailing: isUnread
            ? Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              )
            : null,
      ),
    );
  }
}

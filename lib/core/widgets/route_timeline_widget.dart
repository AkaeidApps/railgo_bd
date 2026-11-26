import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

class RouteTimelineWidget extends StatelessWidget {
  final List<String> stops;
  final int currentIndex;

  const RouteTimelineWidget({
    super.key,
    required this.stops,
    this.currentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stops.length,
      itemBuilder: (context, index) {
        final isPassed = index < currentIndex;
        final isCurrent = index == currentIndex;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isCurrent
                        ? colorScheme.primary
                        : isPassed
                        ? colorScheme.secondary
                        : colorScheme.outline.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: isCurrent || isPassed
                        ? const Icon(Icons.check, size: 14, color: Colors.white)
                        : Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: colorScheme.surface,
                              shape: BoxShape.circle,
                            ),
                          ),
                  ),
                ),
                if (index < stops.length - 1)
                  Container(
                    width: 2,
                    height: 40,
                    color: isPassed
                        ? colorScheme.secondary
                        : colorScheme.outline.withOpacity(0.3),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stops[index],
                      style: AppTextStyles.titleMedium(context).copyWith(
                        fontWeight: isCurrent
                            ? FontWeight.bold
                            : FontWeight.w500,
                        color: isCurrent
                            ? colorScheme.primary
                            : colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      isCurrent
                          ? 'Current Station'
                          : (isPassed ? 'Passed' : 'Upcoming'),
                      style: AppTextStyles.bodySmall(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

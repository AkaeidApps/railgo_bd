import 'package:flutter/material.dart';

class LoadingShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final double radius;

  const LoadingShimmerWidget({
    super.key,
    this.height = 100,
    this.width = double.infinity,
    this.radius = 12,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: colorScheme.outline.withOpacity(0.15),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

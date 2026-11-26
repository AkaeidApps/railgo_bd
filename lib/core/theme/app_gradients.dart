import 'package:flutter/material.dart';

class AppGradients {
  static LinearGradient primaryGradient(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return LinearGradient(
      colors: [colorScheme.primary, colorScheme.secondary],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static LinearGradient cardGradient(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return LinearGradient(
      colors: [colorScheme.surface, colorScheme.surface.withOpacity(0.95)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static const LinearGradient brandBanner = LinearGradient(
    colors: [Color(0xFF087A48), Color(0xFF075C38)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF20A66A), Color(0xFF087A48)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

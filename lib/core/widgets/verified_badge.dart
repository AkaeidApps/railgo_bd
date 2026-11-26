import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

class VerifiedBadge extends StatelessWidget {
  final String status;
  final String? source;

  const VerifiedBadge({super.key, required this.status, this.source});

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color fg;
    IconData icon;
    String label;

    switch (status) {
      case AppConstants.statusVerified:
        bg = AppColors.lightGreen;
        fg = AppColors.primary;
        icon = Icons.verified_user_rounded;
        label = 'Verified Official Data';
        break;
      case AppConstants.statusPending:
        bg = const Color(0xFFFFF7E6);
        fg = AppColors.warning;
        icon = Icons.hourglass_empty_rounded;
        label = 'Pending Verification';
        break;
      case AppConstants.statusOutdated:
        bg = const Color(0xFFFEE2E2);
        fg = AppColors.error;
        icon = Icons.update_disabled_rounded;
        label = 'Outdated Record';
        break;
      default:
        bg = Colors.grey.shade200;
        fg = Colors.grey.shade700;
        icon = Icons.help_outline_rounded;
        label = 'Verification Unavailable';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: fg.withValues(alpha: 0.3), width: 0.8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: fg),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: fg,
            ),
          ),
        ],
      ),
    );
  }
}

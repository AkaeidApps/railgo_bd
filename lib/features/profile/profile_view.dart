import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/routes/app_routes.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_gradients.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => Get.toNamed(AppRoutes.settings),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: AppGradients.primaryGradient(context),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 36,
                        backgroundColor: colorScheme.primary.withOpacity(0.15),
                        child: Icon(Icons.person_rounded, size: 40, color: colorScheme.primary),
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'MD. TANVIR HOSSAIN',
                                  style: AppTextStyles.titleLarge(context).copyWith(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(Icons.verified, color: Colors.white, size: 18),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '+880 1700-000000',
                            style: AppTextStyles.bodyMedium(context).copyWith(color: Colors.white70),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'tanvir.railgo@bd.gov.bd',
                            style: AppTextStyles.bodySmall(context).copyWith(color: Colors.white60),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1, end: 0),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(context, 'Journeys', '14', Icons.train_rounded),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildStatCard(context, 'Tickets', '3', Icons.confirmation_number_rounded),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildStatCard(context, 'Verified', 'Yes', Icons.verified_user_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: colorScheme.outline.withOpacity(0.2)),
                ),
                child: Column(
                  children: [
                    _buildMenuItem(context, Icons.confirmation_number_outlined, 'My Active Tickets', 'View QR e-tickets & PNR', () => Get.toNamed(AppRoutes.myTickets)),
                    Divider(height: 1, color: colorScheme.outline.withOpacity(0.2)),
                    _buildMenuItem(context, Icons.people_outline_rounded, 'Saved Passengers', 'Manage frequent travelers', () {
                      Get.snackbar('Saved Passengers', 'Passenger management is ready for quick booking.');
                    }),
                    Divider(height: 1, color: colorScheme.outline.withOpacity(0.2)),
                    _buildMenuItem(context, Icons.payment_outlined, 'Payment Methods', 'bKash, Nagad, Cards', () {
                      Get.snackbar('Payment Methods', 'Secure Bangladesh Railway gateway linked.');
                    }),
                    Divider(height: 1, color: colorScheme.outline.withOpacity(0.2)),
                    _buildMenuItem(context, Icons.settings_outlined, 'Settings & Appearance', 'Theme, dark mode, language', () => Get.toNamed(AppRoutes.settings)),
                    Divider(height: 1, color: colorScheme.outline.withOpacity(0.2)),
                    _buildMenuItem(context, Icons.help_outline_rounded, 'Help & Support', 'FAQ and customer assistance', () => Get.toNamed(AppRoutes.helpSupport)),
                    Divider(height: 1, color: colorScheme.outline.withOpacity(0.2)),
                    _buildMenuItem(context, Icons.info_outline_rounded, 'About RailGo BD', 'Platform version & official links', () => Get.toNamed(AppRoutes.about)),
                    Divider(height: 1, color: colorScheme.outline.withOpacity(0.2)),
                    _buildMenuItem(context, Icons.logout_rounded, 'Log Out', 'Sign out of RailGo BD', () => _showLogoutDialog(context), isError: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: colorScheme.primary, size: 22),
          const SizedBox(height: 12),
          Text(
            value,
            style: AppTextStyles.titleMedium(context).copyWith(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: AppTextStyles.bodySmall(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, String subtitle, VoidCallback onTap, {bool isError = false}) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isError ? colorScheme.error.withOpacity(0.15) : colorScheme.primary.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: isError ? colorScheme.error : colorScheme.primary, size: 20),
      ),
      title: Text(title, style: AppTextStyles.titleMedium(context).copyWith(color: isError ? colorScheme.error : colorScheme.onSurface)),
      subtitle: Text(subtitle, style: AppTextStyles.bodySmall(context)),
      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 14, color: colorScheme.onSurface.withOpacity(0.4)),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: colorScheme.surface,
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out from RailGo BD?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              Get.offAllNamed(AppRoutes.login);
            },
            style: ElevatedButton.styleFrom(backgroundColor: colorScheme.error, foregroundColor: Colors.white),
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }
}

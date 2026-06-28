import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';

class RecentSessions extends StatelessWidget {
  const RecentSessions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Sessions',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppConstants.space16),
        Container(
          padding: const EdgeInsets.all(AppConstants.space16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: AppConstants.borderRadiusLg,
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: const [
              _SessionItem(title: 'Flutter Widgets'),
              Divider(color: AppColors.border, height: AppConstants.space24),
              _SessionItem(title: 'Data Structures'),
              Divider(color: AppColors.border, height: AppConstants.space24),
              _SessionItem(title: 'Networking Basics'),
            ],
          ),
        ),
      ],
    );
  }
}

class _SessionItem extends StatelessWidget {
  final String title;

  const _SessionItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(AppConstants.space8),
          decoration: BoxDecoration(
            color: AppColors.primaryContainer,
            borderRadius: AppConstants.borderRadiusSm,
          ),
          child: const Icon(
            Icons.check_circle_outline_rounded,
            color: AppColors.primary,
            size: 20,
          ),
        ),
        const SizedBox(width: AppConstants.space16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const Text(
                'Completed',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.chevron_right_rounded,
          color: AppColors.textTertiary,
          size: 20,
        ),
      ],
    );
  }
}

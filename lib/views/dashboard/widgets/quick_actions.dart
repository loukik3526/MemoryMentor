import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppConstants.space16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: AppConstants.space16,
          crossAxisSpacing: AppConstants.space16,
          childAspectRatio: 1.5,
          children: [
            _ActionCard(
              title: 'Upload PDF',
              icon: Icons.upload_file_rounded,
              onTap: () {},
            ),
            _ActionCard(
              title: 'Ask AI',
              icon: Icons.auto_awesome_rounded,
              onTap: () {},
            ),
            _ActionCard(
              title: 'Memory',
              icon: Icons.psychology_rounded,
              onTap: () {},
            ),
            _ActionCard(
              title: 'Quiz',
              icon: Icons.quiz_rounded,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _ActionCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: AppConstants.borderRadiusMd,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppConstants.borderRadiusMd,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: AppConstants.borderRadiusMd,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColors.primary,
                size: 28,
              ),
              const SizedBox(height: AppConstants.space8),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

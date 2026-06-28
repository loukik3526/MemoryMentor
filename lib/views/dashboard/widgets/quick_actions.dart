import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 2.h),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: AppConstants.space16,
          crossAxisSpacing: AppConstants.space16,
          childAspectRatio: 1.3,
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
                size: 24.sp,
              ),
              SizedBox(height: 1.h),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 10.sp,
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

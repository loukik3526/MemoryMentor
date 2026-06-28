import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';

class MemoryStatsCard extends StatelessWidget {
  const MemoryStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.space20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppConstants.borderRadiusLg,
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _StatItem(
            icon: Icons.psychology_rounded,
            value: '250',
            label: 'Memories',
            color: AppColors.primary,
          ),
          _StatItem(
            icon: Icons.auto_graph_rounded,
            value: '91%',
            label: 'Recall',
            color: AppColors.secondary,
          ),
          _StatItem(
            icon: Icons.timer_rounded,
            value: '18',
            label: 'Sessions',
            color: AppColors.tertiary,
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: color,
          size: 24,
        ),
        const SizedBox(height: AppConstants.space8),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppConstants.space4),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

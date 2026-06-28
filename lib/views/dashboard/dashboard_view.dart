import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import 'dashboard_controller.dart';
import 'widgets/continue_learning_card.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/memory_stats_card.dart';
import 'widgets/progress_card.dart';
import 'widgets/quick_actions.dart';
import 'widgets/recent_sessions.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.space24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const DashboardHeader(),
              SizedBox(height: 3.h),
              const ContinueLearningCard(),
              SizedBox(height: 3.h),
              const QuickActions(),
              SizedBox(height: 3.h),
              const ProgressCard(),
              SizedBox(height: 3.h),
              const RecentSessions(),
              SizedBox(height: 3.h),
              const MemoryStatsCard(),
            ],
          ),
        ),
      ),
    );
  }
}

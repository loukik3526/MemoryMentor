import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import 'splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override

  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.space24,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: AppConstants.borderRadiusXl,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.32),
                            blurRadius: 48,
                            spreadRadius: 4,
                          ),
                          BoxShadow(
                            color: AppColors.secondary.withValues(alpha: 0.18),
                            blurRadius: 72,
                            spreadRadius: 8,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: AppConstants.borderRadiusXl,
                        child: Image.asset(
                          'assets/icons/logo.png',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(
                          duration: AppConstants.animationSlow,
                          curve: Curves.easeOutCubic,
                        )
                        .scale(
                          begin: const Offset(0.86, 0.86),
                          end: const Offset(1, 1),
                          duration: AppConstants.animationSlow,
                          curve: Curves.easeOutBack,
                        ),
                    const SizedBox(height: AppConstants.space24),
                    const Text(
                      'Memory Mentor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        height: 1.12,
                      ),
                    )
                        .animate(delay: AppConstants.animationFast)
                        .fadeIn(
                          duration: AppConstants.animationSlow,
                          curve: Curves.easeOutCubic,
                        )
                        .slideY(
                          begin: 0.24,
                          end: 0,
                          duration: AppConstants.animationSlow,
                          curve: Curves.easeOutCubic,
                        ),
                    const SizedBox(height: AppConstants.space10),
                    const Text(
                      'Your AI remembers.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.45,
                      ),
                    )
                        .animate(delay: AppConstants.animationMedium)
                        .fadeIn(
                          duration: AppConstants.animationSlow,
                          curve: Curves.easeOutCubic,
                        )
                        .slideY(
                          begin: 0.28,
                          end: 0,
                          duration: AppConstants.animationSlow,
                          curve: Curves.easeOutCubic,
                        ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 8.h,
              child: const SizedBox.square(
                dimension: AppConstants.iconLg,
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                  strokeWidth: 2.4,
                ),
              )
                  .animate(delay: AppConstants.animationSlow)
                  .fadeIn(
                    duration: AppConstants.animationSlow,
                    curve: Curves.easeOutCubic,
                  )
                  .slideY(
                    begin: 0.24,
                    end: 0,
                    duration: AppConstants.animationSlow,
                    curve: Curves.easeOutCubic,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

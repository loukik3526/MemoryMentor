import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../widgets/buttons/primary_button.dart';
import 'onboarding_page.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _handleNext() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: AppConstants.animationMedium,
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: [
                  OnboardingPage(
                    image: 'assets/icons/logo.png',
                    title: 'Your AI finally remembers.',
                    description:
                    'Continue conversations across days without repeating yourself. Every detail, always recalled.',
                  ),
                  OnboardingPage(
                    image: 'assets/icons/logo.png',
                    title: 'Learn smarter.',
                    description:
                    'Memory Mentor tracks your progress, weaknesses, and goals automatically.',
                  ),
                  OnboardingPage(
                    image: 'assets/icons/logo.png',
                    title: 'Grow with your AI.',
                    description:
                    'Your mentor becomes more helpful every day, adapting to how you actually learn.',
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.space24,
                vertical: 4.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: AppConstants.animationFast,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 1.h,
                        width: _currentPage == index ? 8.w : 2.w,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppColors.primary
                              : AppColors.textDisabled,
                          borderRadius: BorderRadius.circular(AppConstants.radiusFull),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  PrimaryButton(
                    text: _currentPage == 2 ? 'Get Started' : 'Next',
                    onPressed: _handleNext,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

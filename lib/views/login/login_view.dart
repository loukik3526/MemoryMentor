import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../routes/app_routes.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../widgets/buttons/primary_button.dart';
import 'login_controller.dart';
import 'widgets/divider_text.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';
import 'widgets/social_login_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.space24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LoginHeader(),
              SizedBox(height: 4.h),
              Obx(
                () => LoginForm(
                  emailController: controller.emailController,
                  passwordController: controller.passwordController,
                  isPasswordHidden: controller.isPasswordHidden.value,
                  onTogglePassword: controller.togglePasswordVisibility,
                ),
              ),
              SizedBox(height: 3.5.h),
              PrimaryButton(
                text: "Sign In",
                onPressed: () {
                  Get.offNamed(AppRoutes.dashboard);
                },
              ),
              SizedBox(height: 3.5.h),
              const DividerText(
                text: "or continue with",
              ),
              SizedBox(height: 3.h),
              SocialLoginButton(
                text: "Continue with Google",
                asset: AppAssets.google,
                onPressed: () {},
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: AppColors.primary,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:get/get.dart';
import '../bindings/splash_binding.dart';
import '../views/login/login_view.dart';
import '../views/onboarding/onboarding_view.dart';
import '../views/splash/splash_view.dart';
import 'app_routes.dart';

abstract class AppPages {
  AppPages._();

  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
    ),
  ];
}

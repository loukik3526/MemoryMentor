import 'package:flutter/material.dart';

/// App-wide constants that are independent of visual color.
///
/// These values are intentionally immutable so controllers, services, widgets,
/// and route configuration can share stable defaults.
abstract final class AppConstants {
  AppConstants._();

  // Application metadata.
  static const String appName = 'Memory Mentor';
  static const String appTagline = 'An AI tutor that remembers how you learn.';
  static const String appVersion = '1.0.0';

  // Environment keys.
  static const String apiBaseUrlKey = 'API_BASE_URL';
  static const String geminiApiKey = 'GEMINI_API_KEY';

  // API defaults.
  static const String defaultApiBaseUrl = 'http://localhost:8000';
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 45);
  static const Duration sendTimeout = Duration(seconds: 30);

  // Local persistence keys.
  static const String storageContainer = 'memory_mentor_storage';
  static const String authTokenKey = 'auth_token';
  static const String userIdKey = 'user_id';
  static const String onboardingCompletedKey = 'onboarding_completed';
  static const String themeModeKey = 'theme_mode';

  // Layout.
  static const double bottomBarHeight = 72;
  static const double appBarHeight = 64;

  // Spacing scale.
  static const double space2 = 2;
  static const double space4 = 4;
  static const double space6 = 6;
  static const double space8 = 8;
  static const double space10 = 10;
  static const double space12 = 12;
  static const double space14 = 14;
  static const double space16 = 16;
  static const double space20 = 20;
  static const double space24 = 24;
  static const double space32 = 32;
  static const double space40 = 40;
  static const double space48 = 48;
  static const double space64 = 64;

  // Radius scale.
  static const double radiusXs = 6;
  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;
  static const double radiusXl = 24;
  static const double radiusFull = 999;

  static const BorderRadius borderRadiusSm = BorderRadius.all(
    Radius.circular(radiusSm),
  );
  static const BorderRadius borderRadiusXs = BorderRadius.all(
    Radius.circular(radiusXs),
  );
  static const BorderRadius borderRadiusMd = BorderRadius.all(
    Radius.circular(radiusMd),
  );
  static const BorderRadius borderRadiusLg = BorderRadius.all(
    Radius.circular(radiusLg),
  );
  static const BorderRadius borderRadiusXl = BorderRadius.all(
    Radius.circular(radiusXl),
  );

  // Icon sizing.
  static const double iconXs = 14;
  static const double iconSm = 18;
  static const double iconMd = 22;
  static const double iconLg = 28;
  static const double iconXl = 36;

  // Animation.
  static const Duration animationFast = Duration(milliseconds: 140);
  static const Duration animationMedium = Duration(milliseconds: 220);
  static const Duration animationSlow = Duration(milliseconds: 360);
  static const Duration shimmerDuration = Duration(milliseconds: 1200);

  // Chat and memory behavior.
  static const int maxMessagePreviewLines = 3;

  // Validation.
  static const int minPasswordLength = 8;
  static const int maxDisplayNameLength = 40;

}

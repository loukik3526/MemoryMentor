import 'package:flutter/material.dart';

/// Centralized color tokens for Memory Mentor.
///
/// Keep every color value in this file so screens, widgets, and themes can
/// depend on semantic names instead of hardcoded color literals.
abstract final class AppColors {
  AppColors._();

  // Core neutrals.
  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Premium dark surfaces.
  static const Color background = Color(0xFF0F172A);
  static const Color surface = Color(0xFF1E293B);
  static const Color surfaceElevated = Color(0xFF171A22);
  static const Color surfaceHigh = Color(0xFF202430);
  static const Color surfaceOverlay = Color(0xCC101218);
  static const Color inverseSurface = Color(0xFFE8EAF0);

  // Borders and dividers.
  static const Color border = Color(0xFF334155);
  static const Color borderStrong = Color(0xFF3A4050);
  static const Color divider = border;
  static const Color card = Color(0xFF2A3446);
  static const Color shadow = Color(0x33000000);
  static const Color glass = Color(0x1AFFFFFF);

  // Brand palette.
  static const Color primary = Color(0xFF6366F1);
  static const Color primaryHover = Color(0xFF96A2FF);
  static const Color primaryPressed = Color(0xFF6373E8);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF252B63);
  static const Color onPrimaryContainer = Color(0xFFE8EAFF);

  // AI and memory accents.
  static const Color secondary = Color(0xFF8B5CF6);
  static const Color onSecondary = Color(0xFF061C18);
  static const Color secondaryContainer = Color(0xFF103F38);
  static const Color onSecondaryContainer = Color(0xFFBFF9EC);
  static const Color tertiary = Color(0xFFFFC857);
  static const Color onTertiary = Color(0xFF211600);
  static const Color tertiaryContainer = Color(0xFF4C3710);
  static const Color onTertiaryContainer = Color(0xFFFFE7AA);

  // Text hierarchy.
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textTertiary = Color(0xFF858C9B);
  static const Color textDisabled = Color(0xFF5D6472);
  static const Color textInverse = Color(0xFF11131A);

  // Feedback.
  static const Color success = Color(0xFF10B981);
  static const Color onSuccess = Color(0xFF041610);
  static const Color successContainer = Color(0xFF123D2A);
  static const Color warning = Color(0xFFF59E0B);
  static const Color onWarning = Color(0xFF211300);
  static const Color warningContainer = Color(0xFF4A310C);
  static const Color error = Color(0xFFEF4444);
  static const Color onError = Color(0xFF2A050A);
  static const Color errorContainer = Color(0xFF5B1D27);
  static const Color info = Color(0xFF61B8FF);
  static const Color onInfo = Color(0xFF001827);
  static const Color infoContainer = Color(0xFF123A56);

  // Interactive states.
  static const Color focus = Color(0xFFB7C0FF);
  static const Color hover = Color(0x1FFFFFFF);
  static const Color pressed = Color(0x29FFFFFF);
  static const Color selected = Color(0x337C8CFF);
  static const Color disabled = Color(0xFF343945);
  static const Color disabledForeground = Color(0xFF6E7482);
  static const Color scrim = Color(0xB3000000);

  // Chat-specific tokens.
  static const Color userMessage = Color(0xFF22284A);
  static const Color assistantMessage = Color(0xFF151821);
  static const Color memoryHighlight = Color(0x335CE1C5);
  static const Color codeBlock = Color(0xFF0B0D12);

  // Gradients.
  static const List<Color> primaryGradient = <Color>[
    primary,
    secondary,
  ];

  static const List<Color> surfaceGradient = <Color>[
    surfaceElevated,
    surface,
  ];
}

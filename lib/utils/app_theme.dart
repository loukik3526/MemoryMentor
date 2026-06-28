import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_constants.dart';

/// Production Material 3 theme for Memory Mentor.
///
/// Memory Mentor is a dark-first AI learning product. This theme centralizes
/// the app's visual language so screens can stay focused on layout and state.
///
/// Rules for contributors:
/// - Use [AppTheme.darkTheme] from GetMaterialApp.
/// - Read colors from [AppColors] only.
/// - Prefer Theme.of(context) text styles and component themes in widgets.
abstract final class AppTheme {
  AppTheme._();

  /// The only supported application theme.
  static ThemeData get darkTheme {
    final TextTheme interTextTheme = GoogleFonts.interTextTheme(
      ThemeData.dark(useMaterial3: true).textTheme,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.inter().fontFamily,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: AppColors.background,
      canvasColor: AppColors.background,
      cardColor: AppColors.card,
      dividerColor: AppColors.divider,
      disabledColor: AppColors.disabled,
      focusColor: AppColors.focus,
      hoverColor: AppColors.hover,
      highlightColor: AppColors.pressed,
      splashColor: AppColors.pressed,
      shadowColor: AppColors.shadow,
      colorScheme: _colorScheme,
      textTheme: _textTheme(interTextTheme),
      appBarTheme: _appBarTheme,
      cardTheme: _cardTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      filledButtonTheme: _filledButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      inputDecorationTheme: _inputDecorationTheme,
      bottomNavigationBarTheme: _bottomNavigationBarTheme,
      navigationBarTheme: _navigationBarTheme,
      floatingActionButtonTheme: _floatingActionButtonTheme,
      dividerTheme: _dividerTheme,
      chipTheme: _chipTheme(interTextTheme),
      snackBarTheme: _snackBarTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
    );
  }

  static const ColorScheme _colorScheme = ColorScheme.dark(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.onPrimaryContainer,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    secondaryContainer: AppColors.secondaryContainer,
    onSecondaryContainer: AppColors.onSecondaryContainer,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.onTertiary,
    tertiaryContainer: AppColors.tertiaryContainer,
    onTertiaryContainer: AppColors.onTertiaryContainer,
    error: AppColors.error,
    onError: AppColors.onError,
    errorContainer: AppColors.errorContainer,
    onErrorContainer: AppColors.white,
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
    surfaceContainerLowest: AppColors.background,
    surfaceContainerLow: AppColors.surface,
    surfaceContainer: AppColors.card,
    surfaceContainerHigh: AppColors.surfaceElevated,
    surfaceContainerHighest: AppColors.surfaceHigh,
    onSurfaceVariant: AppColors.textSecondary,
    outline: AppColors.border,
    outlineVariant: AppColors.divider,
    inverseSurface: AppColors.inverseSurface,
    onInverseSurface: AppColors.textInverse,
    inversePrimary: AppColors.primaryPressed,
    scrim: AppColors.scrim,
  );

  static TextTheme _textTheme(TextTheme base) {
    return base
        .copyWith(
          displayLarge: base.displayLarge?.copyWith(
            fontSize: 56,
            fontWeight: FontWeight.w700,
            height: 1.05,
          ),
          displayMedium: base.displayMedium?.copyWith(
            fontSize: 44,
            fontWeight: FontWeight.w700,
            height: 1.08,
          ),
          displaySmall: base.displaySmall?.copyWith(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            height: 1.12,
          ),
          headlineLarge: base.headlineLarge?.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            height: 1.16,
          ),
          headlineMedium: base.headlineMedium?.copyWith(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            height: 1.18,
          ),
          headlineSmall: base.headlineSmall?.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            height: 1.22,
          ),
          titleLarge: base.titleLarge?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.28,
          ),
          titleMedium: base.titleMedium?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.35,
          ),
          titleSmall: base.titleSmall?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.35,
          ),
          bodyLarge: base.bodyLarge?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.55,
          ),
          bodyMedium: base.bodyMedium?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
          bodySmall: base.bodySmall?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.45,
          ),
          labelLarge: base.labelLarge?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.2,
          ),
          labelMedium: base.labelMedium?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.2,
          ),
          labelSmall: base.labelSmall?.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            height: 1.2,
          ),
        )
        .apply(
          bodyColor: AppColors.textPrimary,
          displayColor: AppColors.textPrimary,
          decorationColor: AppColors.primary,
        );
  }

  static const AppBarTheme _appBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    backgroundColor: AppColors.background,
    foregroundColor: AppColors.textPrimary,
    surfaceTintColor: AppColors.transparent,
    shadowColor: AppColors.transparent,
    iconTheme: IconThemeData(
      color: AppColors.textSecondary,
      size: AppConstants.iconMd,
    ),
    actionsIconTheme: IconThemeData(
      color: AppColors.textSecondary,
      size: AppConstants.iconMd,
    ),
    titleTextStyle: TextStyle(
      color: AppColors.textPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.25,
    ),
  );

  static const CardThemeData _cardTheme = CardThemeData(
    elevation: 0,
    margin: EdgeInsets.zero,
    color: AppColors.card,
    surfaceTintColor: AppColors.transparent,
    shadowColor: AppColors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: AppConstants.borderRadiusMd,
      side: BorderSide(color: AppColors.border),
    ),
  );

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: _baseButtonStyle.copyWith(
        elevation: const WidgetStatePropertyAll(0),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.disabled;
          }
          if (states.contains(WidgetState.pressed)) {
            return AppColors.primaryPressed;
          }
          if (states.contains(WidgetState.hovered)) {
            return AppColors.primaryHover;
          }
          return AppColors.primary;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.disabledForeground;
          }
          return AppColors.onPrimary;
        }),
        overlayColor: const WidgetStatePropertyAll(AppColors.pressed),
      ),
    );
  }

  static FilledButtonThemeData get _filledButtonTheme {
    return FilledButtonThemeData(
      style: _baseButtonStyle.copyWith(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.disabled;
          }
          if (states.contains(WidgetState.pressed)) {
            return AppColors.primaryPressed;
          }
          return AppColors.primary;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.disabledForeground;
          }
          return AppColors.onPrimary;
        }),
        overlayColor: const WidgetStatePropertyAll(AppColors.pressed),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: _baseButtonStyle.copyWith(
        backgroundColor: const WidgetStatePropertyAll(AppColors.transparent),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.disabledForeground;
          }
          return AppColors.textPrimary;
        }),
        overlayColor: const WidgetStatePropertyAll(AppColors.hover),
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return const BorderSide(color: AppColors.disabled);
          }
          if (states.contains(WidgetState.focused)) {
            return const BorderSide(color: AppColors.focus);
          }
          return const BorderSide(color: AppColors.borderStrong);
        }),
      ),
    );
  }

  static ButtonStyle get _baseButtonStyle {
    return const ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size.fromHeight(48)),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: AppConstants.space20,
          vertical: AppConstants.space12,
        ),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: AppConstants.borderRadiusMd,
        ),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
      ),
    );
  }

  static InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      hoverColor: AppColors.hover,
      prefixIconColor: AppColors.textTertiary,
      suffixIconColor: AppColors.textTertiary,
      iconColor: AppColors.textTertiary,
      hintStyle: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      floatingLabelStyle: const TextStyle(
        color: AppColors.primary,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
      errorStyle: const TextStyle(
        color: AppColors.error,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppConstants.space16,
        vertical: AppConstants.space14,
      ),
      border: _inputBorder(AppColors.border),
      enabledBorder: _inputBorder(AppColors.border),
      focusedBorder: _inputBorder(AppColors.primary),
      errorBorder: _inputBorder(AppColors.error),
      focusedErrorBorder: _inputBorder(AppColors.error),
      disabledBorder: _inputBorder(AppColors.disabled),
    );
  }

  static OutlineInputBorder _inputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: AppConstants.borderRadiusMd,
      borderSide: BorderSide(color: color),
    );
  }

  static const BottomNavigationBarThemeData _bottomNavigationBarTheme =
      BottomNavigationBarThemeData(
    backgroundColor: AppColors.surface,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.textSecondary,
    type: BottomNavigationBarType.fixed,
    elevation: 0,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  );

  static NavigationBarThemeData get _navigationBarTheme {
    return NavigationBarThemeData(
      height: AppConstants.bottomBarHeight,
      elevation: 0,
      backgroundColor: AppColors.surface,
      surfaceTintColor: AppColors.transparent,
      indicatorColor: AppColors.selected,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final bool isSelected = states.contains(WidgetState.selected);
        return TextStyle(
          color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final bool isSelected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: isSelected ? AppColors.primary : AppColors.textSecondary,
          size: AppConstants.iconMd,
        );
      }),
    );
  }

  static const FloatingActionButtonThemeData _floatingActionButtonTheme =
      FloatingActionButtonThemeData(
    elevation: 0,
    focusElevation: 0,
    hoverElevation: 0,
    highlightElevation: 0,
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.onPrimary,
    focusColor: AppColors.focus,
    hoverColor: AppColors.primaryHover,
    splashColor: AppColors.pressed,
    shape: RoundedRectangleBorder(
      borderRadius: AppConstants.borderRadiusLg,
    ),
  );

  static const DividerThemeData _dividerTheme = DividerThemeData(
    color: AppColors.divider,
    thickness: 1,
    space: 1,
  );

  static ChipThemeData _chipTheme(TextTheme textTheme) {
    return ChipThemeData(
      backgroundColor: AppColors.surface,
      selectedColor: AppColors.selected,
      disabledColor: AppColors.disabled,
      deleteIconColor: AppColors.textSecondary,
      checkmarkColor: AppColors.primary,
      side: const BorderSide(color: AppColors.border),
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.space10,
        vertical: AppConstants.space6,
      ),
      labelStyle: textTheme.labelMedium?.copyWith(
        color: AppColors.textSecondary,
        fontWeight: FontWeight.w600,
      ),
      secondaryLabelStyle: textTheme.labelMedium?.copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static const SnackBarThemeData _snackBarTheme = SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    backgroundColor: AppColors.inverseSurface,
    contentTextStyle: TextStyle(
      color: AppColors.textInverse,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.35,
    ),
    actionTextColor: AppColors.primaryPressed,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: AppConstants.borderRadiusMd,
    ),
  );

  static const ProgressIndicatorThemeData _progressIndicatorTheme =
      ProgressIndicatorThemeData(
    color: AppColors.primary,
    linearTrackColor: AppColors.surfaceHigh,
    circularTrackColor: AppColors.surfaceHigh,
  );
}

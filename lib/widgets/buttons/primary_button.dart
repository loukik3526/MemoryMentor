import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

/// A premium primary action button for Memory Mentor.
///
/// The button is full width by default, uses the app's primary gradient, and
/// supports disabled, loading, leading, and trailing states without requiring
/// callers to duplicate styling.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.leading,
    this.trailing,
    this.width,
    this.height = 56,
  });

  /// Visible button label.
  final String text;

  /// Called when the button is tapped.
  final VoidCallback? onPressed;

  /// Shows a progress indicator and prevents repeated taps.
  final bool isLoading;

  /// Controls the interactive enabled state.
  final bool enabled;

  /// Optional widget displayed before [text].
  final Widget? leading;

  /// Optional widget displayed after [text].
  final Widget? trailing;

  /// Button width. Defaults to full available width.
  final double? width;

  /// Button height. Defaults to 56.
  final double height;

  bool get _isDisabled => !enabled || onPressed == null;

  bool get _canPress => !_isDisabled && !isLoading;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: !_isDisabled,
      label: text,
      child: _PrimaryButtonPressAnimation(
        canPress: _canPress,
        builder: (context, updatePressed) {
          return AnimatedOpacity(
            opacity: _isDisabled ? 0.64 : 1,
            duration: AppConstants.animationFast,
            curve: Curves.easeOutCubic,
            child: SizedBox(
              width: width ?? double.infinity,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: AppConstants.borderRadiusMd,
                  boxShadow: _isDisabled
                      ? null
                      : const [
                          BoxShadow(
                            color: AppColors.shadow,
                            blurRadius: 18,
                            offset: Offset(0, 10),
                          ),
                        ],
                ),
                child: Material(
                  color: AppColors.transparent,
                  borderRadius: AppConstants.borderRadiusMd,
                  clipBehavior: Clip.antiAlias,
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: AppConstants.borderRadiusMd,
                      gradient: LinearGradient(
                        colors: _isDisabled
                            ? const [
                                AppColors.disabled,
                                AppColors.disabled,
                              ]
                            : AppColors.primaryGradient,
                      ),
                    ),
                    child: InkWell(
                      onTap: _canPress ? onPressed : null,
                      onHighlightChanged: updatePressed,
                      borderRadius: AppConstants.borderRadiusMd,
                      splashColor: AppColors.pressed,
                      highlightColor: AppColors.hover,
                      focusColor: AppColors.focus,
                      hoverColor: AppColors.hover,
                      child: Center(
                        child: AnimatedSwitcher(
                          duration: AppConstants.animationFast,
                          switchInCurve: Curves.easeOutCubic,
                          switchOutCurve: Curves.easeInCubic,
                          child: isLoading
                              ? const _PrimaryButtonLoader()
                              : _PrimaryButtonContent(
                                  text: text,
                                  leading: leading,
                                  trailing: trailing,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PrimaryButtonPressAnimation extends StatefulWidget {
  const _PrimaryButtonPressAnimation({
    required this.canPress,
    required this.builder,
  });

  final bool canPress;
  final Widget Function(BuildContext context, ValueChanged<bool> updatePressed)
      builder;

  @override
  State<_PrimaryButtonPressAnimation> createState() =>
      _PrimaryButtonPressAnimationState();
}

class _PrimaryButtonPressAnimationState
    extends State<_PrimaryButtonPressAnimation> {
  final ValueNotifier<bool> _pressed = ValueNotifier(false);

  @override
  void didUpdateWidget(covariant _PrimaryButtonPressAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.canPress && _pressed.value) {
      _pressed.value = false;
    }
  }

  @override
  void dispose() {
    _pressed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _pressed,
      builder: (context, isPressed, child) {
        return AnimatedScale(
          scale: widget.canPress && isPressed ? 0.98 : 1,
          duration: AppConstants.animationFast,
          curve: Curves.easeOutCubic,
          child: widget.builder(context, _updatePressed),
        );
      },
    );
  }

  void _updatePressed(bool isPressed) {
    if (!widget.canPress) {
      return;
    }
    _pressed.value = isPressed;
  }
}

class _PrimaryButtonContent extends StatelessWidget {
  const _PrimaryButtonContent({
    required this.text,
    this.leading,
    this.trailing,
  });

  final String text;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.space20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[
            IconTheme.merge(
              data: const IconThemeData(
                color: AppColors.onPrimary,
                size: AppConstants.iconSm,
              ),
              child: leading!,
            ),
            const SizedBox(width: AppConstants.space8),
          ],
          Flexible(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.onPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: AppConstants.space8),
            IconTheme.merge(
              data: const IconThemeData(
                color: AppColors.onPrimary,
                size: AppConstants.iconSm,
              ),
              child: trailing!,
            ),
          ],
        ],
      ),
    );
  }
}

class _PrimaryButtonLoader extends StatelessWidget {
  const _PrimaryButtonLoader();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.square(
      dimension: AppConstants.iconMd,
      child: CircularProgressIndicator(
        strokeWidth: 2.4,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.onPrimary),
      ),
    );
  }
}

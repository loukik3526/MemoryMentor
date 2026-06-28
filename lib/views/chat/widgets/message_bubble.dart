import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: AppConstants.space4,
          horizontal: AppConstants.space16,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: AppConstants.space10,
          horizontal: AppConstants.space16,
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUser ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(AppConstants.radiusMd),
            topRight: const Radius.circular(AppConstants.radiusMd),
            bottomLeft: Radius.circular(isUser ? AppConstants.radiusMd : 0),
            bottomRight: Radius.circular(isUser ? 0 : AppConstants.radiusMd),
          ),
          border: isUser ? null : Border.all(color: AppColors.border),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUser ? AppColors.white : AppColors.textPrimary,
            fontSize: 15,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}

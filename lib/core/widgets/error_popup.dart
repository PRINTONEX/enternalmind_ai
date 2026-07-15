/// {@template error_popup}
/// A premium glassmorphism error popup dialog.
///
/// Used for displaying initialization errors and other critical failures.
/// Features an error icon with red glow, title, message, and retry action.
/// {@endtemplate}
library;

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_shadows.dart';
import '../constants/ui_constants.dart';

/// {@macro error_popup}
class ErrorPopup extends StatelessWidget {
  /// Creates an error popup dialog.
  const ErrorPopup({
    super.key,
    required this.title,
    required this.message,
    this.onRetry,
    this.onDismiss,
  });

  /// The title of the error.
  final String title;

  /// The error message body.
  final String message;

  /// Optional retry callback. If null, only "Dismiss" is shown.
  final VoidCallback? onRetry;

  /// Optional dismiss callback.
  final VoidCallback? onDismiss;

  /// Shows the error popup as a dialog.
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    VoidCallback? onRetry,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      builder: (context) => ErrorPopup(
        title: title,
        message: message,
        onRetry: onRetry,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Spacing.lg),
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(RadiusConstants.lg),
          border: Border.all(color: AppColors.glassBorder),
          boxShadow: AppShadows.elevated,
        ),
        padding: const EdgeInsets.all(Spacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Error icon with glow
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.error.withAlpha(26),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.error.withAlpha(51),
                    blurRadius: 16,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(
                Icons.error_outline_rounded,
                color: AppColors.error,
                size: 32,
              ),
            ),

            const SizedBox(height: Spacing.lg),

            // Title
            Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: Spacing.sm),

            // Message
            Text(
              message,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: Spacing.xxl),

            // Actions
            Row(
              children: [
                if (onRetry != null) ...[
                  Expanded(
                    child: _ActionButton(
                      label: 'Retry',
                      onTap: () {
                        Navigator.of(context).pop();
                        onRetry?.call();
                      },
                      primary: true,
                    ),
                  ),
                  const SizedBox(width: Spacing.md),
                ],
                Expanded(
                  child: _ActionButton(
                    label: 'Dismiss',
                    onTap: () {
                      Navigator.of(context).pop();
                      onDismiss?.call();
                    },
                    primary: onRetry == null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Internal action button for the error popup.
class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.onTap,
    this.primary = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: primary ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(RadiusConstants.sm),
          border: primary ? null : Border.all(color: AppColors.glassBorder),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: primary ? Colors.white : AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

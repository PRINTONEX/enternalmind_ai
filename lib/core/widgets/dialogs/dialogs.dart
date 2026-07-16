import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../glass_card.dart';
import '../buttons/buttons.dart';
import '../loading/loading.dart';
import '../inputs/inputs.dart';

/// ── BaseDialog ──
class BaseDialog extends StatelessWidget {
  final Widget child;

  const BaseDialog({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: child,
    );
  }
}

/// ── ConfirmationDialog ──
class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmLabel = 'Confirm',
    this.cancelLabel = 'Cancel',
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      child: GlassCard(
        borderRadius: 24,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              message,
              style: GoogleFonts.inter(
                color: AppColors.textSecondary,
                fontSize: 12,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onCancel,
                  child: Text(
                    cancelLabel,
                    style: GoogleFonts.inter(color: AppColors.textSecondary, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 12),
                PrimaryGradientButton(
                  label: confirmLabel,
                  onPressed: onConfirm,
                  fullWidth: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// ── DeleteDialog ──
class DeleteDialog extends StatelessWidget {
  final String itemName;
  final VoidCallback onDelete;
  final VoidCallback onCancel;

  const DeleteDialog({
    super.key,
    required this.itemName,
    required this.onDelete,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      child: GlassCard(
        borderRadius: 24,
        padding: const EdgeInsets.all(24),
        glowColor: AppColors.error.withAlpha(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.warning_amber_rounded, color: AppColors.error, size: 22),
                const SizedBox(width: 8),
                Text(
                  'Delete $itemName?',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'This operation is irreversible and will permanently delete $itemName from your secure local database partition.',
              style: GoogleFonts.inter(
                color: AppColors.textSecondary,
                fontSize: 12,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onCancel,
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.inter(color: AppColors.textSecondary, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 12),
                DangerButton(
                  label: 'Delete Permanently',
                  onPressed: onDelete,
                  fullWidth: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// ── SuccessDialog ──
class SuccessDialog extends StatelessWidget {
  final String message;
  final VoidCallback onTap;

  const SuccessDialog({
    super.key,
    required this.message,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      child: GlassCard(
        borderRadius: 24,
        padding: const EdgeInsets.all(24),
        glowColor: AppColors.success.withAlpha(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.success.withAlpha(20),
                border: Border.all(color: AppColors.success.withAlpha(100)),
              ),
              child: const Icon(Icons.done, color: AppColors.success, size: 26),
            ),
            const SizedBox(height: 16),
            Text(
              'Operation Success',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: AppColors.textSecondary,
                fontSize: 11,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),
            PrimaryGradientButton(
              label: 'Acknowledge',
              onPressed: onTap,
              fullWidth: true,
            ),
          ],
        ),
      ),
    );
  }
}

/// ── WarningDialog ──
class WarningDialog extends StatelessWidget {
  final String message;
  final VoidCallback onProceed;
  final VoidCallback onCancel;

  const WarningDialog({
    super.key,
    required this.message,
    required this.onProceed,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      child: GlassCard(
        borderRadius: 24,
        padding: const EdgeInsets.all(24),
        glowColor: AppColors.warning.withAlpha(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.info_outline_rounded, color: AppColors.warning, size: 22),
                const SizedBox(width: 8),
                Text(
                  'System Notice',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              message,
              style: GoogleFonts.inter(
                color: AppColors.textSecondary,
                fontSize: 12,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onCancel,
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.inter(color: AppColors.textSecondary, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 12),
                PrimaryGradientButton(
                  label: 'Proceed',
                  onPressed: onProceed,
                  fullWidth: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// ── ErrorDialog ──
class ErrorDialog extends StatelessWidget {
  final String errorDetails;
  final VoidCallback onTap;

  const ErrorDialog({
    super.key,
    required this.errorDetails,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      child: GlassCard(
        borderRadius: 24,
        padding: const EdgeInsets.all(24),
        glowColor: AppColors.error.withAlpha(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.error.withAlpha(20),
                border: Border.all(color: AppColors.error.withAlpha(100)),
              ),
              child: const Icon(Icons.error_outline, color: AppColors.error, size: 26),
            ),
            const SizedBox(height: 16),
            Text(
              'System Failure',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF090D1A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: Text(
                errorDetails,
                style: GoogleFonts.firaCode(
                  color: AppColors.textError,
                  fontSize: 10,
                ),
              ),
            ),
            const SizedBox(height: 20),
            PrimaryGradientButton(
              label: 'Close',
              onPressed: onTap,
              fullWidth: true,
            ),
          ],
        ),
      ),
    );
  }
}

/// ── LoadingDialog ──
class LoadingDialog extends StatelessWidget {
  final String statusText;

  const LoadingDialog({
    super.key,
    required this.statusText,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BaseDialog(
        child: GlassCard(
          borderRadius: 20,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: NeonLoader(
            statusText: statusText,
            size: 40,
          ),
        ),
      ),
    );
  }
}

/// ── InputDialog ──
class InputDialog extends StatelessWidget {
  final String title;
  final String label;
  final String hintText;
  final String initialValue;
  final ValueChanged<String> onSubmit;
  final VoidCallback onCancel;
  final TextEditingController controller;

  InputDialog({
    super.key,
    required this.title,
    required this.label,
    required this.hintText,
    required this.initialValue,
    required this.onSubmit,
    required this.onCancel,
  }) : controller = TextEditingController(text: initialValue);

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      child: GlassCard(
        borderRadius: 24,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GlassTextField(
              controller: controller,
              labelText: label,
              hintText: hintText,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onCancel,
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.inter(color: AppColors.textSecondary, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 12),
                PrimaryGradientButton(
                  label: 'Submit',
                  onPressed: () => onSubmit(controller.text.trim()),
                  fullWidth: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

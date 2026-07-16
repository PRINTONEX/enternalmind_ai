import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../glass_card.dart';
import '../buttons/buttons.dart';

/// ── ErrorCard ──
class ErrorCard extends StatelessWidget {
  final String message;

  const ErrorCard({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      glowColor: AppColors.error.withAlpha(20),
      child: Row(
        children: [
          const Icon(Icons.error_outline_rounded, color: AppColors.error, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: GoogleFonts.inter(
                color: AppColors.textError,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ── RetryCard ──
class RetryCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onRetry;

  const RetryCard({
    super.key,
    required this.title,
    required this.description,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      glowColor: AppColors.error.withAlpha(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.sync_problem_rounded, color: AppColors.error, size: 18),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: GoogleFonts.inter(
              color: AppColors.textSecondary,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 14),
          SmallActionButton(
            label: 'Retry Connection',
            color: AppColors.error,
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}

/// ── NetworkError ──
class NetworkError extends StatelessWidget {
  final VoidCallback onRetry;

  const NetworkError({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return RetryCard(
      title: 'Neural Sync Interrupted',
      description: 'The connection to the AI provider timed out. Check your credentials or endpoint URL.',
      onRetry: onRetry,
    );
  }
}

/// ── StorageError ──
class StorageError extends StatelessWidget {
  final VoidCallback onAction;

  const StorageError({super.key, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      glowColor: AppColors.warning.withAlpha(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.storage_rounded, color: AppColors.warning, size: 18),
              SizedBox(width: 8),
              Text(
                'Storage Space Critically Low',
                style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            'Local secure database has reached 95% of its allocated partition size. Please clean temporary media files.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 11),
          ),
          const SizedBox(height: 14),
          SmallActionButton(
            label: 'Optimize Storage',
            color: AppColors.warning,
            onPressed: onAction,
          ),
        ],
      ),
    );
  }
}

/// ── PermissionError ──
class PermissionError extends StatelessWidget {
  final String permissionName;
  final VoidCallback onGrant;

  const PermissionError({
    super.key,
    required this.permissionName,
    required this.onGrant,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      glowColor: AppColors.primary.withAlpha(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.security_rounded, color: AppColors.primary, size: 18),
              SizedBox(width: 8),
              Text(
                'Permission Required',
                style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'EternalMind needs access to your $permissionName to record media samples or load files.',
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 11),
          ),
          const SizedBox(height: 14),
          SmallActionButton(
            label: 'Grant Permission',
            color: AppColors.primary,
            onPressed: onGrant,
          ),
        ],
      ),
    );
  }
}

/// ── NoInternet ──
class NoInternet extends StatelessWidget {
  final VoidCallback onCheck;

  const NoInternet({super.key, required this.onCheck});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      glowColor: AppColors.textDisabled.withAlpha(20),
      child: Column(
        children: [
          const Icon(Icons.wifi_off_rounded, color: AppColors.textSecondary, size: 32),
          const SizedBox(height: 10),
          const Text(
            'Offline Mode Active',
            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Only local neural double interactions are available. Link connection to refresh online sync.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 11),
          ),
          const SizedBox(height: 16),
          SecondaryOutlineButton(
            label: 'Refresh Connection',
            onPressed: onCheck,
            fullWidth: false,
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';

/// ── GlassBottomSheet ──
class GlassBottomSheet extends StatelessWidget {
  final Widget child;
  final double borderRadius;

  const GlassBottomSheet({
    super.key,
    required this.child,
    this.borderRadius = 28.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadius),
        topRight: Radius.circular(borderRadius),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceGlass,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            ),
            border: const Border(
              top: BorderSide(color: AppColors.glassBorder, width: 1.5),
            ),
          ),
          padding: const EdgeInsets.only(top: 8, bottom: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Bottom sheet handle bar indicator
              Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.glassBorderLight,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

/// ── ActionBottomSheet ──
class ActionBottomSheet extends StatelessWidget {
  final String title;
  final List<ListTile> actions;

  const ActionBottomSheet({
    super.key,
    required this.title,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return GlassBottomSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Text(
              title,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ...actions,
        ],
      ),
    );
  }
}

/// ── MediaPickerBottomSheet ──
class MediaPickerBottomSheet extends StatelessWidget {
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;

  const MediaPickerBottomSheet({
    super.key,
    required this.onCameraTap,
    required this.onGalleryTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassBottomSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Attach Media',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildPickerOption(
                icon: Icons.camera_alt_rounded,
                label: 'Camera',
                color: AppColors.primary,
                onTap: onCameraTap,
              ),
              _buildPickerOption(
                icon: Icons.photo_library_rounded,
                label: 'Gallery',
                color: AppColors.secondary,
                onTap: onGalleryTap,
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildPickerOption({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.surfaceInput,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.glassBorder),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ── ProfileActionSheet ──
class ProfileActionSheet extends StatelessWidget {
  final String profileName;
  final VoidCallback onEdit;
  final VoidCallback onExport;
  final VoidCallback onDelete;

  const ProfileActionSheet({
    super.key,
    required this.profileName,
    required this.onEdit,
    required this.onExport,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GlassBottomSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.settings_suggest_rounded, color: AppColors.primary, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Manage $profileName',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.edit_rounded, color: Colors.white),
            title: const Text('Edit Identity details', style: TextStyle(color: Colors.white)),
            onTap: onEdit,
          ),
          ListTile(
            leading: const Icon(Icons.share_rounded, color: Colors.white),
            title: const Text('Export JSON Profile', style: TextStyle(color: Colors.white)),
            onTap: onExport,
          ),
          const Divider(color: AppColors.glassBorder, height: 1),
          ListTile(
            leading: const Icon(Icons.delete_forever_rounded, color: AppColors.error),
            title: const Text('Delete Digital replica', style: TextStyle(color: AppColors.textError)),
            onTap: onDelete,
          ),
        ],
      ),
    );
  }
}

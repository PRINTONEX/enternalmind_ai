import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';

/// ── NeonAvatar ──
class NeonAvatar extends StatelessWidget {
  final String initials;
  final String? imageUrl;
  final double radius;
  final Color glowColor;
  final bool online;
  final bool verified;

  const NeonAvatar({
    super.key,
    required this.initials,
    this.imageUrl,
    this.radius = 24.0,
    this.glowColor = AppColors.primary,
    this.online = false,
    this.verified = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: radius * 2,
          height: radius * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: glowColor,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: glowColor.withAlpha(50),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
          child: ClipOval(
            child: imageUrl != null
                ? Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => _fallbackWidget(),
                  )
                : _fallbackWidget(),
          ),
        ),
        if (online)
          Positioned(
            right: 2,
            bottom: 2,
            child: Container(
              width: radius * 0.35,
              height: radius * 0.35,
              decoration: BoxDecoration(
                color: AppColors.success,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.surface, width: 1.5),
              ),
            ),
          ),
        if (verified && !online)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: radius * 0.45,
              height: radius * 0.45,
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: radius * 0.3,
              ),
            ),
          ),
      ],
    );
  }

  Widget _fallbackWidget() {
    return Container(
      color: AppColors.surfaceElevated,
      child: Center(
        child: Text(
          initials,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: radius * 0.8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

/// ── EditableAvatar ──
class EditableAvatar extends StatelessWidget {
  final String initials;
  final String? imageUrl;
  final double radius;
  final VoidCallback onTap;

  const EditableAvatar({
    super.key,
    required this.initials,
    this.imageUrl,
    this.radius = 48.0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          NeonAvatar(
            initials: initials,
            imageUrl: imageUrl,
            radius: radius,
          ),
          Container(
            width: radius * 0.55,
            height: radius * 0.55,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
              ),
            ),
            child: Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
              size: radius * 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

/// ── GroupAvatar ──
class GroupAvatar extends StatelessWidget {
  final List<String> initialsList;
  final double radius;

  const GroupAvatar({
    super.key,
    required this.initialsList,
    this.radius = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    final displayedCount = initialsList.take(3).toList();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(displayedCount.length, (index) {
        return Align(
          widthFactor: 0.65,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.surface, width: 2),
            ),
            child: NeonAvatar(
              initials: displayedCount[index],
              radius: radius,
              glowColor: index == 0
                  ? AppColors.primary
                  : (index == 1 ? AppColors.secondary : AppColors.accent),
            ),
          ),
        );
      }),
    );
  }
}

/// ── FamilyAvatar ──
class FamilyAvatar extends StatelessWidget {
  final String relationship;
  final String initials;

  const FamilyAvatar({
    super.key,
    required this.relationship,
    required this.initials,
  });

  @override
  Widget build(BuildContext context) {
    Color ringColor;
    switch (relationship.toLowerCase()) {
      case 'father':
      case 'mother':
        ringColor = AppColors.info;
        break;
      case 'brother':
      case 'sister':
        ringColor = AppColors.success;
        break;
      case 'spouse':
        ringColor = AppColors.accent;
        break;
      default:
        ringColor = AppColors.primary;
    }

    return NeonAvatar(
      initials: initials,
      radius: 20,
      glowColor: ringColor,
    );
  }
}

/// ── AIAvatar ──
class AIAvatar extends StatelessWidget {
  final double radius;

  const AIAvatar({
    super.key,
    this.radius = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary.withAlpha(20),
        border: Border.all(color: AppColors.primary, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withAlpha(50),
            blurRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.psychology,
          color: AppColors.primary,
          size: radius * 1.1,
        ),
      ),
    );
  }
}

/// ── VoiceAvatar ──
class VoiceAvatar extends StatelessWidget {
  final double radius;

  const VoiceAvatar({
    super.key,
    this.radius = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.secondary.withAlpha(20),
        border: Border.all(color: AppColors.secondary, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withAlpha(50),
            blurRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.mic,
          color: AppColors.secondary,
          size: radius * 1.0,
        ),
      ),
    );
  }
}

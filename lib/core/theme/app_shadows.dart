/// {@template app_shadows}
/// Shadow definitions for EternalMind AI.
///
/// Provides consistent box shadows for surface depth, glassmorphism,
/// glowing elements, and elevated components.
/// {@endtemplate}
library;

import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Predefined shadow configurations.
abstract final class AppShadows {
  AppShadows._();

  /// Subtle surface shadow for cards on dark backgrounds.
  static List<BoxShadow> surface = [
    BoxShadow(
      color: Colors.black.withAlpha(51),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  /// Glassmorphism card shadow.
  static List<BoxShadow> glass = [
    BoxShadow(
      color: Colors.black.withAlpha(77),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];

  /// Purple neon glow.
  static List<BoxShadow> glowPurple = [
    BoxShadow(
      color: AppColors.primary.withAlpha(77),
      blurRadius: 12,
      spreadRadius: 1,
    ),
  ];

  /// Cyan neon glow.
  static List<BoxShadow> glowCyan = [
    BoxShadow(
      color: AppColors.secondary.withAlpha(77),
      blurRadius: 12,
      spreadRadius: 1,
    ),
  ];

  /// Pink neon glow.
  static List<BoxShadow> glowPink = [
    BoxShadow(
      color: AppColors.accent.withAlpha(77),
      blurRadius: 12,
      spreadRadius: 1,
    ),
  ];

  /// Elevated shadow for modals and dialogs.
  static List<BoxShadow> elevated = [
    BoxShadow(
      color: Colors.black.withAlpha(128),
      blurRadius: 32,
      offset: const Offset(0, 16),
    ),
  ];

  /// Strong neon glow for hero elements (like the splash orb).
  static List<BoxShadow> neonHero = [
    BoxShadow(
      color: AppColors.primary.withAlpha(51),
      blurRadius: 24,
      spreadRadius: 4,
    ),
    BoxShadow(
      color: AppColors.secondary.withAlpha(26),
      blurRadius: 48,
      spreadRadius: 8,
    ),
    BoxShadow(
      color: AppColors.accent.withAlpha(13),
      blurRadius: 64,
      spreadRadius: 12,
    ),
  ];
}

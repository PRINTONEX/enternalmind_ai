/// {@template app_colors}
/// Color palette for EternalMind AI.
///
/// All colors are defined as constants matching the UI_DESIGN_SYSTEM.md spec.
/// {@endtemplate}
library;

import 'package:flutter/material.dart';

/// Core brand colors.
abstract final class AppColors {
  AppColors._();

  // ── Core Colors ──

  /// Primary Purple: #7C3AED
  static const Color primary = Color(0xFF7C3AED);

  /// Primary Light: #8B5CF6
  static const Color primaryLight = Color(0xFF8B5CF6);

  /// Primary Dark: #5B21B6
  static const Color primaryDark = Color(0xFF5B21B6);

  /// Secondary Cyan: #06B6D4
  static const Color secondary = Color(0xFF06B6D4);

  /// Secondary Light: #22D3EE
  static const Color secondaryLight = Color(0xFF22D3EE);

  /// Secondary Dark: #0891B2
  static const Color secondaryDark = Color(0xFF0891B2);

  /// Accent Pink: #EC4899
  static const Color accent = Color(0xFFEC4899);

  /// Accent Light: #F472B6
  static const Color accentLight = Color(0xFFF472B6);

  /// Accent Dark: #DB2777
  static const Color accentDark = Color(0xFFDB2777);

  /// Deep Blue: #0F172A
  static const Color deepBlue = Color(0xFF0F172A);

  /// Deep Blue Light: #1E293B
  static const Color deepBlueLight = Color(0xFF1E293B);

  /// Deep Blue Medium: #334155
  static const Color deepBlueMedium = Color(0xFF334155);

  // ── Functional Colors ──

  /// Success Green: #10B981
  static const Color success = Color(0xFF10B981);

  /// Warning Amber: #F59E0B
  static const Color warning = Color(0xFFF59E0B);

  /// Error Red: #EF4444
  static const Color error = Color(0xFFEF4444);

  /// Info Blue: #3B82F6
  static const Color info = Color(0xFF3B82F6);

  // ── Surface Colors ──

  /// Base surface: #0A0E1A
  static const Color surface = Color(0xFF0A0E1A);

  /// Elevated surface: #111827
  static const Color surfaceElevated = Color(0xFF111827);

  /// Card surface: #1A1F33
  static const Color surfaceCard = Color(0xFF1A1F33);

  /// Glass background: rgba(20, 25, 45, 0.75) — 0xBF = 191 (75% of 255)
  static const Color surfaceGlass = Color(0xBF14192D);

  /// Input surface: rgba(255, 255, 255, 0.05) — 0x0D = 13 (5% of 255)
  static const Color surfaceInput = Color(0x0DFFFFFF);

  /// Glass border: rgba(255, 255, 255, 0.12) — 0x1F = 31 (12% of 255)
  static const Color glassBorder = Color(0x1FFFFFFF);

  /// Glass border light: rgba(255, 255, 255, 0.18) — 0x2E = 46 (18% of 255)
  static const Color glassBorderLight = Color(0x2EFFFFFF);

  // ── Text Colors ──

  /// Primary text: #F8FAFC
  static const Color textPrimary = Color(0xFFF8FAFC);

  /// Secondary text: #94A3B8
  static const Color textSecondary = Color(0xFF94A3B8);

  /// Tertiary text: #64748B
  static const Color textTertiary = Color(0xFF64748B);

  /// Disabled text: #475569
  static const Color textDisabled = Color(0xFF475569);

  /// Link text: #8B5CF6
  static const Color textLink = Color(0xFF8B5CF6);

  /// Error text: #FCA5A5
  static const Color textError = Color(0xFFFCA5A5);

  /// Neon primary text: #C084FC
  static const Color textNeonPrimary = Color(0xFFC084FC);

  /// Neon secondary text: #67E8F9
  static const Color textNeonSecondary = Color(0xFF67E8F9);
}

/// {@template app_typography}
/// Typography definitions for EternalMind AI.
///
/// Uses Google Fonts Inter as primary and JetBrains Mono for monospace.
/// Follows the type scale defined in UI_DESIGN_SYSTEM.md.
/// {@endtemplate}
library;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Text styles collection matching the design system type scale.
abstract final class AppTypography {
  AppTypography._();

  /// Inter ExtraBold 42/48, letter-spacing -0.02
  static TextStyle get display1 => GoogleFonts.inter(
        fontWeight: FontWeight.w800,
        fontSize: 42,
        height: 48 / 42,
        letterSpacing: -0.02,
      );

  /// Inter Bold 34/40, letter-spacing -0.02
  static TextStyle get display2 => GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 34,
        height: 40 / 34,
        letterSpacing: -0.02,
      );

  /// Inter SemiBold 28/34, letter-spacing -0.01
  static TextStyle get heading1 => GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 28,
        height: 34 / 28,
        letterSpacing: -0.01,
      );

  /// Inter SemiBold 22/28, letter-spacing -0.01
  static TextStyle get heading2 => GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 22,
        height: 28 / 22,
        letterSpacing: -0.01,
      );

  /// Inter SemiBold 18/24
  static TextStyle get heading3 => GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        height: 24 / 18,
      );

  /// Inter Medium 16/22, letter-spacing 0.01
  static TextStyle get subheading => GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: 0.01,
      );

  /// Inter Regular 16/24, letter-spacing 0.01
  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 24 / 16,
        letterSpacing: 0.01,
      );

  /// Inter Regular 14/20, letter-spacing 0.01
  static TextStyle get body => GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0.01,
      );

  /// Inter Regular 12/16, letter-spacing 0.02
  static TextStyle get bodySmall => GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 16 / 12,
        letterSpacing: 0.02,
      );

  /// Inter Medium 11/14, letter-spacing 0.03
  static TextStyle get caption => GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 11,
        height: 14 / 11,
        letterSpacing: 0.03,
      );

  /// Inter SemiBold 13/18, letter-spacing 0.02
  static TextStyle get label => GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 13,
        height: 18 / 13,
        letterSpacing: 0.02,
      );

  /// Inter SemiBold 14/18, letter-spacing 0.03 (for buttons)
  static TextStyle get button => GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 18 / 14,
        letterSpacing: 0.03,
      );

  /// JetBrains Mono Regular 14/20 (for code, timestamps)
  static TextStyle get monospace => GoogleFonts.jetBrainsMono(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 20 / 14,
      );

  /// Neon primary text style with glow.
  static TextStyle neonPrimary({double fontSize = 42, FontWeight weight = FontWeight.w800}) =>
      GoogleFonts.inter(
        fontWeight: weight,
        fontSize: fontSize,
        color: const Color(0xFFC084FC),
        shadows: [
          Shadow(color: const Color(0xFF7C3AED).withAlpha(128), blurRadius: 8),
          Shadow(color: const Color(0xFF7C3AED).withAlpha(77), blurRadius: 16),
          Shadow(color: const Color(0xFF7C3AED).withAlpha(26), blurRadius: 24),
        ],
      );

  /// Neon secondary text style with glow.
  static TextStyle neonSecondary({double fontSize = 18, FontWeight weight = FontWeight.w500}) =>
      GoogleFonts.inter(
        fontWeight: weight,
        fontSize: fontSize,
        color: const Color(0xFF67E8F9),
        shadows: [
          Shadow(color: const Color(0xFF06B6D4).withAlpha(128), blurRadius: 8),
          Shadow(color: const Color(0xFF06B6D4).withAlpha(77), blurRadius: 16),
          Shadow(color: const Color(0xFF06B6D4).withAlpha(26), blurRadius: 24),
        ],
      );
}

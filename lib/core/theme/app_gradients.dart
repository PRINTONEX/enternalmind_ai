/// {@template app_gradients}
/// Gradient presets for EternalMind AI.
///
/// All gradients match the presets defined in UI_DESIGN_SYSTEM.md.
/// {@endtemplate}
library;

import 'package:flutter/material.dart';

/// Predefined gradient configurations.
abstract final class AppGradients {
  AppGradients._();

  /// Neon Purple: #7C3AED → #8B5CF6
  static const LinearGradient neonPurple = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF7C3AED),
      Color(0xFF8B5CF6),
    ],
  );

  /// Neon Cyan: #06B6D4 → #22D3EE
  static const LinearGradient neonCyan = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF06B6D4),
      Color(0xFF22D3EE),
    ],
  );

  /// Sunset: #7C3AED → #EC4899
  static const LinearGradient sunset = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF7C3AED),
      Color(0xFFEC4899),
    ],
  );

  /// Ocean: #06B6D4 → #3B82F6
  static const LinearGradient ocean = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF06B6D4),
      Color(0xFF3B82F6),
    ],
  );

  /// Deep Space: #0F172A → #1E293B
  static const LinearGradient deepSpace = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0F172A),
      Color(0xFF1E293B),
    ],
  );

  /// Glass Highlight: rgba(255,255,255,0.1) → rgba(255,255,255,0.02)
  static final LinearGradient glassHighlight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white.withAlpha(26),
      Colors.white.withAlpha(5),
    ],
  );

  /// Animated mesh gradient colors for the splash background.
  /// Creates a deep, flowing space-like ambiance.
  static const List<Color> splashMeshColors = [
    Color(0xFF0A0E1A), // surface
    Color(0xFF0F172A), // deep blue
    Color(0xFF1A1F33), // surface card
    Color(0xFF111827), // surface elevated
  ];

  /// Splash orb gradient — multi-color neon blend.
  static const List<Color> orbColors = [
    Color(0xFF7C3AED), // primary purple
    Color(0xFF8B5CF6), // primary light
    Color(0xFF06B6D4), // secondary cyan
    Color(0xFF22D3EE), // secondary light
    Color(0xFFEC4899), // accent pink
  ];
}

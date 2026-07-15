/// {@template app_theme}
/// EternalMind AI ThemeData composition.
///
/// Assembles the complete dark theme from [AppColors], [AppTypography],
/// [AppShadows], and [AppGradients] into a single [ThemeData] object.
///
/// Dark theme is the only theme. Light mode is not planned.
/// {@endtemplate}
library;

import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

/// Theme configuration for EternalMind AI.
abstract final class AppTheme {
  AppTheme._();

  /// The complete dark theme data.
  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,

        // ── Color Scheme ──
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          tertiary: AppColors.accent,
          surface: AppColors.surface,
          error: AppColors.error,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: AppColors.textPrimary,
          onError: Colors.white,
        ),

        // ── Scaffold ──
        scaffoldBackgroundColor: AppColors.surface,

        // ── Typography ──
        textTheme: TextTheme(
          displayLarge: AppTypography.display1,
          displayMedium: AppTypography.display2,
          headlineLarge: AppTypography.heading1,
          headlineMedium: AppTypography.heading2,
          headlineSmall: AppTypography.heading3,
          titleMedium: AppTypography.subheading,
          bodyLarge: AppTypography.bodyLarge,
          bodyMedium: AppTypography.body,
          bodySmall: AppTypography.bodySmall,
          labelLarge: AppTypography.button,
          labelMedium: AppTypography.label,
          labelSmall: AppTypography.caption,
        ),

        // ── Extensions ──
        extensions: const <ThemeExtension<dynamic>>[
          _AppThemeColors(AppColors.primary, AppColors.secondary, AppColors.accent),
        ],

        // ── Global Visual Density ──
        visualDensity: VisualDensity.adaptivePlatformDensity,

        // ── Material Components Override ──
        // Disable default Material splash and highlight
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,

        // ── Divider ──
        dividerColor: AppColors.glassBorder,
        dividerTheme: DividerThemeData(
          color: AppColors.glassBorder,
          thickness: 1,
          space: 1,
        ),
      );
}

/// Custom theme extension for accessing app-specific colors.
class _AppThemeColors extends ThemeExtension<_AppThemeColors> {
  const _AppThemeColors(this.primary, this.secondary, this.accent);

  final Color primary;
  final Color secondary;
  final Color accent;

  @override
  _AppThemeColors copyWith({Color? primary, Color? secondary, Color? accent}) {
    return _AppThemeColors(
      primary ?? this.primary,
      secondary ?? this.secondary,
      accent ?? this.accent,
    );
  }

  @override
  _AppThemeColors lerp(_AppThemeColors? other, double t) {
    if (other == null) return this;
    return _AppThemeColors(
      Color.lerp(primary, other.primary, t)!,
      Color.lerp(secondary, other.secondary, t)!,
      Color.lerp(accent, other.accent, t)!,
    );
  }
}

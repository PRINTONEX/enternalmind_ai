import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class AppTheme {
  static ThemeData get lightTheme => FlexThemeData.light(
        scheme: FlexScheme.purpleBrown,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.95,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          fabUseShape: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          blendOnColors: true,
          tooltipRadius: 8,
          tooltipSchemeColor: SchemeColor.inverseSurface,
          navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
          navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
          navigationBarMutedUnselectedLabel: true,
          navigationBarSelectedIconSchemeColor: SchemeColor.primary,
          navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
          navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
        ),
        keyColors: const FlexKeyColors(
          useKeyColors: true,
          keepPrimary: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      );

  static ThemeData get darkTheme => FlexThemeData.dark(
        scheme: FlexScheme.purpleBrown,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.9,
        useMaterial3: true,
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          fabUseShape: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          blendOnColors: true,
          tooltipRadius: 8,
          tooltipSchemeColor: SchemeColor.inverseSurface,
          navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
          navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
          navigationBarMutedUnselectedLabel: true,
          navigationBarSelectedIconSchemeColor: SchemeColor.primary,
          navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
          navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
        ),
        keyColors: const FlexKeyColors(
          useKeyColors: true,
          keepPrimary: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      );

  // ─── Semantic Colors ──────────────────────────────────────────────────

  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFE53935);
  static const Color warningColor = Color(0xFFFFA726);
  static const Color infoColor = Color(0xFF42A5F5);

  static Color statusColor(String status) {
    switch (status) {
      case 'sent':
      case 'success':
        return successColor;
      case 'failed':
      case 'error':
        return errorColor;
      case 'pending':
      case 'warning':
        return warningColor;
      default:
        return infoColor;
    }
  }

  static IconData statusIcon(String status) {
    switch (status) {
      case 'sent':
      case 'success':
        return Icons.check_circle;
      case 'failed':
      case 'error':
        return Icons.error;
      case 'pending':
        return Icons.schedule;
      default:
        return Icons.info;
    }
  }

  // ─── Card Decoration ─────────────────────────────────────────────────

  static BoxDecoration cardDecoration({required bool isDark}) => BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.3)
                : Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      );

  // ─── Section Title ───────────────────────────────────────────────────

  static TextStyle sectionTitle({required bool isDark}) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: isDark ? Colors.grey[400] : Colors.grey[600],
        letterSpacing: 0.5,
      );

  // ─── App Color ────────────────────────────────────────────────────────

  static Color appColor(String name) {
    final lower = name.toLowerCase();
    final colors = {
      'whatsapp': const Color(0xFF25D366),
      'telegram': const Color(0xFF0088CC),
      'messenger': const Color(0xFF006AFF),
      'instagram': const Color(0xFFE4405F),
      'messages': const Color(0xFF34B7F1),
      'slack': const Color(0xFF4A154B),
      'discord': const Color(0xFF5865F2),
      'twitter': const Color(0xFF1DA1F2),
    };
    return colors.entries
            .firstWhere(
              (e) => lower.contains(e.key),
              orElse: () => const MapEntry('', Colors.grey),
            )
            .value;
  }
}

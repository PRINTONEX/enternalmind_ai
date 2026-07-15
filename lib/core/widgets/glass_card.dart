/// {@template glass_card}
/// A reusable glassmorphism card widget.
///
/// The foundational UI container for EternalMind AI.
/// Provides a frosted glass surface with optional glow border.
///
/// Usage:
/// ```dart
/// GlassCard(
///   child: Text('Hello'),
/// )
/// ```
/// {@endtemplate}
library;

import 'dart:ui';

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_shadows.dart';
import '../constants/ui_constants.dart';

/// Glassmorphism card variants.
enum GlassCardVariant {
  /// Standard glass card with frosted background.
  standard,

  /// Elevated card with stronger glow for hero sections.
  hero,

  /// Transparent — no background, just border and blur.
  transparent,
}

/// {@macro glass_card}
class GlassCard extends StatelessWidget {
  /// Creates a glassmorphism card.
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(Spacing.lg),
    this.margin,
    this.borderRadius = RadiusConstants.md,
    this.glowColor,
    this.onTap,
    this.variant = GlassCardVariant.standard,
    this.width,
    this.height,
    this.customBorder,
  });

  /// The child widget inside the card.
  final Widget child;

  /// Inner padding. Defaults to 16px all sides.
  final EdgeInsetsGeometry padding;

  /// Outer margin. Defaults to null (no margin).
  final EdgeInsetsGeometry? margin;

  /// Border radius. Defaults to 12px (md).
  final double borderRadius;

  /// Optional glow color for the border. If null, no glow.
  final Color? glowColor;

  /// Optional tap callback to make the card tappable.
  final VoidCallback? onTap;

  /// Visual variant of the card.
  final GlassCardVariant variant;

  /// Optional fixed width.
  final double? width;

  /// Optional fixed height.
  final double? height;

  /// Optional custom border override.
  final Border? customBorder;

  Color get _backgroundColor {
    switch (variant) {
      case GlassCardVariant.standard:
        return AppColors.surfaceGlass;
      case GlassCardVariant.hero:
        return AppColors.surfaceCard;
      case GlassCardVariant.transparent:
        return Colors.transparent;
    }
  }

  Border get _border {
    if (customBorder != null) return customBorder!;
    final borderColor = glowColor ?? AppColors.glassBorder;
    return Border.all(
      color: variant == GlassCardVariant.hero
          ? borderColor.withAlpha(60)
          : borderColor,
      width: variant == GlassCardVariant.hero ? 1.5 : 1.0,
    );
  }

  List<BoxShadow> get _shadows {
    final shadows = <BoxShadow>[...AppShadows.glass];
    if (glowColor != null) {
      shadows.addAll(AppShadows.glowPurple);
    }
    if (variant == GlassCardVariant.hero) {
      shadows.addAll(AppShadows.neonHero);
    }
    return shadows;
  }

  @override
  Widget build(BuildContext context) {
    final card = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          width: width,
          height: height,
          padding: padding,
          margin: margin ?? EdgeInsets.zero,
          decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: _border,
            boxShadow: _shadows,
          ),
          child: child,
        ),
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: card,
      );
    }

    return card;
  }
}

/// Extension to access glass card styling on [BuildContext].
extension GlassCardContext on BuildContext {
  /// Wraps a child in a standard glass card.
  Widget glassCard({
    required Widget child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? borderRadius,
    Color? glowColor,
    VoidCallback? onTap,
  }) {
    return GlassCard(
      padding: padding ?? const EdgeInsets.all(Spacing.lg),
      margin: margin,
      borderRadius: borderRadius ?? RadiusConstants.md,
      glowColor: glowColor,
      onTap: onTap,
      child: child,
    );
  }
}

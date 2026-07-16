/// {@template gradient_button}
/// A premium gradient action button with neon glow.
///
/// Variants:
/// - [GradientButton] — primary gradient (purple)
/// - [GradientButton.secondary] — glass style
/// - [GradientButton.text] — text-only, no background
/// {@endtemplate}
library;

import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_gradients.dart';
import '../../constants/ui_constants.dart';

enum GradientButtonVariant { primary, secondary, text }

/// {@macro gradient_button}
class GradientButton extends StatefulWidget {
  const GradientButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.variant = GradientButtonVariant.primary,
    this.width,
    this.height = 48,
    this.loading = false,
  });

  /// Primary purple gradient button.
  const GradientButton.primary({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.width,
    this.height = 48,
    this.loading = false,
  }) : variant = GradientButtonVariant.primary;

  /// Secondary glass style button.
  const GradientButton.secondary({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.width,
    this.height = 48,
    this.loading = false,
  }) : variant = GradientButtonVariant.secondary;

  /// Text-only button.
  const GradientButton.text({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.width,
    this.height = 48,
    this.loading = false,
  }) : variant = GradientButtonVariant.text;

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final GradientButtonVariant variant;
  final double? width;
  final double height;
  final bool loading;

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scaleController;
  late final Animation<double> _scaleAnim;
  bool _pressed = false;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.97).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails _) {
    if (widget.onPressed != null && !widget.loading) {
      _pressed = true;
      _scaleController.forward();
    }
  }

  void _handleTapUp(TapUpDetails _) {
    if (_pressed) {
      _scaleController.reverse();
      _pressed = false;
      widget.onPressed?.call();
    }
  }

  void _handleTapCancel() {
    if (_pressed) {
      _scaleController.reverse();
      _pressed = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = widget.onPressed == null || widget.loading;
    final opacity = isDisabled ? 0.4 : 1.0;

    Widget button = AnimatedBuilder(
      animation: _scaleAnim,
      builder: (context, _) {
        return Transform.scale(
          scale: _scaleAnim.value,
          child: Container(
            width: widget.width,
            height: widget.height,
            padding: const EdgeInsets.symmetric(horizontal: Spacing.xxl),
            decoration: _buildDecoration(),
            child: Center(
              child: widget.loading
                  ? _buildLoading()
                  : _buildContent(),
            ),
          ),
        );
      },
    );

    if (!isDisabled) {
      button = GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        child: button,
      );
    }

    return Opacity(opacity: opacity, child: button);
  }

  BoxDecoration _buildDecoration() {
    switch (widget.variant) {
      case GradientButtonVariant.primary:
        return BoxDecoration(
          gradient: AppGradients.neonPurple,
          borderRadius: BorderRadius.circular(RadiusConstants.sm),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withAlpha(77),
              blurRadius: 12,
              spreadRadius: 1,
            ),
          ],
        );
      case GradientButtonVariant.secondary:
        return BoxDecoration(
          color: AppColors.surfaceGlass,
          borderRadius: BorderRadius.circular(RadiusConstants.sm),
          border: Border.all(color: AppColors.glassBorder),
        );
      case GradientButtonVariant.text:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusConstants.sm),
        );
    }
  }

  Widget _buildContent() {
    final style = TextStyle(
      color: widget.variant == GradientButtonVariant.primary
          ? Colors.white
          : AppColors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.03,
    );

    if (widget.icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.icon!,
          const SizedBox(width: Spacing.sm),
          Text(widget.label, style: style),
        ],
      );
    }

    return Text(widget.label, style: style);
  }

  Widget _buildLoading() {
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
          widget.variant == GradientButtonVariant.primary
              ? Colors.white
              : AppColors.textPrimary,
        ),
      ),
    );
  }
}

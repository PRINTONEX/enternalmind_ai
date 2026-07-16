import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_gradients.dart';

/// ── PrimaryGradientButton ──
/// Primary neon purple-to-cyan gradient action button.
class PrimaryGradientButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool loading;
  final bool fullWidth;

  const PrimaryGradientButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.loading = false,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || loading;

    Widget button = Container(
      height: 48,
      decoration: BoxDecoration(
        gradient: isDisabled
            ? LinearGradient(
                colors: [
                  AppColors.primary.withAlpha(80),
                  AppColors.secondary.withAlpha(80),
                ],
              )
            : AppGradients.neonPurple,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isDisabled
            ? []
            : [
                BoxShadow(
                  color: AppColors.primary.withAlpha(60),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : onPressed,
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: loading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        icon!,
                        const SizedBox(width: 8),
                      ],
                      Text(
                        label,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }
}

/// ── SecondaryOutlineButton ──
/// Transparent outline button with a sleek glass border.
class SecondaryOutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool fullWidth;

  const SecondaryOutlineButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget button = Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.glassBorderLight,
          width: 1.5,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(width: 8),
                  ],
                  Text(
                    label,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }
}

/// ── GlassButton ──
/// Translucent glassmorphism button.
class GlassButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool fullWidth;

  const GlassButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget button = Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.surfaceGlass,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.glassBorder,
          width: 1.2,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  icon!,
                  const SizedBox(width: 8),
                ],
                Text(
                  label,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }
}

/// ── DangerButton ──
/// Red action button for irreversible operations (like deletion).
class DangerButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool loading;
  final bool fullWidth;

  const DangerButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.loading = false,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || loading;

    Widget button = Container(
      height: 48,
      decoration: BoxDecoration(
        color: isDisabled ? AppColors.error.withAlpha(80) : AppColors.error,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isDisabled
            ? []
            : [
                BoxShadow(
                  color: AppColors.error.withAlpha(60),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : onPressed,
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: loading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        icon!,
                        const SizedBox(width: 8),
                      ],
                      Text(
                        label,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }
}

/// ── IconTextButton ──
/// Compact text button with prefix/suffix icons.
class IconTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Widget icon;
  final bool trailingIcon;
  final Color textColor;

  const IconTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.icon,
    this.trailingIcon = false,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!trailingIcon) ...[
            icon,
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (trailingIcon) ...[
            const SizedBox(width: 6),
            icon,
          ],
        ],
      ),
    );
  }
}

/// ── FloatingGradientButton ──
/// Premium glowing floating action button.
class FloatingGradientButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const FloatingGradientButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppGradients.neonPurple,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withAlpha(100),
            blurRadius: 16,
            spreadRadius: 2,
          ),
        ],
      ),
      child: RawMaterialButton(
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

/// ── SmallActionButton ──
/// Tight action button for tags/chips actions.
class SmallActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? color;

  const SmallActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = color ?? AppColors.secondary;

    return Container(
      decoration: BoxDecoration(
        color: activeColor.withAlpha(20),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: activeColor.withAlpha(100),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: activeColor,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ── RoundedIconButton ──
/// Circular glass icon action button.
class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? iconColor;
  final Color? glowColor;
  final double size;

  const RoundedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconColor,
    this.glowColor,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    final activeIconColor = iconColor ?? Colors.white;
    final activeGlowColor = glowColor ?? AppColors.primary.withAlpha(30);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.surfaceGlass,
        border: Border.all(color: AppColors.glassBorder),
        boxShadow: [
          BoxShadow(
            color: activeGlowColor,
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Icon(
            icon,
            color: activeIconColor,
            size: size * 0.45,
          ),
        ),
      ),
    );
  }
}

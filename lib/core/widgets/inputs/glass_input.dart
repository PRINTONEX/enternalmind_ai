/// {@template glass_input}
/// A premium glassmorphism input field matching the EternalMind design system.
///
/// Variations:
/// - [GlassInput] — default text input
/// - [GlassInput.multiline] — for longer text
/// - [GlassInput.search] — with search icon
/// - [GlassInput.password] — with visibility toggle
/// {@endtemplate}
library;

import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../constants/ui_constants.dart';

/// {@macro glass_input}
class GlassInput extends StatelessWidget {
  const GlassInput({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.keyboardType,
    this.textInputAction,
    this.autofocus = false,
    this.focusNode,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.style,
    this.hintStyle,
    this.errorText,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final bool readOnly;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? errorText;

  /// Creates a multiline [GlassInput].
  const GlassInput.multiline({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLines = 5,
    this.minLines = 3,
    this.maxLength,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.keyboardType,
    this.textInputAction,
    this.autofocus = false,
    this.focusNode,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.style,
    this.hintStyle,
    this.errorText,
  });

  /// Creates a search [GlassInput].
  const GlassInput.search({
    super.key,
    this.controller,
    this.hintText = 'Search...',
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.keyboardType,
    this.textInputAction,
    this.autofocus = false,
    this.focusNode,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.style,
    this.hintStyle,
    this.errorText,
  });

  InputDecoration _buildDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.surfaceInput,
      labelText: labelText,
      labelStyle: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 13,
      ),
      hintText: hintText,
      hintStyle: hintStyle ?? const TextStyle(
        color: AppColors.textTertiary,
        fontSize: 14,
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      errorText: errorText,
      errorStyle: const TextStyle(
        color: AppColors.textError,
        fontSize: 11,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusConstants.sm),
        borderSide: const BorderSide(color: AppColors.error, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusConstants.sm),
        borderSide: const BorderSide(color: AppColors.error, width: 1.2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusConstants.sm),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusConstants.sm),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusConstants.sm),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: Spacing.lg,
        vertical: Spacing.md,
      ),
      counterStyle: const TextStyle(
        color: AppColors.textTertiary,
        fontSize: 11,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: _buildDecoration(),
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      onChanged: onChanged,
      validator: validator,
      enabled: enabled,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofocus: autofocus,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      readOnly: readOnly,
      style: style ?? const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 14,
      ),
      cursorColor: AppColors.primary,
    );
  }
}

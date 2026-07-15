/// {@template ui_constants}
/// UI spacing, radius, and sizing constants for EternalMind AI.
///
/// Based on an 8px grid system as defined in UI_DESIGN_SYSTEM.md.
/// {@endtemplate}
library;

import 'package:flutter/material.dart';

/// Spacing constants based on an 8px grid system.
abstract final class Spacing {
  Spacing._();

  /// 4px — quarter step.
  static const double xs = 4;

  /// 8px — base step.
  static const double sm = 8;

  /// 12px.
  static const double md = 12;

  /// 16px.
  static const double lg = 16;

  /// 20px.
  static const double xl = 20;

  /// 24px.
  static const double xxl = 24;

  /// 32px.
  static const double xxxl = 32;

  /// 40px.
  static const double huge = 40;

  /// 48px.
  static const double giant = 48;

  /// 64px.
  static const double massive = 64;
}

/// Border radius constants.
abstract final class RadiusConstants {
  RadiusConstants._();

  /// 4px — badges, tags.
  static const double xs = 4;

  /// 8px — buttons, inputs.
  static const double sm = 8;

  /// 12px — cards, dialogs.
  static const double md = 12;

  /// 16px — modals, sheets.
  static const double lg = 16;

  /// 20px — containers, bottom nav.
  static const double xl = 20;

  /// 999px — pills, avatars.
  static const double full = 999;

  /// Returns a [BorderRadius] for the given value.
  static BorderRadius borderRadius(double radius) => BorderRadius.circular(radius);

  /// Returns a [BorderRadius] for 'sm' (8px).
  static BorderRadius get smRadius => borderRadius(sm);

  /// Returns a [BorderRadius] for 'md' (12px).
  static BorderRadius get mdRadius => borderRadius(md);

  /// Returns a [BorderRadius] for 'lg' (16px).
  static BorderRadius get lgRadius => borderRadius(lg);

  /// Returns a [BorderRadius] for 'xl' (20px).
  static BorderRadius get xlRadius => borderRadius(xl);
}

/// Icon size constants.
abstract final class IconSizes {
  IconSizes._();

  /// 14px.
  static const double xs = 14;

  /// 18px.
  static const double sm = 18;

  /// 22px.
  static const double md = 22;

  /// 28px.
  static const double lg = 28;

  /// 36px.
  static const double xl = 36;

  /// 48px.
  static const double hero = 48;
}

/// {@template app_constants}
/// App-wide constants for EternalMind AI.
///
/// Centralizes all magic strings, numbers, and configuration values
/// used across the application.
/// {@endtemplate}
library;

/// App metadata constants.
abstract final class AppConstants {
  AppConstants._();

  /// Application name.
  static const String appName = 'EternalMind AI';

  /// Application tagline / subtitle.
  static const String appTagline = 'Digital Human Platform';

  /// Current version string.
  static const String version = '1.0.0+1';

  /// Copyright notice.
  static const String copyright = '© 2026 Kanglei Innovations';

  /// Default animation duration in milliseconds.
  static const int defaultAnimationDurationMs = 300;

  /// Splash screen minimum display duration.
  static const int splashMinDurationMs = 2000;

  /// Maximum splash initialization timeout.
  static const int splashTimeoutMs = 5000;

  /// Number of particles to render on splash screen.
  static const int splashParticleCount = 12;
}

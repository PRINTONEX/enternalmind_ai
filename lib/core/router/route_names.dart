/// {@template route_names}
/// Named route constants for GoRouter.
/// {@endtemplate}
library;

/// Centralized route path constants.
abstract final class RouteNames {
  RouteNames._();

  /// Splash screen route.
  static const String splash = '/';

  /// Welcome / entry screen route.
  static const String welcome = '/welcome';

  /// Dashboard route.
  static const String dashboard = '/dashboard';

  /// Profile wizard route.
  static const String wizard = '/wizard';

  /// Import Replica Backup route.
  static const String import = '/import';

  /// Profile detail route.
  static const String profileDetail = '/profile/:id';

  /// AI Providers route.
  static const String aiProviders = '/ai_providers';

  /// Timeline route.
  static const String timeline = '/timeline';

  /// Family Tree route.
  static const String familyTree = '/family_tree';

  /// Memories Vault route.
  static const String memories = '/memories';

  /// Voice Space route.
  static const String voiceSpace = '/voicespace';

  /// Settings route.
  static const String settings = '/settings';

  /// Debug database viewer route.
  static const String debug = '/debug';
}

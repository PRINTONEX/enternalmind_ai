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
}

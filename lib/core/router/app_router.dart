/// {@template app_router}
/// GoRouter configuration for EternalMind AI.
///
/// Manages all application routes:
/// - `/` → Splash Screen (initialization)
/// - `/welcome` → Welcome / Entry Screen
/// - `/wizard` → Profile Wizard (no active profile)
/// - `/import` → Import Replica Backup
/// - `/dashboard` → Dashboard (active profile exists)
/// - `/profile/:id` → Profile Detail
/// {@endtemplate}
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/splash_screen.dart';
import '../../features/onboarding/presentation/welcome_screen.dart';
import '../../features/wizard/presentation/wizard_screen.dart';
import '../../features/import/presentation/import_screen.dart';
import 'route_names.dart';

/// Creates and returns the GoRouter configuration.
GoRouter createRouter() {
  return GoRouter(
    initialLocation: RouteNames.splash,
    debugLogDiagnostics: false,

    // ── Routes ──
    routes: [
      GoRoute(
        path: RouteNames.splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: RouteNames.welcome,
        name: 'welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),

      GoRoute(
        path: RouteNames.wizard,
        name: 'wizard',
        builder: (context, state) => const WizardScreen(),
      ),

      GoRoute(
        path: RouteNames.import,
        name: 'import',
        builder: (context, state) => const ImportScreen(),
      ),

      GoRoute(
        path: RouteNames.dashboard,
        name: 'dashboard',
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text(
              'Dashboard',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),

      GoRoute(
        path: RouteNames.profileDetail,
        name: 'profileDetail',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return Scaffold(
            body: Center(
              child: Text(
                'Profile Detail: $id',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          );
        },
      ),
    ],

    // ── Error Handling ──
    errorBuilder: (context, state) => Scaffold(
      backgroundColor: const Color(0xFF0A0E1A),
      body: Center(
        child: Text(
          'Route not found: ${state.uri}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

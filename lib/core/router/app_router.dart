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
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/ai_providers/presentation/ai_providers_screen.dart';
import '../../features/timeline/presentation/timeline_screen.dart';
import '../../features/family_tree/presentation/family_tree_screen.dart';
import '../../features/memories/presentation/memories_screen.dart';
import '../../features/voice_space/presentation/voice_space_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/debug/presentation/debug_screen.dart';
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
        builder: (context, state) => const DashboardScreen(),
      ),

      GoRoute(
        path: RouteNames.profileDetail,
        name: 'profileDetail',
        builder: (context, state) => const ProfileScreen(),
      ),

      GoRoute(
        path: RouteNames.aiProviders,
        name: 'aiProviders',
        builder: (context, state) => const AiProvidersScreen(),
      ),

      GoRoute(
        path: RouteNames.timeline,
        name: 'timeline',
        builder: (context, state) => const TimelineScreen(),
      ),

      GoRoute(
        path: RouteNames.familyTree,
        name: 'familyTree',
        builder: (context, state) => const FamilyTreeScreen(),
      ),

      GoRoute(
        path: RouteNames.memories,
        name: 'memories',
        builder: (context, state) => const MemoriesScreen(),
      ),

      GoRoute(
        path: RouteNames.voiceSpace,
        name: 'voiceSpace',
        builder: (context, state) => const VoiceSpaceScreen(),
      ),

      GoRoute(
        path: RouteNames.settings,
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),

      GoRoute(
        path: RouteNames.debug,
        name: 'debug',
        builder: (context, state) => const DebugScreen(),
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

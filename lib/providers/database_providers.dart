/// {@template database_providers}
/// Database-related Riverpod providers for EternalMind AI.
///
/// Provides real singletons for the Drift database, Hive, and
/// flutter_secure_storage so every part of the app shares a single
/// instance of each service.
/// {@endtemplate}
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../database/app_database.dart';

// ── Drift ──

/// Singleton provider for the Drift [AppDatabase].
///
/// The database is created lazily (via `LazyDatabase` inside `AppDatabase`)
/// so no I/O happens before the first query.
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

// ── Secure Storage ──

/// Singleton provider for [FlutterSecureStorage].
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

// ── Hive ──

/// FutureProvider that initializes Hive via `Hive.initFlutter()`.
///
/// Watch this provider to ensure Hive is ready before opening any boxes.
final hiveInitProvider = FutureProvider<void>((ref) async {
  await Hive.initFlutter();
  // Open any global (pre-requisite) boxes here as the project grows.
});

// ── Active Profile ──

/// The profile ID of the currently-active Digital Human.
///
/// `null` means no profile has been created or activated yet.
final activeProfileIdProvider = StateProvider<int?>((ref) => null);

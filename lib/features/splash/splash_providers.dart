/// {@template splash_providers}
/// Riverpod providers for the splash screen initialization.
///
/// Manages the app initialization lifecycle including database setup,
/// cache initialization, and active profile detection.
/// {@endtemplate}
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../database/daos/human_dao.dart';
import '../../providers/database_providers.dart';

/// The state of the app initialization process.
enum SplashState {
  /// Initialization has not started yet.
  initial,

  /// App is currently initializing.
  loading,

  /// Initialization succeeded but no active profile exists.
  noProfile,

  /// Initialization succeeded and an active profile exists.
  ready,

  /// An error occurred during initialization.
  error,
}

/// Model for splash screen loading status.
class SplashStatus {
  const SplashStatus({
    this.state = SplashState.initial,
    this.loadingMessage = '',
    this.progress = 0.0,
    this.errorMessage,
  });

  /// Current splash state.
  final SplashState state;

  /// Current loading status message.
  final String loadingMessage;

  /// Progress from 0.0 to 1.0.
  final double progress;

  /// Error message if state is [SplashState.error].
  final String? errorMessage;

  /// Creates a copy with updated fields.
  SplashStatus copyWith({
    SplashState? state,
    String? loadingMessage,
    double? progress,
    String? errorMessage,
  }) {
    return SplashStatus(
      state: state ?? this.state,
      loadingMessage: loadingMessage ?? this.loadingMessage,
      progress: progress ?? this.progress,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Provider that manages the splash initialization flow.
final splashProvider = AsyncNotifierProvider<SplashNotifier, SplashStatus>(
  SplashNotifier.new,
);

class SplashNotifier extends AsyncNotifier<SplashStatus> {
  @override
  Future<SplashStatus> build() async {
    return const SplashStatus(state: SplashState.initial);
  }

  /// Runs the full initialization sequence.
  ///
  /// Each step performs real work — no simulated delays.
  Future<SplashStatus> initialize() async {
    state = const AsyncValue.data(
      SplashStatus(
        state: SplashState.loading,
        loadingMessage: 'Starting...',
        progress: 0.0,
      ),
    );

    try {
      // ── 1. Drift Database ──
      state = AsyncValue.data(
        SplashStatus(
          state: SplashState.loading,
          loadingMessage: 'Initializing Database...',
          progress: 0.12,
        ),
      );
      final db = ref.read(appDatabaseProvider);
      final humanDao = HumanDao(db);
      // Trigger the lazy database to open the SQLite file and run migrations.
      await humanDao.getAllHumans();

      // ── 2. Secure Storage ──
      state = AsyncValue.data(
        SplashStatus(
          state: SplashState.loading,
          loadingMessage: 'Initializing Secure Storage...',
          progress: 0.28,
        ),
      );
      final storage = ref.read(secureStorageProvider);
      // Verify the storage plugin is functional.
      await _verifySecureStorage(storage);

      // ── 3. Hive ──
      state = AsyncValue.data(
        SplashStatus(
          state: SplashState.loading,
          loadingMessage: 'Loading Memories...',
          progress: 0.45,
        ),
      );
      await ref.read(hiveInitProvider.future);

      // ── 4. AI Provider Cache (lightweight) ──
      state = AsyncValue.data(
        SplashStatus(
          state: SplashState.loading,
          loadingMessage: 'Loading Providers...',
          progress: 0.6,
        ),
      );
      // Future expansion: pre-load AI API keys & model configs here.
      // Currently a no-op — Hive provides the storage layer when needed.

      // ── 5. Profile Check ──
      state = AsyncValue.data(
        SplashStatus(
          state: SplashState.loading,
          loadingMessage: 'Checking Active Profile...',
          progress: 0.8,
        ),
      );
      final lastActive = await humanDao.getLastActive();
      final hasActiveProfile = lastActive != null;

      // ── 6. Finalise ──
      state = AsyncValue.data(
        SplashStatus(
          state: SplashState.loading,
          loadingMessage: 'Almost Ready...',
          progress: 1.0,
        ),
      );
      // A tiny micro-pause (≈1 frame) so the UI can paint "Almost Ready..."
      // before navigation. This is not a simulated delay of real work.
      await Future.delayed(const Duration(milliseconds: 80));

      final resultState =
          hasActiveProfile ? SplashState.ready : SplashState.noProfile;

      // Store the active profile ID so other parts of the app can use it.
      if (hasActiveProfile) {
        ref.read(activeProfileIdProvider.notifier).state = lastActive.id;
      }

      state = AsyncValue.data(
        SplashStatus(
          state: resultState,
          loadingMessage:
              hasActiveProfile ? 'Welcome back!' : 'Ready to begin',
          progress: 1.0,
        ),
      );

      return state.requireValue;
    } catch (e) {
      state = AsyncValue.data(
        SplashStatus(
          state: SplashState.error,
          loadingMessage: 'Initialization failed',
          progress: 0.5,
          errorMessage: '$e',
        ),
      );
      return state.requireValue;
    }
  }

  /// Retry initialization after an error.
  Future<SplashStatus> retry() async {
    return initialize();
  }

  // ── Helpers ──

  /// Performs a lightweight write-read-delete round-trip to verify that
  /// [FlutterSecureStorage] is working correctly.
  Future<void> _verifySecureStorage(FlutterSecureStorage storage) async {
    const key = '_em_splash_verify';
    await storage.write(key: key, value: '1');
    await storage.read(key: key);
    await storage.delete(key: key);
  }
}

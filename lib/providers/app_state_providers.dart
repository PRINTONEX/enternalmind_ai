/// {@template app_state_providers}
/// App-wide Riverpod providers for EternalMind AI.
///
/// Manages global application state including lifecycle, connectivity,
/// and theme configuration.
/// {@endtemplate}
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Whether the app has been fully initialized.
final appInitializedProvider = StateProvider<bool>((ref) => false);

/// Whether the app is ready to navigate after initialization.
final appReadyProvider = Provider<bool>((ref) {
  return ref.watch(appInitializedProvider);
});

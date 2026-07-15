import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style for immersive dark experience
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFF0A0E1A),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const EternalMindApp());
}

/// Root widget for EternalMind AI.
///
/// Self-contained widget that includes [ProviderScope] for Riverpod,
/// making it testable without depending on [runApp].
class EternalMindApp extends StatelessWidget {
  /// Creates the root application widget.
  const EternalMindApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = createRouter();

    return ProviderScope(
      child: MaterialApp.router(
        title: 'EternalMind AI',
        debugShowCheckedModeBanner: false,

        // ── Theme ──
        theme: AppTheme.dark,

        // ── Router ──
        routerConfig: router,

        // ── Remove all default Material decorations ──
        builder: (context, child) {
          return child ?? const SizedBox.shrink();
        },
      ),
    );
  }
}

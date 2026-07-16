/// {@template splash_screen}
/// Premium futuristic Splash Screen for EternalMind AI.
///
/// Shows the neural head logo with animated glow, floating particles,
/// dynamic loading messages, and text action buttons (Import Replica /
/// Create Replica) matching the reference UI design.
/// {@endtemplate}
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/ui_constants.dart';
import '../../../core/router/route_names.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_gradients.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/error_popup.dart';
import '../../../core/widgets/floating_particles.dart';
import '../../../core/widgets/neon_loader.dart';
import '../splash_providers.dart';

/// {@macro splash_screen}
class SplashScreen extends ConsumerStatefulWidget {
  /// Creates the splash screen.
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _orbController;
  late final AnimationController _textController;

  late final Animation<double> _orbBreathing;
  late final Animation<double> _orbGlow;
  late final Animation<double> _orbFloat;

  late final Animation<double> _titleFadeIn;
  late final Animation<double> _titleSlideUp;
  late final Animation<double> _titleScaleIn;

  late final Animation<double> _subtitleFadeIn;

  late final Animation<double> _bottomFadeIn;

  bool _initialized = false;
  bool _isRetrying = false;

  @override
  void initState() {
    super.initState();

    // ── Orb Animation Controller (continuous) ──
    _orbController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();

    // Orb breathing: gentle scale pulse
    _orbBreathing = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _orbController, curve: Curves.easeInOutSine),
    );

    // Orb glow pulse: intensity wave (longer interval for slower pulse)
    _orbGlow = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _orbController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOutSine),
      ),
    );

    // Orb floating: gentle vertical bobbing
    _orbFloat = Tween<double>(begin: -6.0, end: 6.0).animate(
      CurvedAnimation(parent: _orbController, curve: Curves.easeInOutSine),
    );

    // ── Text Animation Controller (one-shot sequence) ──
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // Title: fade in + slide up + scale in
    _titleFadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
    _titleSlideUp = Tween<double>(begin: 20.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
      ),
    );
    _titleScaleIn = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack),
      ),
    );

    // Subtitle: fade in after title
    _subtitleFadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.3, 0.7, curve: Curves.easeOut),
      ),
    );

    // Bottom elements: fade in last
    _bottomFadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    // Start text animations
    _textController.forward();
  }

  @override
  void dispose() {
    _orbController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      // Start initialization after the first frame
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(splashProvider.notifier).initialize();
      });
    }
  }

  void _navigateAfterInit(SplashStatus status) {
    if (!mounted) return;
    switch (status.state) {
      case SplashState.noProfile:
        context.go(RouteNames.welcome);
      case SplashState.ready:
        context.go(RouteNames.dashboard);
      default:
        break;
    }
  }

  Future<void> _handleRetry() async {
    if (_isRetrying) return;
    _isRetrying = true;
    await ref.read(splashProvider.notifier).retry();
    // Navigation is handled by the ref.listen in build()
    if (mounted) _isRetrying = false;
  }

  @override
  Widget build(BuildContext context) {
    final splashAsync = ref.watch(splashProvider);

    // ── Listen for navigation triggers ──
    ref.listen(splashProvider, (AsyncValue<SplashStatus>? previous, AsyncValue<SplashStatus> next) {
      next.whenOrNull(
        data: (status) {
          if (status.state == SplashState.noProfile ||
              status.state == SplashState.ready) {
            // Small delay to let animations finish
            Future.delayed(const Duration(milliseconds: 600), () {
              _navigateAfterInit(status);
            });
          }
        },
        error: (error, _) {
          // Show error popup with auto-retry after 2 seconds
          ErrorPopup.show(
            context: context,
            title: 'Initialization Failed',
            message: error.toString(),
            onRetry: _handleRetry,
          );
          // Automatic retry after 3 seconds
          Future.delayed(const Duration(seconds: 3), () {
            if (mounted) _handleRetry();
          });
        },
      );
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppGradients.splashMeshColors,
          ),
        ),
        child: Stack(
          children: [
            // ── Animated mesh gradient overlay ──
            _AnimatedMeshGradient(),

            // ── Floating particles ──
            const FloatingParticles(
              particleCount: AppConstants.splashParticleCount,
              minSpeed: 0.2,
              maxSpeed: 0.6,
              minSize: 1.5,
              maxSize: 4.0,
            ),

            // ── Main content ──
            SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const Spacer(flex: 3),

                    // ── Neural Ring Image ──
                    _buildNeuralRing(),

                    const SizedBox(height: Spacing.xxl),

                    // ── Title ──
                    _buildTitle(),

                    const SizedBox(height: Spacing.sm),

                    // ── Subtitle ──
                    _buildSubtitle(),

                    const Spacer(flex: 3),

                    // ── Bottom section (loading status or version info) ──
                    splashAsync.when(
                      data: (status) => _buildBottomSection(status),
                      loading: () => const SizedBox(height: 120),
                      error: (err, _) => _buildBottomSection(
                        const SplashStatus(
                          state: SplashState.error,
                          errorMessage: 'Initialization failed',
                        ),
                      ),
                    ),

                    const SizedBox(height: Spacing.lg),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the animated neural ring logo from the asset image.
  Widget _buildNeuralRing() {
    return AnimatedBuilder(
      animation: _orbController,
      builder: (context, _) {
        return Transform.translate(
          offset: Offset(0, _orbFloat.value),
          child: Transform.scale(
            scale: _orbBreathing.value,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withAlpha(
                      (35 * _orbGlow.value).round(),
                    ),
                    blurRadius: 40 * _orbGlow.value,
                    spreadRadius: 4 * _orbGlow.value,
                  ),
                  BoxShadow(
                    color: AppColors.secondary.withAlpha(
                      (20 * _orbGlow.value).round(),
                    ),
                    blurRadius: 56 * _orbGlow.value,
                    spreadRadius: 6 * _orbGlow.value,
                  ),
                ],
              ),
              child: Image.asset(
                'assets/splash/neural_ring.png',
                width: 160,
                height: 160,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }

  /// Builds the title with fade + scale + slide animations.
  Widget _buildTitle() {
    return AnimatedBuilder(
      animation: _textController,
      builder: (context, _) {
        return Opacity(
          opacity: _titleFadeIn.value,
          child: Transform.translate(
            offset: Offset(0, _titleSlideUp.value),
            child: Transform.scale(
              scale: _titleScaleIn.value,
              child: Text(
                AppConstants.appName,
                style: AppTypography.neonPrimary(
                  fontSize: 42,
                  weight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  /// Builds the subtitle with fade animation.
  Widget _buildSubtitle() {
    return AnimatedBuilder(
      animation: _textController,
      builder: (context, _) {
        return Opacity(
          opacity: _subtitleFadeIn.value,
          child: Text(
            AppConstants.appTagline,
            style: AppTypography.neonSecondary(
              fontSize: 16,
              weight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  /// Builds the bottom section with loading status and progress.
  Widget _buildBottomSection(SplashStatus status) {
    return AnimatedBuilder(
      animation: _textController,
      builder: (context, _) {
        return Opacity(
          opacity: _bottomFadeIn.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.xxxl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (status.state == SplashState.loading) ...[
                  // Loading indicator
                  NeonLoader(
                    size: 36,
                    strokeWidth: 2.5,
                    statusText: status.loadingMessage,
                    textStyle: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: Spacing.lg),

                  // Progress bar
                  _buildProgressBar(status.progress),
                ] else if (status.state == SplashState.error) ...[
                  const SizedBox(height: 80),
                  // Error state
                  GestureDetector(
                    onTap: _handleRetry,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.xxl,
                        vertical: Spacing.md,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(RadiusConstants.sm),
                        border: Border.all(color: AppColors.error.withAlpha(77)),
                        color: AppColors.error.withAlpha(13),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.refresh_rounded,
                            color: AppColors.error,
                            size: 18,
                          ),
                          const SizedBox(width: Spacing.sm),
                          Text(
                            'Retry Initialization',
                            style: TextStyle(
                              color: AppColors.error.withAlpha(200),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ] else ...[
                  // Version and copyright
                  Text(
                    'v${AppConstants.version}',
                    style: const TextStyle(
                      color: AppColors.textTertiary,
                      fontSize: 12,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: Spacing.xs),
                  Text(
                    AppConstants.copyright,
                    style: const TextStyle(
                      color: AppColors.textDisabled,
                      fontSize: 10,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  /// Builds a smooth gradient progress bar.
  Widget _buildProgressBar(double progress) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: Container(
        height: 3,
        width: 200,
        color: AppColors.glassBorder,
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: progress.clamp(0.0, 1.0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.secondary,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// ────────────────────────────────────────────────────────────
// Animated Mesh Gradient Background
// ────────────────────────────────────────────────────────────

/// Renders a slow-shifting animated mesh gradient background.
class _AnimatedMeshGradient extends StatefulWidget {
  @override
  State<_AnimatedMeshGradient> createState() => _AnimatedMeshGradientState();
}

class _AnimatedMeshGradientState extends State<_AnimatedMeshGradient>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(
                  0.3 + _controller.value * 0.2,
                  -0.3 + _controller.value * 0.15,
                ),
                radius: 0.8 + _controller.value * 0.3,
                colors: [
                  AppColors.primary.withAlpha((10 + (15 * _controller.value)).round()),
                  AppColors.secondary.withAlpha((5 + (10 * _controller.value)).round()),
                  AppColors.accent.withAlpha((3 + (8 * _controller.value)).round()),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.3, 0.6, 1.0],
              ),
            ),
          ),
        );
      },
    );
  }
}

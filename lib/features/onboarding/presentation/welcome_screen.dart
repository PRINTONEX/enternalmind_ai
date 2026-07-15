/// {@template welcome_screen}
/// Welcome / Entry Screen — first interaction after splash.
///
/// Shows neural_ring.png hero image, EternalMind AI branding, tagline,
/// description, primary "Create Your Digital Human" button,
/// secondary "Import Existing Replica" button, and privacy notice.
/// {@endtemplate}
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/ui_constants.dart';
import '../../../core/router/route_names.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/floating_particles.dart';

/// {@macro welcome_screen}
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late final AnimationController _floatController;
  late final AnimationController _breathController;
  late final AnimationController _fadeController;

  late final Animation<double> _floatAnim;
  late final Animation<double> _breathAnim;

  @override
  void initState() {
    super.initState();

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _breathController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..forward();

    _floatAnim = Tween<double>(begin: -8.0, end: 8.0).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOutSine),
    );

    _breathAnim = Tween<double>(begin: 0.98, end: 1.02).animate(
      CurvedAnimation(parent: _breathController, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    _breathController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF060913),
      body: Stack(
        children: [
          // ── Subtle blue radial glow ──
          Positioned(
            top: -100,
            left: -100,
            right: -100,
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.6,
                  colors: [
                    const Color(0xFF3B82F6).withAlpha(15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // ── Floating particles ──
          const FloatingParticles(
            particleCount: 8,
            minSpeed: 0.15,
            maxSpeed: 0.4,
            minSize: 1.0,
            maxSize: 2.5,
          ),

          // ── Main content ──
          SafeArea(
            child: FadeTransition(
              opacity: _fadeController,
              child: Column(
                children: [
                  const Spacer(flex: 2),

                  // ── Neural Ring Image ──
                  _buildNeuralRing(),

                  const SizedBox(height: Spacing.xxl),

                  // ── Title: EternalMind AI ──
                  _buildGradientTitle(),

                  const SizedBox(height: Spacing.sm),

                  // ── Subtitle ──
                  _buildSubtitle(),

                  const SizedBox(height: Spacing.lg),

                  // ── Decorative divider ──
                  _buildDivider(),

                  const SizedBox(height: Spacing.lg),

                  // ── Tagline ──
                  _buildTagline(),

                  const SizedBox(height: Spacing.md),

                  // ── Description ──
                  _buildDescription(),

                  const Spacer(flex: 2),

                  // ── Primary Button ──
                  _buildPrimaryButton(),

                  const SizedBox(height: Spacing.md),

                  // ── Secondary Button ──
                  _buildSecondaryButton(),

                  const SizedBox(height: Spacing.xxl),

                  // ── Privacy Notice ──
                  _buildPrivacyNotice(),

                  const SizedBox(height: Spacing.lg),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Neural Ring ──
  Widget _buildNeuralRing() {
    return AnimatedBuilder(
      animation: Listenable.merge([_floatController, _breathController]),
      builder: (context, _) {
        return Transform.translate(
          offset: Offset(0, _floatAnim.value),
          child: Transform.scale(
            scale: _breathAnim.value,
            child: Image.asset(
              'assets/splash/neural_ring.png',
              height: (MediaQuery.of(context).size.height * 0.22).clamp(140, 200),
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }

  // ── Gradient Title ──
  Widget _buildGradientTitle() {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Color(0xFF7C3AED), Color(0xFF06B6D4)],
      ).createShader(bounds),
      child: const Text(
        'EternalMind AI',
        style: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.02,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // ── Subtitle ──
  Widget _buildSubtitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.xxxl),
      child: Text(
        'LOCAL LEGACY & CONSCIOUSNESS PRESERVATION',
        style: TextStyle(
          color: AppColors.textTertiary,
          fontSize: 10,
          fontWeight: FontWeight.w500,
          letterSpacing: 2.5,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // ── Decorative Divider ──
  Widget _buildDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 1.5,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF7C3AED), Color(0xFF06B6D4)],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF7C3AED), Color(0xFF06B6D4)],
              ),
            ),
          ),
        ),
        Container(
          width: 40,
          height: 1.5,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF7C3AED), Color(0xFF06B6D4)],
            ),
          ),
        ),
      ],
    );
  }

  // ── Tagline ──
  Widget _buildTagline() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.xxxl),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            height: 1.4,
          ),
          children: [
            const TextSpan(text: 'Preserve '),
            _gradientText('Today'),
            const TextSpan(text: '.\nInspire '),
            _gradientText('Eternity'),
            const TextSpan(text: '.'),
          ],
        ),
      ),
    );
  }

  TextSpan _gradientText(String word) {
    return TextSpan(
      text: word,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        foreground: Paint()
          ..shader = const LinearGradient(
            colors: [Color(0xFF7C3AED), Color(0xFF06B6D4)],
          ).createShader(const Rect.fromLTWH(0, 0, 100, 30)),
      ),
    );
  }

  // ── Description ──
  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.xxxl),
      child: Text(
        'Build your Digital Human. Preserve your memories, stories, knowledge, and voice so future generations can learn, connect and be inspired.',
        style: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 13,
          height: 1.6,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // ── Primary Button ──
  Widget _buildPrimaryButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: _GradientButton(
          gradient: const LinearGradient(
            colors: [Color(0xFF7C3AED), Color(0xFF3B82F6), Color(0xFF06B6D4)],
          ),
          label: 'Create Your Digital Human',
          icon: Icons.auto_awesome_rounded,
          onTap: () => context.push(RouteNames.wizard),
        ),
      ),
    );
  }

  // ── Secondary Button ──
  Widget _buildSecondaryButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: _OutlineGradientButton(
          label: 'Import Existing Replica',
          icon: Icons.cloud_upload_outlined,
          onTap: () => context.push(RouteNames.import),
        ),
      ),
    );
  }

  // ── Privacy Notice ──
  Widget _buildPrivacyNotice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.shield_rounded,
          color: const Color(0xFF7C3AED).withAlpha(128),
          size: 14,
        ),
        const SizedBox(width: 6),
        Text(
          'Your data is private. Stored locally. Encrypted. Secure.',
          style: TextStyle(
            color: AppColors.textTertiary.withAlpha(150),
            fontSize: 11,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}

// ────────────────────────────────────────────────────────────
// Gradient Button (full-width, tall, rounded)
// ────────────────────────────────────────────────────────────

/// A premium gradient action button with neon glow.
class _GradientButton extends StatefulWidget {
  const _GradientButton({
    required this.gradient,
    required this.label,
    this.icon,
    required this.onTap,
  });

  final Gradient gradient;
  final String label;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  State<_GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<_GradientButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scaleCtrl;
  late final Animation<double> _scaleAnim;
  bool _pressed = false;

  @override
  void initState() {
    super.initState();
    _scaleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.97).animate(
      CurvedAnimation(parent: _scaleCtrl, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _scaleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _pressed = true;
        _scaleCtrl.forward();
      },
      onTapUp: (_) {
        _scaleCtrl.reverse();
        if (_pressed) widget.onTap();
        _pressed = false;
      },
      onTapCancel: () {
        _scaleCtrl.reverse();
        _pressed = false;
      },
      child: AnimatedBuilder(
        animation: _scaleAnim,
        builder: (context, _) {
          return Transform.scale(
            scale: _scaleAnim.value,
            child: Container(
              decoration: BoxDecoration(
                gradient: widget.gradient as LinearGradient?,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF7C3AED).withAlpha(77),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.icon != null) ...[
                      Icon(widget.icon, color: Colors.white, size: 22),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      widget.label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ────────────────────────────────────────────────────────────
// Outline Gradient Button (transparent, gradient border)
// ────────────────────────────────────────────────────────────

/// A transparent button with a purple→cyan gradient border.
class _OutlineGradientButton extends StatefulWidget {
  const _OutlineGradientButton({
    required this.label,
    this.icon,
    required this.onTap,
  });

  final String label;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  State<_OutlineGradientButton> createState() => _OutlineGradientButtonState();
}

class _OutlineGradientButtonState extends State<_OutlineGradientButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scaleCtrl;
  late final Animation<double> _scaleAnim;
  bool _pressed = false;

  @override
  void initState() {
    super.initState();
    _scaleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.97).animate(
      CurvedAnimation(parent: _scaleCtrl, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _scaleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _pressed = true;
        _scaleCtrl.forward();
      },
      onTapUp: (_) {
        _scaleCtrl.reverse();
        if (_pressed) widget.onTap();
        _pressed = false;
      },
      onTapCancel: () {
        _scaleCtrl.reverse();
        _pressed = false;
      },
      child: AnimatedBuilder(
        animation: _scaleAnim,
        builder: (context, _) {
          return Transform.scale(
            scale: _scaleAnim.value,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF7C3AED), Color(0xFF06B6D4)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(1.5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color(0xFF060913),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.icon != null) ...[
                          Icon(
                            widget.icon,
                            color: Colors.white70,
                            size: 22,
                          ),
                          const SizedBox(width: 8),
                        ],
                        Text(
                          widget.label,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

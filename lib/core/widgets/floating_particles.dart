/// {@template floating_particles}
/// Animated floating particles for the splash and hero screen backgrounds.
///
/// Renders small glowing dots that float upward with varying speeds,
/// sizes, and opacities, creating a premium futuristic ambiance.
/// {@endtemplate}
library;

import 'dart:math';

import 'package:flutter/material.dart';

/// {@macro floating_particles}
class FloatingParticles extends StatefulWidget {
  /// Creates a floating particle background.
  const FloatingParticles({
    super.key,
    this.particleCount = 12,
    this.minSpeed = 0.3,
    this.maxSpeed = 0.8,
    this.minSize = 1.5,
    this.maxSize = 3.5,
    this.colors,
  });

  /// Number of particles to render.
  final int particleCount;

  /// Minimum vertical drift speed.
  final double minSpeed;

  /// Maximum vertical drift speed.
  final double maxSpeed;

  /// Minimum particle radius.
  final double minSize;

  /// Maximum particle radius.
  final double maxSize;

  /// Optional list of colors. Defaults to purple, cyan, pink glow.
  final List<Color>? colors;

  @override
  State<FloatingParticles> createState() => _FloatingParticlesState();
}

class _FloatingParticlesState extends State<FloatingParticles>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<_Particle> _particles;
  final _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
    _particles = List.generate(widget.particleCount, (_) => _createParticle());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _Particle _createParticle() {
    final colors = widget.colors ?? const [
      Color(0xFF7C3AED), // purple
      Color(0xFF8B5CF6), // light purple
      Color(0xFF06B6D4), // cyan
      Color(0xFF22D3EE), // light cyan
      Color(0xFFEC4899), // pink
    ];

    return _Particle(
      x: _random.nextDouble(),
      y: _random.nextDouble(),
      speed: widget.minSpeed + _random.nextDouble() * (widget.maxSpeed - widget.minSpeed),
      size: widget.minSize + _random.nextDouble() * (widget.maxSize - widget.minSize),
      opacity: 0.1 + _random.nextDouble() * 0.4,
      color: colors[_random.nextInt(colors.length)],
      driftX: (-0.3 + _random.nextDouble() * 0.6),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return CustomPaint(
          size: Size.infinite,
          painter: _ParticlePainter(
            particles: _particles,
            progress: _controller.value,
          ),
        );
      },
    );
  }
}

/// Data model for a single particle.
class _Particle {
  _Particle({
    required this.x,
    required this.y,
    required this.speed,
    required this.size,
    required this.opacity,
    required this.color,
    required this.driftX,
  });

  double x;
  double y;
  final double speed;
  final double size;
  final double opacity;
  final Color color;
  final double driftX;
}

/// Custom painter for rendering particles.
class _ParticlePainter extends CustomPainter {
  _ParticlePainter({
    required this.particles,
    required this.progress,
  });

  final List<_Particle> particles;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in particles) {
      // Update position
      final deltaY = (particle.y - progress * particle.speed) % 1.0;
      final wobble = sin(progress * 4 + particle.x * 10) * 0.02;
      final deltaX = (particle.x + progress * particle.driftX + wobble) % 1.0;

      final px = deltaX * size.width;
      final py = deltaY * size.height;

      // Glow
      final glowPaint = Paint()
        ..color = particle.color.withAlpha((particle.opacity * 51).round())
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
      canvas.drawCircle(Offset(px, py), particle.size * 3, glowPaint);

      // Core
      final corePaint = Paint()
        ..color = particle.color.withAlpha((particle.opacity * 255).round());
      canvas.drawCircle(Offset(px, py), particle.size, corePaint);
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter oldDelegate) =>
      oldDelegate.progress != progress;
}

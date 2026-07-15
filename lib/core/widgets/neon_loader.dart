/// {@template neon_loader}
/// A premium neon loading indicator with animated spinning ring.
///
/// Used for full-screen / overlay loading states.
/// Features a gradient spinning ring with optional status text below.
/// {@endtemplate}
library;

import 'dart:math';

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_gradients.dart';

/// {@macro neon_loader}
class NeonLoader extends StatefulWidget {
  /// Creates a neon loading indicator.
  const NeonLoader({
    super.key,
    this.size = 48,
    this.strokeWidth = 3,
    this.statusText,
    this.textStyle,
  });

  /// Diameter of the ring in pixels. Defaults to 48.
  final double size;

  /// Thickness of the ring stroke. Defaults to 3.
  final double strokeWidth;

  /// Optional status text shown below the ring.
  final String? statusText;

  /// Optional text style override for the status text.
  final TextStyle? textStyle;

  @override
  State<NeonLoader> createState() => _NeonLoaderState();
}

class _NeonLoaderState extends State<NeonLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return SizedBox(
              width: widget.size,
              height: widget.size,
              child: CustomPaint(
                painter: _NeonRingPainter(
                  progress: _controller.value,
                  strokeWidth: widget.strokeWidth,
                ),
              ),
            );
          },
        ),
        if (widget.statusText != null) ...[
          const SizedBox(height: 16),
          Text(
            widget.statusText!,
            style: widget.textStyle ?? const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}

/// Custom painter for the gradient spinning neon ring.
class _NeonRingPainter extends CustomPainter {
  _NeonRingPainter({
    required this.progress,
    this.strokeWidth = 3,
  });

  final double progress;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Background track — subtle
    final bgPaint = Paint()
      ..color = AppColors.glassBorder
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth / 2;
    canvas.drawCircle(center, radius, bgPaint);

    // Gradient ring
    final gradient = SweepGradient(
      startAngle: -pi / 2,
      endAngle: pi * 2 - pi / 2,
      colors: AppGradients.orbColors,
      stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
    );

    final rect = Rect.fromCircle(center: center, radius: radius);
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw arc from progress position
    final sweepAngle = pi * 1.5; // 270 degrees visible
    final startAngle = -pi / 2 + (progress * pi * 2);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );

    // End cap glow dot
    final dotX = center.dx + radius * cos(startAngle + sweepAngle);
    final dotY = center.dy + radius * sin(startAngle + sweepAngle);
    final dotPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(dotX, dotY), strokeWidth * 1.5, dotPaint);
  }

  @override
  bool shouldRepaint(_NeonRingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

import 'dart:math';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_gradients.dart';
import '../glass_card.dart';

/// ── NeonLoader ──
class NeonLoader extends StatefulWidget {
  final double size;
  final double strokeWidth;
  final String? statusText;
  final TextStyle? textStyle;

  const NeonLoader({
    super.key,
    this.size = 48,
    this.strokeWidth = 3,
    this.statusText,
    this.textStyle,
  });

  @override
  State<NeonLoader> createState() => _NeonLoaderState();
}

class _NeonLoaderState extends State<NeonLoader> with SingleTickerProviderStateMixin {
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

class _NeonRingPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;

  _NeonRingPainter({
    required this.progress,
    this.strokeWidth = 3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final bgPaint = Paint()
      ..color = AppColors.glassBorder
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth / 2;
    canvas.drawCircle(center, radius, bgPaint);

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

    final sweepAngle = pi * 1.5;
    final startAngle = -pi / 2 + (progress * pi * 2);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_NeonRingPainter oldDelegate) => oldDelegate.progress != progress;
}

/// ── GlassLoader ──
class GlassLoader extends StatelessWidget {
  final String? statusText;

  const GlassLoader({super.key, this.statusText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassCard(
        borderRadius: 20,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: NeonLoader(
          statusText: statusText,
          size: 40,
        ),
      ),
    );
  }
}

/// ── PageLoader ──
class PageLoader extends StatelessWidget {
  final String? statusText;

  const PageLoader({super.key, this.statusText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03050A),
      body: Center(
        child: NeonLoader(
          statusText: statusText ?? 'Connecting to neural interface...',
        ),
      ),
    );
  }
}

/// ── ShimmerBox ──
class ShimmerBox extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8.0,
  });

  @override
  State<ShimmerBox> createState() => _ShimmerBoxState();
}

class _ShimmerBoxState extends State<ShimmerBox> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF1E293B).withAlpha(150),
                const Color(0xFF334155).withAlpha(200),
                const Color(0xFF1E293B).withAlpha(150),
              ],
              stops: [
                (_animation.value - 0.5).clamp(0.0, 1.0),
                _animation.value.clamp(0.0, 1.0),
                (_animation.value + 0.5).clamp(0.0, 1.0),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// ── SkeletonCard ──
class SkeletonCard extends StatelessWidget {
  const SkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShimmerBox(width: 140, height: 16),
          const SizedBox(height: 12),
          const ShimmerBox(width: double.infinity, height: 12),
          const SizedBox(height: 6),
          const ShimmerBox(width: 200, height: 12),
        ],
      ),
    );
  }
}

/// ── SkeletonList ──
class SkeletonList extends StatelessWidget {
  final int count;

  const SkeletonList({super.key, this.count = 4});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: count,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 12.0),
          child: SkeletonCard(),
        );
      },
    );
  }
}

/// ── SkeletonProfile ──
class SkeletonProfile extends StatelessWidget {
  const SkeletonProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const ShimmerBox(width: 96, height: 96, borderRadius: 48),
        const SizedBox(height: 16),
        const ShimmerBox(width: 180, height: 20),
        const SizedBox(height: 8),
        const ShimmerBox(width: 120, height: 12),
        const SizedBox(height: 24),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SkeletonCard(),
        ),
      ],
    );
  }
}

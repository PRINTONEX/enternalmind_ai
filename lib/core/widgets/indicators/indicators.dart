import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';

/// ── CircularCompletion ──
class CircularCompletion extends StatelessWidget {
  final double progress;
  final double size;
  final Color color;

  const CircularCompletion({
    super.key,
    required this.progress,
    this.size = 64.0,
    this.color = AppColors.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            backgroundColor: AppColors.deepBlueLight,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            strokeWidth: size * 0.08,
          ),
          Text(
            '${(progress * 100).toInt()}%',
            style: GoogleFonts.orbitron(
              color: Colors.white,
              fontSize: size * 0.22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/// ── LinearCompletion ──
class LinearCompletion extends StatelessWidget {
  final double progress;
  final String label;

  const LinearCompletion({
    super.key,
    required this.progress,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.inter(
                color: AppColors.textSecondary,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${(progress * 100).toInt()}%',
              style: GoogleFonts.orbitron(
                color: AppColors.secondary,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: AppColors.deepBlueLight,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.secondary),
          minHeight: 4,
          borderRadius: BorderRadius.circular(2),
        ),
      ],
    );
  }
}

/// ── NeonProgressBar ──
class NeonProgressBar extends StatelessWidget {
  final double progress;
  final Color startColor;
  final Color endColor;

  const NeonProgressBar({
    super.key,
    required this.progress,
    this.startColor = AppColors.primary,
    this.endColor = AppColors.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.deepBlueLight,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final activeWidth = constraints.maxWidth * progress;
              return Container(
                width: activeWidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [startColor, endColor]),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: endColor.withAlpha(120),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// ── WizardProgress ──
class WizardProgress extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const WizardProgress({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Step $currentStep of $totalSteps',
          style: GoogleFonts.inter(
            color: AppColors.textSecondary,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: List.generate(totalSteps, (index) {
            final isActive = index < currentStep;
            return Container(
              width: index == currentStep - 1 ? 16 : 6,
              height: 6,
              margin: const EdgeInsets.only(left: 4),
              decoration: BoxDecoration(
                color: isActive ? AppColors.secondary : AppColors.deepBlueLight,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}

/// ── StepIndicator ──
class StepIndicator extends StatelessWidget {
  final int activeIndex;
  final int count;

  const StepIndicator({
    super.key,
    required this.activeIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: isActive ? 18 : 6,
          height: 6,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.glassBorderLight,
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}

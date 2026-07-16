import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/ui_constants.dart';

class WizardStepProgress extends StatelessWidget {
  const WizardStepProgress({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.completedSteps = 0,
  });

  final int currentStep;
  final int totalSteps;
  final int completedSteps;

  static const _stepLabels = [
    'Identity',
    'Biography',
    'Family',
    'Education',
    'Review',
  ];

  @override
  Widget build(BuildContext context) {
    final progress = currentStep / (totalSteps - 1);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            // Connector line background (grey)
            Positioned(
              left: 40,
              right: 40,
              top: 16, // Center of dot vertically
              child: Container(
                height: 1.5,
                color: const Color(0xFF1E293B),
              ),
            ),
            // Connector line progress (violet to cyan gradient)
            Positioned(
              left: 40,
              right: 40,
              top: 16, // Center of dot vertically
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 1.5,
                      width: constraints.maxWidth * progress,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Row of steps
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(totalSteps, (index) {
                final isActive = index == currentStep;
                final isCompleted = index < currentStep;

                return Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Step Dot
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCompleted
                              ? const Color(0xFF8B5CF6)
                              : const Color(0xFF090D1A),
                          border: Border.all(
                            color: isActive
                                ? const Color(0xFF8B5CF6)
                                : isCompleted
                                    ? const Color(0xFF8B5CF6)
                                    : const Color(0xFF1E293B),
                            width: isActive ? 2 : 1.5,
                          ),
                          boxShadow: isActive
                              ? [
                                  BoxShadow(
                                    color: const Color(0xFF8B5CF6).withAlpha(80),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                                ]
                              : [],
                        ),
                        child: Center(
                          child: isCompleted
                              ? const Icon(
                                  Icons.check_rounded,
                                  color: Colors.white,
                                  size: 16,
                                )
                              : Text(
                                  '${index + 1}',
                                  style: GoogleFonts.inter(
                                    color: isActive
                                        ? Colors.white
                                        : const Color(0xFF64748B),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: Spacing.sm),
                      // Step Label
                      if (index < _stepLabels.length)
                        Text(
                          _stepLabels[index],
                          style: GoogleFonts.inter(
                            color: (isActive || isCompleted)
                                ? const Color(0xFF8B5CF6)
                                : const Color(0xFF64748B),
                            fontSize: 11,
                            fontWeight: (isActive || isCompleted)
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}

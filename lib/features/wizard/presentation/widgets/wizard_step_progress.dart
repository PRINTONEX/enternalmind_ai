/// {@template wizard_step_progress}
/// Visual step progress indicator for the wizard.
/// {@endtemplate}
library;

import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_gradients.dart';
import '../../../../core/constants/ui_constants.dart';

/// {@macro wizard_step_progress}
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Step dots + labels
        Row(
          children: List.generate(totalSteps, (index) {
            final isActive = index == currentStep;
            final isCompleted = index < completedSteps;
            return Expanded(
              child: GestureDetector(
                onTap: null, // non-interactive for now
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Dot
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: isActive || isCompleted
                            ? AppGradients.neonPurple
                            : null,
                        color: isActive || isCompleted
                            ? null
                            : AppColors.surfaceElevated,
                        border: Border.all(
                          color: isActive
                              ? AppColors.primary
                              : isCompleted
                                  ? AppColors.primary.withAlpha(128)
                                  : AppColors.glassBorder,
                          width: isActive ? 2 : 1.5,
                        ),
                        boxShadow: isActive
                            ? [
                                BoxShadow(
                                  color: AppColors.primary.withAlpha(77),
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                ),
                              ]
                            : [],
                      ),
                      child: Center(
                        child: isCompleted
                            ? const Icon(Icons.check_rounded,
                                color: Colors.white, size: 16)
                            : Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: isActive
                                      ? Colors.white
                                      : AppColors.textSecondary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Label
                    if (index < _stepLabels.length)
                      Text(
                        _stepLabels[index],
                        style: TextStyle(
                          color: isActive
                              ? AppColors.textPrimary
                              : AppColors.textTertiary,
                          fontSize: 10,
                          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
        ),

        // Connecting line
        const SizedBox(height: Spacing.sm),
        Row(
          children: List.generate(totalSteps - 1, (index) {
            return Expanded(
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  gradient: index < completedSteps
                      ? AppGradients.neonPurple
                      : null,
                  color: index < completedSteps
                      ? null
                      : AppColors.glassBorder,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

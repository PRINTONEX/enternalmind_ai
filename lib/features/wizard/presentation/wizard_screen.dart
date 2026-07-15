/// {@template wizard_screen}
/// The main wizard shell that wraps all 5 steps with shared progress UI.
/// {@endtemplate}
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_gradients.dart';
import '../../../core/constants/ui_constants.dart';
import '../../../core/widgets/inputs/gradient_button.dart';
import '../../wizard/providers/wizard_providers.dart';
import '../../wizard/presentation/widgets/wizard_step_progress.dart';
import 'steps/step1_identity.dart';
import 'steps/step2_biography.dart';
import 'steps/step3_family.dart';
import 'steps/step4_education.dart';
import 'steps/step5_review.dart';

/// {@macro wizard_screen}
class WizardScreen extends ConsumerStatefulWidget {
  const WizardScreen({super.key});

  @override
  ConsumerState<WizardScreen> createState() => _WizardScreenState();
}

class _WizardScreenState extends ConsumerState<WizardScreen> {
  final _pageController = PageController();
  late final Map<WizardStep, Widget> _stepWidgets;

  @override
  void initState() {
    super.initState();
    _stepWidgets = {
      WizardStep.identity: const Step1Identity(),
      WizardStep.biography: const Step2Biography(),
      WizardStep.family: const Step3Family(),
      WizardStep.education: const Step4Education(),
      WizardStep.review: const Step5Review(),
    };
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wizard = ref.watch(wizardProvider);
    final currentStep = wizard.currentStep;
    final stepIndex = WizardStep.values.indexOf(currentStep);

    // Sync PageView with step changes — single source of truth for animation.
    ref.listen(wizardProvider, (WizardState? previous, WizardState next) {
      if (previous != null && previous.currentStep != next.currentStep) {
        final newIndex = WizardStep.values.indexOf(next.currentStep);
        _pageController.animateToPage(
          newIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
        );
      }
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppGradients.splashMeshColors,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ── Step Progress ──
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  Spacing.lg,
                  Spacing.lg,
                  Spacing.lg,
                  Spacing.sm,
                ),
                child: WizardStepProgress(
                  currentStep: stepIndex,
                  totalSteps: WizardStep.values.length,
                  completedSteps: wizard.completedSteps.length,
                ),
              ),

              // ── Page Content ──
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: WizardStep.values.map((step) {
                    return _stepWidgets[step]!;
                  }).toList(),
                ),
              ),

              // ── Bottom Bar ──
              _buildBottomBar(currentStep, stepIndex),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(WizardStep currentStep, int stepIndex) {
    final isLastStep = currentStep == WizardStep.review;
    final isFirstStep = currentStep == WizardStep.identity;

    return Container(
      padding: const EdgeInsets.fromLTRB(
        Spacing.lg,
        Spacing.sm,
        Spacing.lg,
        Spacing.lg,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.glassBorder),
        ),
      ),
      child: Row(
        children: [
          // Back button (hidden on first step)
          if (!isFirstStep) ...[
            Expanded(
              child: GradientButton.secondary(
                label: 'Back',
                icon: const Icon(Icons.arrow_back_rounded, size: 18),
                onPressed: () {
                  // Only call the notifier — ref.listen handles page animation.
                  ref.read(wizardProvider.notifier).previousStep();
                },
              ),
            ),
            const SizedBox(width: Spacing.md),
          ],

          // Next / Complete button
          Expanded(
            flex: isFirstStep ? 2 : 1,
            child: GradientButton(
              label: isLastStep ? 'Activate Digital Human' : 'Continue',
              icon: Icon(
                isLastStep
                    ? Icons.rocket_launch_rounded
                    : Icons.arrow_forward_rounded,
                size: 18,
              ),
              onPressed: () {
                if (isLastStep) {
                  ref.read(wizardProvider.notifier).completeWizard();
                } else {
                  // Only call the notifier — ref.listen handles page animation.
                  ref.read(wizardProvider.notifier).nextStep();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// {@template wizard_screen}
/// The main wizard shell that wraps all 5 steps with shared progress UI.
/// {@endtemplate}
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/ui_constants.dart';
import '../../../core/router/route_names.dart';
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
      backgroundColor: const Color(0xFF03050A),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF060913),
              Color(0xFF03050A),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ── Top Header Bar ──
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.lg,
                  vertical: Spacing.md,
                ),
                child: Row(
                  children: [
                    // Back button
                    GestureDetector(
                      onTap: () {
                        if (stepIndex == 0) {
                          context.pop();
                        } else {
                          ref.read(wizardProvider.notifier).previousStep();
                        }
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF0F172A),
                          border: Border.all(
                            color: const Color(0xFF1E293B),
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const Spacer(),
                    // Title & Subtitle
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Create New Replica',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Build your Digital Human step by step',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF64748B),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Import JSON Button
                    GestureDetector(
                      onTap: () => context.push(RouteNames.import),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
                            ),
                          ),
                          padding: const EdgeInsets.all(1.2),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFF0F172A),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.cloud_upload_outlined,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Import JSON',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Step Progress ──
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  Spacing.lg,
                  Spacing.xs,
                  Spacing.lg,
                  Spacing.md,
                ),
                child: WizardStepProgress(
                  currentStep: stepIndex,
                  totalSteps: WizardStep.values.length,
                  completedSteps: wizard.completedSteps.length,
                ),
              ),
              const SizedBox(height: Spacing.sm),

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
            ],
          ),
        ),
      ),
    );
  }
}

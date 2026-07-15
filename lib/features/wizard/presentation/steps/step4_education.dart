/// {@template step4_education}
/// Wizard Step 4 — Education Timeline.
///
/// Add, edit, and delete education records displayed in timeline order.
/// {@endtemplate}
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_gradients.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/widgets/inputs/glass_input.dart';
import '../../../../core/widgets/inputs/gradient_button.dart';
import '../../providers/wizard_providers.dart';
import '../../models/wizard_models.dart';

/// {@macro step4_education}
class Step4Education extends ConsumerWidget {
  const Step4Education({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wizard = ref.watch(wizardProvider);
    final education = wizard.education;

    // Sort by start year descending (most recent first)
    final sorted = List<EducationModel>.from(education)
      ..sort((a, b) => (b.startYear ?? 0).compareTo(a.startYear ?? 0));

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: Spacing.lg),

          // ── Title ──
          Text(
            'Education',
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: Spacing.xs),
          Text(
            'Add your educational background as a timeline.',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: Spacing.xxl),

          // ── Add Education Button ──
          GradientButton.secondary(
            label: 'Add Education',
            icon: const Icon(Icons.school_rounded, size: 18),
            onPressed: () => _showEducationDialog(context, ref, null, -1),
          ),
          const SizedBox(height: Spacing.lg),

          // ── Education Timeline ──
          if (sorted.isEmpty)
            _buildEmptyState()
          else
            ...List.generate(sorted.length, (index) {
              // Find the original index for edit/delete
              final originalIndex = education.indexOf(sorted[index]);
              return _buildTimelineItem(
                context, ref, sorted[index], originalIndex, index == sorted.length - 1,
              );
            }),

          const SizedBox(height: Spacing.xxxl),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(Spacing.xxxl),
      margin: const EdgeInsets.only(top: Spacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard.withAlpha(128),
        borderRadius: BorderRadius.circular(RadiusConstants.md),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Column(
        children: [
          Icon(Icons.school_outlined,
              color: AppColors.textTertiary, size: 48),
          const SizedBox(height: Spacing.md),
          Text(
            'No education records yet',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: Spacing.xs),
          Text(
            'Tap the button above to add your education history.',
            style: const TextStyle(
              color: AppColors.textTertiary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context,
    WidgetRef ref,
    EducationModel edu,
    int index,
    bool isLast,
  ) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline line + dot
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppGradients.neonPurple,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withAlpha(77),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: AppColors.glassBorder,
                    ),
                  ),
              ],
            ),
          ),

          // Content card
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: Spacing.lg),
              padding: const EdgeInsets.all(Spacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surfaceGlass,
                borderRadius: BorderRadius.circular(RadiusConstants.md),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Type badge
                  if (edu.type != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.sm,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withAlpha(26),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        edu.type!,
                        style: const TextStyle(
                          color: AppColors.primaryLight,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  const SizedBox(height: Spacing.sm),

                  // Course / degree
                  if (edu.course != null) ...[
                    Text(
                      edu.course!,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (edu.degree != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        edu.degree!,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ],

                  // School
                  if (edu.school != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      edu.school!,
                      style: const TextStyle(
                        color: AppColors.textTertiary,
                        fontSize: 13,
                      ),
                    ),
                  ],

                  // Years
                  if (edu.startYear != null || edu.endYear != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      '${edu.startYear ?? '?'} — ${edu.endYear ?? 'Present'}',
                      style: const TextStyle(
                        color: AppColors.textTertiary,
                        fontSize: 12,
                      ),
                    ),
                  ],

                  // Achievements
                  if (edu.achievements != null && edu.achievements!.isNotEmpty) ...[
                    const SizedBox(height: Spacing.sm),
                    Text(
                      edu.achievements!,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],

                  // Actions
                  const SizedBox(height: Spacing.sm),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            _showEducationDialog(context, ref, edu, index),
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                            color: AppColors.textLink,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: Spacing.md),
                      GestureDetector(
                        onTap: () {
                          ref.read(wizardProvider.notifier)
                              .removeEducation(index);
                        },
                        child: const Text(
                          'Delete',
                          style: TextStyle(
                            color: AppColors.error,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showEducationDialog(
    BuildContext context,
    WidgetRef ref,
    EducationModel? existing,
    int index,
  ) async {
    final typeCtrl = TextEditingController(text: existing?.type ?? '');
    final courseCtrl = TextEditingController(text: existing?.course ?? '');
    final degreeCtrl = TextEditingController(text: existing?.degree ?? '');
    final schoolCtrl = TextEditingController(text: existing?.school ?? '');
    final achievementsCtrl =
        TextEditingController(text: existing?.achievements ?? '');
    final startYearCtrl =
        TextEditingController(text: existing?.startYear?.toString() ?? '');
    final endYearCtrl =
        TextEditingController(text: existing?.endYear?.toString() ?? '');

    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(Spacing.xxl),
          decoration: BoxDecoration(
            color: AppColors.surfaceCard,
            borderRadius: BorderRadius.circular(RadiusConstants.lg),
            border: Border.all(color: AppColors.glassBorder),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  existing == null ? 'Add Education' : 'Edit Education',
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: Spacing.lg),

                _dialogLabel('Type'),
                const SizedBox(height: Spacing.sm),
                GlassInput(
                  controller: typeCtrl,
                  hintText: 'e.g. School, College, University, Certification',
                ),
                const SizedBox(height: Spacing.md),

                _dialogLabel('Course / Field of Study'),
                const SizedBox(height: Spacing.sm),
                GlassInput(
                  controller: courseCtrl,
                  hintText: 'e.g. Computer Science',
                ),
                const SizedBox(height: Spacing.md),

                _dialogLabel('Degree / Qualification'),
                const SizedBox(height: Spacing.sm),
                GlassInput(
                  controller: degreeCtrl,
                  hintText: 'e.g. Bachelor\'s, Master\'s, Diploma',
                ),
                const SizedBox(height: Spacing.md),

                _dialogLabel('School / Institution'),
                const SizedBox(height: Spacing.sm),
                GlassInput(
                  controller: schoolCtrl,
                  hintText: 'Name of the institution',
                ),
                const SizedBox(height: Spacing.md),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _dialogLabel('Start Year'),
                          const SizedBox(height: Spacing.sm),
                          GlassInput(
                            controller: startYearCtrl,
                            hintText: 'e.g. 2015',
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: Spacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _dialogLabel('End Year'),
                          const SizedBox(height: Spacing.sm),
                          GlassInput(
                            controller: endYearCtrl,
                            hintText: 'e.g. 2019',
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.md),

                _dialogLabel('Achievements (optional)'),
                const SizedBox(height: Spacing.sm),
                GlassInput.multiline(
                  controller: achievementsCtrl,
                  hintText: 'Notable achievements or remarks...',
                  maxLines: 3,
                  minLines: 2,
                ),
                const SizedBox(height: Spacing.lg),

                Row(
                  children: [
                    Expanded(
                      child: GradientButton.secondary(
                        label: 'Cancel',
                        onPressed: () => Navigator.of(ctx).pop(),
                      ),
                    ),
                    const SizedBox(width: Spacing.md),
                    Expanded(
                      child: GradientButton(
                        label: existing == null ? 'Add' : 'Save',
                        onPressed: () {
                          Navigator.of(ctx).pop({
                            'type': typeCtrl.text.trim().isEmpty
                                ? null
                                : typeCtrl.text.trim(),
                            'course': courseCtrl.text.trim().isEmpty
                                ? null
                                : courseCtrl.text.trim(),
                            'degree': degreeCtrl.text.trim().isEmpty
                                ? null
                                : degreeCtrl.text.trim(),
                            'school': schoolCtrl.text.trim().isEmpty
                                ? null
                                : schoolCtrl.text.trim(),
                            'startYear': int.tryParse(startYearCtrl.text.trim()),
                            'endYear': int.tryParse(endYearCtrl.text.trim()),
                            'achievements':
                                achievementsCtrl.text.trim().isEmpty
                                    ? null
                                    : achievementsCtrl.text.trim(),
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    typeCtrl.dispose();
    courseCtrl.dispose();
    degreeCtrl.dispose();
    schoolCtrl.dispose();
    achievementsCtrl.dispose();
    startYearCtrl.dispose();
    endYearCtrl.dispose();

    if (result == null) return;
    final wizard = ref.read(wizardProvider);
    final humanId = wizard.activeProfileId ?? 0;

    if (existing == null) {
      ref.read(wizardProvider.notifier).addEducation(
            EducationModel(
              humanId: humanId,
              type: result['type'] as String?,
              course: result['course'] as String?,
              degree: result['degree'] as String?,
              school: result['school'] as String?,
              startYear: result['startYear'] as int?,
              endYear: result['endYear'] as int?,
              achievements: result['achievements'] as String?,
            ),
          );
    } else {
      ref.read(wizardProvider.notifier).updateEducation(
            index,
            existing.copyWith(
              type: result['type'] as String?,
              course: result['course'] as String?,
              degree: result['degree'] as String?,
              school: result['school'] as String?,
              startYear: result['startYear'] as int?,
              endYear: result['endYear'] as int?,
              achievements: result['achievements'] as String?,
            ),
          );
    }
  }

  Widget _dialogLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

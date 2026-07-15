/// {@template step3_family}
/// Wizard Step 3 — Family.
///
/// Add, edit, and delete family members with full detail.
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

/// {@macro step3_family}
class Step3Family extends ConsumerWidget {
  const Step3Family({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wizard = ref.watch(wizardProvider);
    final members = wizard.familyMembers;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: Spacing.lg),

          // ── Title ──
          Text(
            'Family',
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: Spacing.xs),
          Text(
            'Add family members to build your Digital Human\'s family tree.',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: Spacing.xxl),

          // ── Add Member Button ──
          GradientButton.secondary(
            label: 'Add Family Member',
            icon: const Icon(Icons.person_add_rounded, size: 18),
            onPressed: () => _showMemberDialog(context, ref, null, -1),
          ),
          const SizedBox(height: Spacing.lg),

          // ── Members List ──
          if (members.isEmpty)
            _buildEmptyState()
          else
            ...List.generate(members.length, (index) {
              return _buildMemberCard(context, ref, members[index], index);
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
          Icon(Icons.family_restroom_rounded,
              color: AppColors.textTertiary, size: 48),
          const SizedBox(height: Spacing.md),
          Text(
            'No family members added yet',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: Spacing.xs),
          Text(
            'Tap the button above to add a family member.',
            style: const TextStyle(
              color: AppColors.textTertiary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberCard(
    BuildContext context,
    WidgetRef ref,
    FamilyMemberModel member,
    int index,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.md),
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surfaceGlass,
        borderRadius: BorderRadius.circular(RadiusConstants.md),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppGradients.neonPurple,
            ),
            child: Center(
              child: Text(
                member.name.isNotEmpty
                    ? member.name[0].toUpperCase()
                    : '?',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: Spacing.md),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (member.relationship != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    member.relationship!,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Actions
          IconButton(
            icon: const Icon(Icons.edit_rounded,
                color: AppColors.textTertiary, size: 20),
            onPressed: () =>
                _showMemberDialog(context, ref, member, index),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline_rounded,
                color: AppColors.error, size: 20),
            onPressed: () {
              ref.read(wizardProvider.notifier).removeFamilyMember(index);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showMemberDialog(
    BuildContext context,
    WidgetRef ref,
    FamilyMemberModel? existing,
    int index,
  ) async {
    final nameCtrl = TextEditingController(text: existing?.name ?? '');
    final relationCtrl =
        TextEditingController(text: existing?.relationship ?? '');
    final descriptionCtrl =
        TextEditingController(text: existing?.description ?? '');
    final closeness = ValueNotifier<double>(
      (existing?.closeness ?? 5).toDouble(),
    );

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
                // Title
                Text(
                  existing == null ? 'Add Family Member' : 'Edit Family Member',
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: Spacing.lg),

                // Name
                _dialogLabel('Name'),
                const SizedBox(height: Spacing.sm),
                GlassInput(
                  controller: nameCtrl,
                  hintText: "Member's name",
                ),
                const SizedBox(height: Spacing.md),

                // Relationship
                _dialogLabel('Relationship'),
                const SizedBox(height: Spacing.sm),
                GlassInput(
                  controller: relationCtrl,
                  hintText: 'e.g. Mother, Brother, Friend',
                ),
                const SizedBox(height: Spacing.md),

                // Description
                _dialogLabel('Description (optional)'),
                const SizedBox(height: Spacing.sm),
                GlassInput.multiline(
                  controller: descriptionCtrl,
                  hintText: 'Notes about this person...',
                  maxLines: 3,
                  minLines: 2,
                ),
                const SizedBox(height: Spacing.md),

                // Closeness slider
                _dialogLabel('Closeness'),
                const SizedBox(height: Spacing.sm),
                ValueListenableBuilder<double>(
                  valueListenable: closeness,
                  builder: (context, val, _) {
                    return Column(
                      children: [
                        SliderTheme(
                          data: SliderThemeData(
                            activeTrackColor: AppColors.primary,
                            inactiveTrackColor: AppColors.glassBorder,
                            thumbColor: AppColors.primary,
                            overlayColor: AppColors.primary.withAlpha(26),
                          ),
                          child: Slider(
                            value: val,
                            min: 1,
                            max: 10,
                            divisions: 9,
                            onChanged: (v) => closeness.value = v,
                          ),
                        ),
                        Text(
                          '${val.round()}/10',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: Spacing.lg),

                // Actions
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
                            'name': nameCtrl.text.trim(),
                            'relationship': relationCtrl.text.trim().isEmpty
                                ? null
                                : relationCtrl.text.trim(),
                            'description': descriptionCtrl.text.trim().isEmpty
                                ? null
                                : descriptionCtrl.text.trim(),
                            'closeness': closeness.value.round(),
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

    nameCtrl.dispose();
    relationCtrl.dispose();
    descriptionCtrl.dispose();

    if (result == null) return;
    final wizard = ref.read(wizardProvider);
    final humanId = wizard.activeProfileId ?? 0;

    if (existing == null) {
      ref.read(wizardProvider.notifier).addFamilyMember(
            FamilyMemberModel(
              humanId: humanId,
              name: result['name'] as String,
              relationship: result['relationship'] as String?,
              description: result['description'] as String?,
              closeness: result['closeness'] as int?,
            ),
          );
    } else {
      ref.read(wizardProvider.notifier).updateFamilyMember(
            index,
            existing.copyWith(
              name: result['name'] as String,
              relationship: result['relationship'] as String?,
              description: result['description'] as String?,
              closeness: result['closeness'] as int?,
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

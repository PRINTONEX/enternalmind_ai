/// {@template step5_review}
/// Wizard Step 5 — Review & Activate.
///
/// Shows a dynamic summary of all wizard data and allows final activation.
/// {@endtemplate}
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../providers/wizard_providers.dart';
import '../../models/wizard_models.dart';

/// {@macro step5_review}
class Step5Review extends ConsumerWidget {
  const Step5Review({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wizard = ref.watch(wizardProvider);
    final profile = wizard.profile;
    final family = wizard.familyMembers;
    final education = wizard.education;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: Spacing.lg),

          // ── Title ──
          Text(
            'Review & Activate',
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: Spacing.xs),
          Text(
            'Review your Digital Human profile before activation.',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: Spacing.xxl),

          // ── Identity Summary ──
          _buildSummaryCard(
            'Identity',
            Icons.person_rounded,
            [
              _summaryRow('Full Name', profile.fullName),
              if (profile.nickname != null)
                _summaryRow('Nickname', profile.nickname!),
              if (profile.gender != null)
                _summaryRow('Gender', profile.gender!),
              if (profile.birthDate != null)
                _summaryRow('Date of Birth',
                    '${profile.birthDate!.day}/${profile.birthDate!.month}/${profile.birthDate!.year}'),
              if (profile.birthPlace != null)
                _summaryRow('Birth Place', profile.birthPlace!),
              if (profile.currentCity != null)
                _summaryRow('Current City', profile.currentCity!),
              if (profile.nationality != null)
                _summaryRow('Nationality', profile.nationality!),
              if (profile.occupation != null)
                _summaryRow('Occupation', profile.occupation!),
              if (profile.languages != null)
                _summaryRow('Languages', profile.languages!),
              if (profile.maritalStatus != null)
                _summaryRow('Marital Status', profile.maritalStatus!),
            ],
          ),
          const SizedBox(height: Spacing.md),

          // ── Biography Summary ──
          if (profile.about != null ||
              profile.lifePhilosophy != null ||
              profile.favoriteQuotes != null ||
              profile.hobbies != null)
            _buildSummaryCard(
              'Biography',
              Icons.auto_stories_rounded,
              [
                if (profile.about != null)
                  _summaryRow('About', profile.about!, multiline: true),
                if (profile.lifePhilosophy != null)
                  _summaryRow('Philosophy', profile.lifePhilosophy!,
                      multiline: true),
                if (profile.favoriteQuotes != null)
                  _summaryRow('Favorite Quotes', profile.favoriteQuotes!,
                      multiline: true),
                if (profile.hobbies != null)
                  _summaryRow('Hobbies', profile.hobbies!),
              ],
            ),
          if (profile.about != null ||
              profile.lifePhilosophy != null ||
              profile.favoriteQuotes != null ||
              profile.hobbies != null)
            const SizedBox(height: Spacing.md),

          // ── Family Summary ──
          if (family.isNotEmpty)
            _buildSummaryCard(
              'Family',
              Icons.family_restroom_rounded,
              family.map((m) {
                final details = [
                  if (m.relationship != null) m.relationship!,
                  if (m.closeness != null) 'Closeness: ${m.closeness}/10',
                ].join(' · ');
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    '${m.name}${details.isNotEmpty ? ' — $details' : ''}',
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                );
              }).toList(),
            ),
          if (family.isNotEmpty)
            const SizedBox(height: Spacing.md),

          // ── Education Summary ──
          if (education.isNotEmpty)
            _buildSummaryCard(
              'Education',
              Icons.school_rounded,
              education.map((e) {
                final details = [
                  if (e.course != null) e.course!,
                  if (e.school != null) e.school!,
                  if (e.startYear != null || e.endYear != null)
                    '${e.startYear ?? '?'} — ${e.endYear ?? 'Present'}',
                ].join(' · ');
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    details,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                );
              }).toList(),
            ),
          if (education.isNotEmpty)
            const SizedBox(height: Spacing.md),

          // ── Stats ──
          _buildStatsCard(profile, family.length, education.length),
          const SizedBox(height: Spacing.xxxl),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(
    String title,
    IconData icon,
    List<Widget> rows,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surfaceGlass,
        borderRadius: BorderRadius.circular(RadiusConstants.md),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primaryLight, size: 20),
              const SizedBox(width: Spacing.sm),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: Spacing.md),
          ...rows,
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool multiline = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textTertiary,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
            maxLines: multiline ? 4 : 2,
            overflow: multiline ? TextOverflow.ellipsis : null,
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCard(
    ProfileModel profile,
    int familyCount,
    int educationCount,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withAlpha(26),
            AppColors.secondary.withAlpha(13),
          ],
        ),
        borderRadius: BorderRadius.circular(RadiusConstants.md),
        border: Border.all(
          color: AppColors.primary.withAlpha(51),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _statItem('Fields', '${_countFields(profile)}'),
          _statItem('Family', '$familyCount'),
          _statItem('Education', '$educationCount'),
          _statItem('Storage',
              _estimateStorage(profile, familyCount, educationCount)),
        ],
      ),
    );
  }

  Widget _statItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textTertiary,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  int _countFields(ProfileModel p) {
    int count = 0;
    if (p.fullName.isNotEmpty) count++;
    if (p.nickname != null) count++;
    if (p.gender != null) count++;
    if (p.birthDate != null) count++;
    if (p.birthPlace != null) count++;
    if (p.currentCity != null) count++;
    if (p.nationality != null) count++;
    if (p.religion != null) count++;
    if (p.occupation != null) count++;
    if (p.languages != null) count++;
    if (p.maritalStatus != null) count++;
    if (p.about != null) count++;
    if (p.lifePhilosophy != null) count++;
    if (p.favoriteQuotes != null) count++;
    if (p.hobbies != null) count++;
    return count;
  }

  String _estimateStorage(
      ProfileModel p, int familyCount, int eduCount) {
    int bytes = 0;
    if (p.fullName.isNotEmpty) {
      bytes += p.fullName.length;
    }
    if (p.about != null) {
      bytes += p.about!.length;
    }
    if (p.lifePhilosophy != null) {
      bytes += p.lifePhilosophy!.length;
    }
    bytes += familyCount * 200;
    bytes += eduCount * 300;
    final kb = bytes ~/ 1024;
    return kb < 1 ? '<1 KB' : '$kb KB';
  }
}

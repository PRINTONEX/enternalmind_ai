/// {@template step2_biography}
/// Wizard Step 2 — Biography.
///
/// Fields: about, lifePhilosophy, favoriteQuotes, hobbies, plus extended
/// fields for personality, goals, values stored as structured text.
/// {@endtemplate}
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/widgets/inputs/glass_input.dart';
import '../../../../core/widgets/inputs/gradient_button.dart';
import '../../providers/wizard_providers.dart';

/// {@macro step2_biography}
class Step2Biography extends ConsumerStatefulWidget {
  const Step2Biography({super.key});

  @override
  ConsumerState<Step2Biography> createState() => _Step2BiographyState();
}

class _Step2BiographyState extends ConsumerState<Step2Biography> {
  final _scrollController = ScrollController();

  late TextEditingController _aboutCtrl;
  late TextEditingController _philosophyCtrl;
  late TextEditingController _quotesCtrl;
  late TextEditingController _hobbiesCtrl;
  late TextEditingController _personalityCtrl;
  late TextEditingController _goalsCtrl;
  late TextEditingController _valuesCtrl;

  @override
  void initState() {
    super.initState();
    final p = ref.read(wizardProvider).profile;
    _aboutCtrl = TextEditingController(text: p.about ?? '');
    _philosophyCtrl = TextEditingController(text: p.lifePhilosophy ?? '');
    _quotesCtrl = TextEditingController(text: p.favoriteQuotes ?? '');
    _hobbiesCtrl = TextEditingController(text: p.hobbies ?? '');
    _personalityCtrl = TextEditingController();
    _goalsCtrl = TextEditingController();
    _valuesCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _aboutCtrl.dispose();
    _philosophyCtrl.dispose();
    _quotesCtrl.dispose();
    _hobbiesCtrl.dispose();
    _personalityCtrl.dispose();
    _goalsCtrl.dispose();
    _valuesCtrl.dispose();
    super.dispose();
  }

  void _updateProfile() {
    final p = ref.read(wizardProvider).profile;
    ref.read(wizardProvider.notifier).updateProfile(
          p.copyWith(
            about: _aboutCtrl.text.trim().isEmpty ? null : _aboutCtrl.text.trim(),
            lifePhilosophy: _philosophyCtrl.text.trim().isEmpty
                ? null
                : _philosophyCtrl.text.trim(),
            favoriteQuotes: _quotesCtrl.text.trim().isEmpty
                ? null
                : _quotesCtrl.text.trim(),
            hobbies: _hobbiesCtrl.text.trim().isEmpty
                ? null
                : _hobbiesCtrl.text.trim(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: Spacing.lg),

          // ── Title ──
          Text(
            'Biography',
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: Spacing.xs),
          Text(
            'Define the personality, values, and life story of your Digital Human.',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: Spacing.xxl),

          // ── About Me ──
          _buildLabel('About Me'),
          const SizedBox(height: Spacing.sm),
          GlassInput.multiline(
            controller: _aboutCtrl,
            hintText: 'Tell your story...',
            maxLines: 4,
            minLines: 3,
            onChanged: (_) => _updateProfile(),
          ),
          const SizedBox(height: Spacing.lg),

          // ── Life Philosophy ──
          _buildLabel('Life Philosophy'),
          const SizedBox(height: Spacing.sm),
          GlassInput.multiline(
            controller: _philosophyCtrl,
            hintText: 'What drives you?',
            maxLines: 3,
            minLines: 2,
            onChanged: (_) => _updateProfile(),
          ),
          const SizedBox(height: Spacing.lg),

          // ── Core Values ──
          _buildLabel('Core Values'),
          const SizedBox(height: Spacing.sm),
          GlassInput.multiline(
            controller: _valuesCtrl,
            hintText: 'e.g. Honesty, Compassion, Growth',
            maxLines: 2,
            minLines: 2,
            onChanged: (_) => _updateProfile(),
          ),
          const SizedBox(height: Spacing.lg),

          // ── Personality ──
          _buildLabel('Personality'),
          const SizedBox(height: Spacing.sm),
          GlassInput.multiline(
            controller: _personalityCtrl,
            hintText: 'Describe your personality traits...',
            maxLines: 3,
            minLines: 2,
            onChanged: (_) => _updateProfile(),
          ),
          const SizedBox(height: Spacing.lg),

          // ── Goals & Vision ──
          _buildLabel('Goals & Vision'),
          const SizedBox(height: Spacing.sm),
          GlassInput.multiline(
            controller: _goalsCtrl,
            hintText: 'What are your goals and vision?',
            maxLines: 3,
            minLines: 2,
            onChanged: (_) => _updateProfile(),
          ),
          const SizedBox(height: Spacing.lg),

          // ── Favorite Quotes ──
          _buildLabel('Favorite Quotes'),
          const SizedBox(height: Spacing.sm),
          GlassInput.multiline(
            controller: _quotesCtrl,
            hintText: 'Quotes that inspire you...',
            maxLines: 3,
            minLines: 2,
            onChanged: (_) => _updateProfile(),
          ),
          const SizedBox(height: Spacing.lg),

          // ── Hobbies & Interests ──
          _buildLabel('Hobbies & Interests'),
          const SizedBox(height: Spacing.sm),
          GlassInput.multiline(
            controller: _hobbiesCtrl,
            hintText: 'What do you enjoy?',
            maxLines: 3,
            minLines: 2,
            onChanged: (_) => _updateProfile(),
          ),
          const SizedBox(height: Spacing.lg),

          // ── AI Generate Button ──
          const SizedBox(height: Spacing.md),
          GradientButton.secondary(
            label: 'Generate with AI',
            icon: const Icon(Icons.auto_awesome_rounded, size: 18),
            onPressed: () {
              // Stub for Phase 2 — AI generation
            },
          ),
          const SizedBox(height: Spacing.xxxl),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.3,
      ),
    );
  }
}

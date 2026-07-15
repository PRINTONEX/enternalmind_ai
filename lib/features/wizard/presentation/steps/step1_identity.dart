/// {@template step1_identity}
/// Wizard Step 1 — Digital Identity.
///
/// All Profile schema fields:
/// photoPath, fullName, nickname, birthDate, birthPlace, currentCity,
/// nationality, religion, gender, maritalStatus, occupation, languages.
/// {@endtemplate}
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/widgets/inputs/glass_input.dart';
import '../../providers/wizard_providers.dart';
import '../../models/wizard_models.dart';

/// {@macro step1_identity}
class Step1Identity extends ConsumerStatefulWidget {
  const Step1Identity({super.key});

  @override
  ConsumerState<Step1Identity> createState() => _Step1IdentityState();
}

class _Step1IdentityState extends ConsumerState<Step1Identity> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  late TextEditingController _fullNameCtrl;
  late TextEditingController _nicknameCtrl;
  late TextEditingController _birthPlaceCtrl;
  late TextEditingController _currentCityCtrl;
  late TextEditingController _nationalityCtrl;
  late TextEditingController _religionCtrl;
  late TextEditingController _occupationCtrl;
  late TextEditingController _languagesCtrl;

  @override
  void initState() {
    super.initState();
    final p = ref.read(wizardProvider).profile;
    _fullNameCtrl = TextEditingController(text: p.fullName);
    _nicknameCtrl = TextEditingController(text: p.nickname ?? '');
    _birthPlaceCtrl = TextEditingController(text: p.birthPlace ?? '');
    _currentCityCtrl = TextEditingController(text: p.currentCity ?? '');
    _nationalityCtrl = TextEditingController(text: p.nationality ?? '');
    _religionCtrl = TextEditingController(text: p.religion ?? '');
    _occupationCtrl = TextEditingController(text: p.occupation ?? '');
    _languagesCtrl = TextEditingController(text: p.languages ?? '');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _fullNameCtrl.dispose();
    _nicknameCtrl.dispose();
    _birthPlaceCtrl.dispose();
    _currentCityCtrl.dispose();
    _nationalityCtrl.dispose();
    _religionCtrl.dispose();
    _occupationCtrl.dispose();
    _languagesCtrl.dispose();
    super.dispose();
  }

  void _onFieldChanged() {
    if (!_formKey.currentState!.validate()) return;
    final p = ref.read(wizardProvider).profile;
    ref.read(wizardProvider.notifier).updateProfile(
          p.copyWith(
            fullName: _fullNameCtrl.text.trim(),
            nickname: _nicknameCtrl.text.trim().isEmpty
                ? null
                : _nicknameCtrl.text.trim(),
            birthPlace: _birthPlaceCtrl.text.trim().isEmpty
                ? null
                : _birthPlaceCtrl.text.trim(),
            currentCity: _currentCityCtrl.text.trim().isEmpty
                ? null
                : _currentCityCtrl.text.trim(),
            nationality: _nationalityCtrl.text.trim().isEmpty
                ? null
                : _nationalityCtrl.text.trim(),
            religion: _religionCtrl.text.trim().isEmpty
                ? null
                : _religionCtrl.text.trim(),
            occupation: _occupationCtrl.text.trim().isEmpty
                ? null
                : _occupationCtrl.text.trim(),
            languages: _languagesCtrl.text.trim().isEmpty
                ? null
                : _languagesCtrl.text.trim(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final wizard = ref.watch(wizardProvider);
    final p = wizard.profile;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Spacing.lg),

            // ── Title + Subtitle ──
            Text(
              'Digital Identity',
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: Spacing.xs),
            Text(
              'Tell us about yourself — the core identity of your Digital Human.',
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: Spacing.xxl),

            // ── Full Name (required) ──
            _buildLabel('Full Name *'),
            const SizedBox(height: Spacing.sm),
            GlassInput(
              controller: _fullNameCtrl,
              hintText: 'Enter your full name',
              onChanged: (_) => _onFieldChanged(),
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Full name is required'
                  : null,
            ),
            const SizedBox(height: Spacing.lg),

            // ── Nickname ──
            _buildLabel('Nickname'),
            const SizedBox(height: Spacing.sm),
            GlassInput(
              controller: _nicknameCtrl,
              hintText: 'What should we call you?',
              onChanged: (_) => _onFieldChanged(),
            ),
            const SizedBox(height: Spacing.lg),

            // ── Gender & Birth Date (side by side) ──
            Row(
              children: [
                Expanded(child: _buildGenderDropdown(p)),
                const SizedBox(width: Spacing.md),
                Expanded(child: _buildDateField(p)),
              ],
            ),
            const SizedBox(height: Spacing.lg),

            // ── Birth Place ──
            _buildLabel('Birth Place'),
            const SizedBox(height: Spacing.sm),
            GlassInput(
              controller: _birthPlaceCtrl,
              hintText: 'City, Country',
              onChanged: (_) => _onFieldChanged(),
            ),
            const SizedBox(height: Spacing.lg),

            // ── Current City ──
            _buildLabel('Current City'),
            const SizedBox(height: Spacing.sm),
            GlassInput(
              controller: _currentCityCtrl,
              hintText: 'Where do you live now?',
              onChanged: (_) => _onFieldChanged(),
            ),
            const SizedBox(height: Spacing.lg),

            // ── Nationality & Religion (side by side) ──
            Row(
              children: [
                Expanded(child: _buildNationalityField(p)),
                const SizedBox(width: Spacing.md),
                Expanded(child: _buildReligionField(p)),
              ],
            ),
            const SizedBox(height: Spacing.lg),

            // ── Marital Status ──
            _buildLabel('Marital Status'),
            const SizedBox(height: Spacing.sm),
            _buildMaritalStatusDropdown(p),
            const SizedBox(height: Spacing.lg),

            // ── Occupation ──
            _buildLabel('Occupation'),
            const SizedBox(height: Spacing.sm),
            GlassInput(
              controller: _occupationCtrl,
              hintText: 'Your profession or role',
              onChanged: (_) => _onFieldChanged(),
            ),
            const SizedBox(height: Spacing.lg),

            // ── Languages ──
            _buildLabel('Languages Spoken'),
            const SizedBox(height: Spacing.sm),
            GlassInput(
              controller: _languagesCtrl,
              hintText: 'e.g. English, Spanish, Mandarin',
              onChanged: (_) => _onFieldChanged(),
            ),
            const SizedBox(height: Spacing.xxxl),
          ],
        ),
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

  Widget _buildGenderDropdown(ProfileModel p) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel('Gender'),
        const SizedBox(height: Spacing.sm),
        DropdownButtonFormField<String>(
          initialValue: p.gender,
          decoration: _dropdownDecoration(),
          dropdownColor: AppColors.surfaceCard,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
          items: const [
            DropdownMenuItem(value: null, child: Text('Select')),
            DropdownMenuItem(value: 'Male', child: Text('Male')),
            DropdownMenuItem(value: 'Female', child: Text('Female')),
            DropdownMenuItem(value: 'Non-binary', child: Text('Non-binary')),
            DropdownMenuItem(value: 'Prefer not to say', child: Text('Prefer not to say')),
          ],
          onChanged: (v) {
            ref.read(wizardProvider.notifier).updateProfile(
                  p.copyWith(gender: v),
                );
          },
        ),
      ],
    );
  }

  Widget _buildDateField(ProfileModel p) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel('Date of Birth'),
        const SizedBox(height: Spacing.sm),
        GestureDetector(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: p.birthDate ?? DateTime(1990),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              builder: (context, child) {
                return Theme(
                  data: ThemeData.dark().copyWith(
                    colorScheme: const ColorScheme.dark(
                      primary: Color(0xFF7C3AED),
                      surface: Color(0xFF1A1F33),
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (date != null) {
              ref.read(wizardProvider.notifier).updateProfile(
                    p.copyWith(birthDate: date),
                  );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.lg,
              vertical: Spacing.md,
            ),
            decoration: BoxDecoration(
              color: AppColors.surfaceInput,
              borderRadius: BorderRadius.circular(RadiusConstants.sm),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today_rounded,
                    color: AppColors.textTertiary, size: 16),
                const SizedBox(width: Spacing.sm),
                Text(
                  p.birthDate != null
                      ? '${p.birthDate!.day}/${p.birthDate!.month}/${p.birthDate!.year}'
                      : 'Select date',
                  style: TextStyle(
                    color: p.birthDate != null
                        ? AppColors.textPrimary
                        : AppColors.textTertiary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNationalityField(ProfileModel p) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel('Nationality'),
        const SizedBox(height: Spacing.sm),
        GlassInput(
          controller: _nationalityCtrl,
          hintText: 'e.g. American',
          onChanged: (_) => _onFieldChanged(),
        ),
      ],
    );
  }

  Widget _buildReligionField(ProfileModel p) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel('Religion'),
        const SizedBox(height: Spacing.sm),
        GlassInput(
          controller: _religionCtrl,
          hintText: 'Optional',
          onChanged: (_) => _onFieldChanged(),
        ),
      ],
    );
  }

  Widget _buildMaritalStatusDropdown(ProfileModel p) {
    return DropdownButtonFormField<String>(
      value: p.maritalStatus,
      decoration: _dropdownDecoration(),
      dropdownColor: AppColors.surfaceCard,
      style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
      items: const [
        DropdownMenuItem(value: null, child: Text('Select')),
        DropdownMenuItem(value: 'Single', child: Text('Single')),
        DropdownMenuItem(value: 'Married', child: Text('Married')),
        DropdownMenuItem(value: 'Divorced', child: Text('Divorced')),
        DropdownMenuItem(value: 'Widowed', child: Text('Widowed')),
        DropdownMenuItem(value: 'In a relationship', child: Text('In a relationship')),
      ],
      onChanged: (v) {
        ref.read(wizardProvider.notifier).updateProfile(
              p.copyWith(maritalStatus: v),
            );
      },
    );
  }

  InputDecoration _dropdownDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.surfaceInput,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusConstants.sm),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusConstants.sm),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.2),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: Spacing.lg,
        vertical: Spacing.md,
      ),
    );
  }
}

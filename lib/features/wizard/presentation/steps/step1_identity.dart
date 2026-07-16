import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_selector/file_selector.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../providers/wizard_providers.dart';
import '../../models/wizard_models.dart';

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

  Future<void> _pickProfilePhoto() async {
    try {
      final XFile? file = await openFile(
        acceptedTypeGroups: <XTypeGroup>[
          const XTypeGroup(
            label: 'images',
            extensions: <String>['jpg', 'jpeg', 'png'],
          ),
        ],
      );
      if (file != null) {
        final p = ref.read(wizardProvider).profile;
        ref.read(wizardProvider.notifier).updateProfile(
              p.copyWith(photoPath: file.path),
            );
      }
    } catch (e) {
      debugPrint('Error picking profile photo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final wizard = ref.watch(wizardProvider);
    final p = wizard.profile;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          // ── Scrollable Card Content ──
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.lg,
                vertical: Spacing.xs,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF070B14),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF1E293B),
                    width: 1.2,
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Step header (Step 1 of 5, Digital Identity...)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xFF8B5CF6).withAlpha(30),
                                    ),
                                    child: const Icon(
                                      Icons.person_outline_rounded,
                                      color: Color(0xFF8B5CF6),
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Step 1 of 5',
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFF8B5CF6),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Digital Identity',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "Let's start with the basic information about you.",
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF64748B),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Hologram Circle
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                const Color(0xFF8B5CF6).withAlpha(40),
                                Colors.transparent,
                              ],
                              radius: 0.6,
                            ),
                          ),
                          child: Center(
                            child: ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
                              ).createShader(bounds),
                              child: const Icon(
                                Icons.accessibility_new_rounded,
                                color: Colors.white,
                                size: 44,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    const Divider(color: Color(0xFF1E293B), height: 1),
                    const SizedBox(height: 20),

                    // Profile Photo
                    _buildProfilePhotoSection(p),

                    const SizedBox(height: 20),

                    // Full Name + Nickname
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextFormField(
                            controller: _fullNameCtrl,
                            label: 'Full Name',
                            hintText: 'Aftab Shah',
                            isRequired: true,
                            onChanged: (_) => _onFieldChanged(),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildTextFormField(
                            controller: _nicknameCtrl,
                            label: 'Nickname',
                            hintText: 'Aftab',
                            onChanged: (_) => _onFieldChanged(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Gender + Birth Date
                    Row(
                      children: [
                        Expanded(child: _buildGenderDropdown(p)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildDateField(p)),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Birth Place + Current City
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextFormField(
                            controller: _birthPlaceCtrl,
                            label: 'Birth Place',
                            hintText: 'Phoudel',
                            prefixIcon: const Icon(Icons.location_on_outlined, color: Color(0xFF64748B), size: 18),
                            onChanged: (_) => _onFieldChanged(),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildTextFormField(
                            controller: _currentCityCtrl,
                            label: 'Current City',
                            hintText: 'Thoubal',
                            prefixIcon: const Icon(Icons.location_on_outlined, color: Color(0xFF64748B), size: 18),
                            onChanged: (_) => _onFieldChanged(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Nationality (Dropdown/Text)
                    _buildNationalityField(p),
                    const SizedBox(height: 16),

                    // Religion + Marital Status
                    Row(
                      children: [
                        Expanded(child: _buildReligionField(p)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildMaritalStatusDropdown(p)),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Languages Spoken
                    _buildLanguagesField(p),
                    const SizedBox(height: 16),

                    // Occupation
                    _buildOccupationField(p),
                  ],
                ),
              ),
            ),
          ),

          // ── Bottom Navigation Bar ──
          _buildBottomBar(wizard),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required Widget child,
    Widget? prefixIcon,
    bool isRequired = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF1E293B),
          width: 1.2,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  color: const Color(0xFF64748B),
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isRequired) ...[
                const SizedBox(width: 4),
                const Text(
                  '*',
                  style: TextStyle(
                    color: Color(0xFFEF4444),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              if (prefixIcon != null) ...[
                prefixIcon,
                const SizedBox(width: 12),
              ],
              Expanded(child: child),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    bool isRequired = false,
    Widget? prefixIcon,
    FormFieldValidator<String>? validator,
    void Function(String)? onChanged,
  }) {
    return _buildInputField(
      label: label,
      isRequired: isRequired,
      prefixIcon: prefixIcon,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.inter(
            color: const Color(0xFF475569),
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          isDense: true,
        ),
      ),
    );
  }

  Widget _buildDropdownFormField<T>({
    required T? value,
    required String label,
    required List<DropdownMenuItem<T>> items,
    required ValueChanged<T?> onChanged,
    Widget? prefixIcon,
  }) {
    return _buildInputField(
      label: label,
      prefixIcon: prefixIcon,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          dropdownColor: const Color(0xFF0F172A),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Color(0xFF64748B),
            size: 20,
          ),
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            isDense: true,
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePhotoSection(ProfileModel p) {
    final photoPath = p.photoPath;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          GestureDetector(
            onTap: _pickProfilePhoto,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: const EdgeInsets.all(2.5),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF090D1A),
                    ),
                    child: photoPath != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(45),
                            child: Image.file(
                              File(photoPath),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Color(0xFF64748B),
                                    size: 28,
                                  ),
                                );
                              },
                            ),
                          )
                        : const Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Color(0xFF64748B),
                              size: 28,
                            ),
                          ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF00E5FF),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add_rounded,
                        color: Color(0xFF090D1A),
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profile Photo',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Upload a clear photo of yourself',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF64748B),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: _pickProfilePhoto,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFF00E5FF).withAlpha(120),
                        width: 1.2,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.cloud_upload_outlined,
                          color: Color(0xFF00E5FF),
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Upload Photo',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF00E5FF),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

  Widget _buildGenderDropdown(ProfileModel p) {
    return _buildDropdownFormField<String>(
      value: p.gender,
      label: 'Gender',
      prefixIcon: const Icon(Icons.wc_rounded, color: Color(0xFF64748B), size: 18),
      items: const [
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
    );
  }

  Widget _buildDateField(ProfileModel p) {
    return GestureDetector(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: p.birthDate ?? DateTime(1997, 12, 4),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: ThemeData.dark().copyWith(
                colorScheme: const ColorScheme.dark(
                  primary: Color(0xFF8B5CF6),
                  surface: Color(0xFF10141D),
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
      child: _buildInputField(
        label: 'Birth Date',
        prefixIcon: const Icon(Icons.calendar_today_rounded, color: Color(0xFF64748B), size: 18),
        child: Row(
          children: [
            Text(
              p.birthDate != null
                  ? '${p.birthDate!.day.toString().padLeft(2, '0')} ${_getMonthName(p.birthDate!.month)} ${p.birthDate!.year}'
                  : '04 Dec 1997',
              style: GoogleFonts.inter(
                color: p.birthDate != null ? Colors.white : const Color(0xFF475569),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color(0xFF64748B),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  Widget _buildNationalityField(ProfileModel p) {
    return _buildTextFormField(
      controller: _nationalityCtrl,
      label: 'Nationality',
      hintText: 'Indian',
      prefixIcon: const Icon(Icons.flag_outlined, color: Color(0xFF64748B), size: 18),
      onChanged: (_) => _onFieldChanged(),
    );
  }

  Widget _buildReligionField(ProfileModel p) {
    return _buildTextFormField(
      controller: _religionCtrl,
      label: 'Religion',
      hintText: 'Muslim',
      prefixIcon: const Icon(Icons.nights_stay_outlined, color: Color(0xFF64748B), size: 18),
      onChanged: (_) => _onFieldChanged(),
    );
  }

  Widget _buildMaritalStatusDropdown(ProfileModel p) {
    return _buildDropdownFormField<String>(
      value: p.maritalStatus,
      label: 'Marital Status',
      prefixIcon: const Icon(Icons.favorite_outline_rounded, color: Color(0xFF64748B), size: 18),
      items: const [
        DropdownMenuItem(value: 'Single', child: Text('Single')),
        DropdownMenuItem(value: 'Married', child: Text('Married')),
        DropdownMenuItem(value: 'Divorced', child: Text('Divorced')),
        DropdownMenuItem(value: 'Widowed', child: Text('Widowed')),
      ],
      onChanged: (v) {
        ref.read(wizardProvider.notifier).updateProfile(
              p.copyWith(maritalStatus: v),
            );
      },
    );
  }

  Widget _buildLanguagesField(ProfileModel p) {
    return _buildTextFormField(
      controller: _languagesCtrl,
      label: 'Languages',
      hintText: 'Manipuri, English, Hindi',
      prefixIcon: const Icon(Icons.language_rounded, color: Color(0xFF64748B), size: 18),
      onChanged: (_) => _onFieldChanged(),
    );
  }

  Widget _buildOccupationField(ProfileModel p) {
    return _buildTextFormField(
      controller: _occupationCtrl,
      label: 'Occupation',
      hintText: 'Founder & CEO - Kanglei Innovations, Software Engineer',
      prefixIcon: const Icon(Icons.work_outline_rounded, color: Color(0xFF64748B), size: 18),
      onChanged: (_) => _onFieldChanged(),
    );
  }

  Widget _buildBottomBar(WizardState wizard) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        Spacing.lg,
        Spacing.sm,
        Spacing.lg,
        Spacing.lg,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF03050A),
        border: Border(
          top: BorderSide(color: Color(0xFF1E293B), width: 1),
        ),
      ),
      child: Row(
        children: [
          Row(
            children: [
              const Icon(
                Icons.shield_outlined,
                color: Color(0xFF10B981),
                size: 20,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Auto-saved',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF10B981),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Just now',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF64748B),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ref.read(wizardProvider.notifier).nextStep();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Next Step',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

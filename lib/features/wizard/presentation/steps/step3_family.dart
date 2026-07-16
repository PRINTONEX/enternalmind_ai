import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/ui_constants.dart';
import '../../providers/wizard_providers.dart';
import '../../models/wizard_models.dart';

class Step3Family extends ConsumerStatefulWidget {
  const Step3Family({super.key});

  @override
  ConsumerState<Step3Family> createState() => _Step3FamilyState();
}

class _Step3FamilyState extends ConsumerState<Step3Family> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wizard = ref.watch(wizardProvider);
    final members = wizard.familyMembers;

    // Default mock data matching the screenshot if the list is empty (to make it a 100% replica on first view)
    final displayMembers = members.isNotEmpty
        ? members
        : <FamilyMemberModel>[
            FamilyMemberModel(
              humanId: wizard.activeProfileId ?? 0,
              name: 'Shahbuddin',
              relationship: 'Father',
              birthYear: 1973,
              closeness: 3,
              gender: 'Male',
            ),
            FamilyMemberModel(
              humanId: wizard.activeProfileId ?? 0,
              name: 'Najima Bibi',
              relationship: 'Mother',
              birthYear: 1980,
              closeness: 3,
              gender: 'Female',
            ),
            FamilyMemberModel(
              humanId: wizard.activeProfileId ?? 0,
              name: 'Chesam Safia',
              relationship: 'Wife',
              birthYear: 2001,
              closeness: 3,
              gender: 'Female',
            ),
            FamilyMemberModel(
              humanId: wizard.activeProfileId ?? 0,
              name: 'Armaan Shah',
              relationship: 'Son',
              birthYear: 2022,
              closeness: 3,
              gender: 'Male',
            ),
            FamilyMemberModel(
              humanId: wizard.activeProfileId ?? 0,
              name: 'Yusuf Shah',
              relationship: 'Son',
              birthYear: 2024,
              closeness: 3,
              gender: 'Male',
            ),
            FamilyMemberModel(
              humanId: wizard.activeProfileId ?? 0,
              name: 'Shadam Shah',
              relationship: 'Brother',
              birthYear: 1997,
              closeness: 3,
              gender: 'Male',
            ),
            FamilyMemberModel(
              humanId: wizard.activeProfileId ?? 0,
              name: 'Md Sheid Shah',
              relationship: 'Brother',
              birthYear: 2003,
              closeness: 3,
              gender: 'Male',
            ),
          ];

    return Column(
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
                  // Step header (Step 3 of 5, Family & Relationships...)
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
                                    Icons.people_alt_outlined,
                                    color: Color(0xFF8B5CF6),
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Step 3 of 5',
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
                              'Family & Relationships',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Add the important people in your life. Your AI will understand your relationships and bonds.',
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
                              Icons.diversity_3_rounded,
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

                  // Section Title and Add Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Family',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _showMemberDialog(context, ref, null, -1),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFF00E5FF).withAlpha(120),
                              width: 1.2,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.add_rounded,
                                color: Color(0xFF00E5FF),
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Add Family Member',
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
                  const SizedBox(height: 16),

                  // Family List
                  ...List.generate(displayMembers.length, (index) {
                    return _buildFamilyCard(context, ref, displayMembers[index], index, members.isNotEmpty);
                  }),

                  const SizedBox(height: 16),

                  // Tip Banner
                  _buildTipBanner(),
                ],
              ),
            ),
          ),
        ),

        // ── Bottom Navigation Bar ──
        _buildBottomBar(),
      ],
    );
  }

  Widget _buildFamilyCard(
    BuildContext context,
    WidgetRef ref,
    FamilyMemberModel member,
    int index,
    bool isRealData,
  ) {
    // Relationship tag color
    final relation = member.relationship?.toLowerCase() ?? '';
    Color tagColor = const Color(0xFF8B5CF6); // default purple
    Color avatarBorderColor = const Color(0xFF8B5CF6);
    IconData avatarIcon = Icons.person_rounded;

    if (relation.contains('father')) {
      tagColor = const Color(0xFF3B82F6);
      avatarBorderColor = const Color(0xFF3B82F6);
      avatarIcon = Icons.person_rounded;
    } else if (relation.contains('mother')) {
      tagColor = const Color(0xFFEC4899);
      avatarBorderColor = const Color(0xFFEC4899);
      avatarIcon = Icons.person_2_rounded;
    } else if (relation.contains('wife') || relation.contains('daughter')) {
      tagColor = const Color(0xFF00E5FF);
      avatarBorderColor = const Color(0xFF00E5FF);
      avatarIcon = Icons.person_2_rounded;
    } else if (relation.contains('son') || relation.contains('child')) {
      tagColor = const Color(0xFFF59E0B);
      avatarBorderColor = const Color(0xFFF59E0B);
      avatarIcon = Icons.child_care_rounded;
    } else if (relation.contains('brother') || relation.contains('sibling')) {
      tagColor = const Color(0xFF6366F1);
      avatarBorderColor = const Color(0xFF6366F1);
      avatarIcon = Icons.person_rounded;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
      ),
      child: Row(
        children: [
          // Circular avatar
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: avatarBorderColor, width: 1.5),
              color: avatarBorderColor.withAlpha(20),
            ),
            child: Center(
              child: Icon(
                avatarIcon,
                color: avatarBorderColor,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      member.name,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: tagColor.withAlpha(30),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      child: Text(
                        member.relationship ?? 'Family',
                        style: GoogleFonts.inter(
                          color: tagColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_rounded, color: Color(0xFF64748B), size: 12),
                    const SizedBox(width: 4),
                    Text(
                      member.birthYear != null ? 'Born: ${member.birthYear}' : 'Born: N/A',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF64748B),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Closeness: ',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF64748B),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // Closeness hearts rating
                    Row(
                      children: List.generate(8, (hIndex) {
                        final closeness = member.closeness ?? 5;
                        final filledCount = (closeness / 10.0 * 8.0).round().clamp(1, 8);
                        final isFilled = hIndex < filledCount;
                        return Icon(
                          Icons.favorite_rounded,
                          color: isFilled ? const Color(0xFFEC4899) : const Color(0xFF1E293B),
                          size: 11,
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Actions
          GestureDetector(
            onTap: () => _showMemberDialog(context, ref, member, isRealData ? index : -1),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF3B82F6).withAlpha(120), width: 1.2),
              ),
              child: const Icon(Icons.edit_outlined, color: Color(0xFF3B82F6), size: 16),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              if (isRealData) {
                ref.read(wizardProvider.notifier).removeFamilyMember(index);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cannot delete mock data. Add a real member to start managing.')),
                );
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFEF4444).withAlpha(120), width: 1.2),
              ),
              child: const Icon(Icons.delete_outline_rounded, color: Color(0xFFEF4444), size: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipBanner() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0B0D16),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF8B5CF6).withAlpha(80), width: 1.2),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF8B5CF6).withAlpha(20),
            ),
            child: const Center(
              child: Icon(
                Icons.favorite_outline_rounded,
                color: Color(0xFF8B5CF6),
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Tip: Add as many family members as you want.\nThis helps your AI understand your emotional world better.',
              style: GoogleFonts.inter(
                color: const Color(0xFF8B5CF6),
                fontSize: 11,
                height: 1.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
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
          // Previous Step
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                ref.read(wizardProvider.notifier).previousStep();
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF1E293B), width: 1.2),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_back_rounded,
                    color: Color(0xFF64748B),
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Previous Step',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF94A3B8),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Next Step
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  ref.read(wizardProvider.notifier).nextStep();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
    final relationCtrl = TextEditingController(text: existing?.relationship ?? '');
    final birthYearCtrl = TextEditingController(text: existing?.birthYear != null ? existing!.birthYear.toString() : '');
    final closeness = ValueNotifier<double>((existing?.closeness ?? 5).toDouble());

    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  existing == null ? 'Add Family Member' : 'Edit Family Member',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                _dialogLabel('Name'),
                const SizedBox(height: 6),
                _dialogTextField(controller: nameCtrl, hint: "Member's name"),
                const SizedBox(height: 12),

                _dialogLabel('Relationship'),
                const SizedBox(height: 6),
                _dialogTextField(controller: relationCtrl, hint: 'e.g. Father, Mother, Wife'),
                const SizedBox(height: 12),

                _dialogLabel('Birth Year'),
                const SizedBox(height: 6),
                _dialogTextField(
                  controller: birthYearCtrl,
                  hint: 'e.g. 1973',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),

                _dialogLabel('Closeness'),
                const SizedBox(height: 6),
                ValueListenableBuilder<double>(
                  valueListenable: closeness,
                  builder: (context, val, _) {
                    return Column(
                      children: [
                        SliderTheme(
                          data: SliderThemeData(
                            activeTrackColor: const Color(0xFF8B5CF6),
                            inactiveTrackColor: const Color(0xFF1E293B),
                            thumbColor: const Color(0xFF8B5CF6),
                            overlayColor: const Color(0xFF8B5CF6).withAlpha(26),
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
                          style: GoogleFonts.inter(
                            color: const Color(0xFF64748B),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF1E293B)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text('Cancel', style: GoogleFonts.inter(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(ctx).pop({
                              'name': nameCtrl.text.trim(),
                              'relationship': relationCtrl.text.trim().isEmpty ? null : relationCtrl.text.trim(),
                              'birthYear': int.tryParse(birthYearCtrl.text.trim()),
                              'closeness': closeness.value.round(),
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text(existing == null ? 'Add' : 'Save', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
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
    birthYearCtrl.dispose();

    if (result == null) return;
    final wizard = ref.read(wizardProvider);
    final humanId = wizard.activeProfileId ?? 0;

    final newMember = FamilyMemberModel(
      humanId: humanId,
      name: result['name'] as String,
      relationship: result['relationship'] as String?,
      birthYear: result['birthYear'] as int?,
      closeness: result['closeness'] as int?,
    );

    if (existing == null || index == -1) {
      ref.read(wizardProvider.notifier).addFamilyMember(newMember);
    } else {
      ref.read(wizardProvider.notifier).updateFamilyMember(
            index,
            existing.copyWith(
              name: result['name'] as String,
              relationship: result['relationship'] as String?,
              birthYear: result['birthYear'] as int?,
              closeness: result['closeness'] as int?,
            ),
          );
    }
  }

  Widget _dialogLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: const Color(0xFF64748B),
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _dialogTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.inter(color: const Color(0xFF475569)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

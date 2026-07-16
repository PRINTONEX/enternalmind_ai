import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/ui_constants.dart';
import '../../providers/wizard_providers.dart';
import '../../models/wizard_models.dart';

class Step4Education extends ConsumerStatefulWidget {
  const Step4Education({super.key});

  @override
  ConsumerState<Step4Education> createState() => _Step4EducationState();
}

class _Step4EducationState extends ConsumerState<Step4Education> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wizard = ref.watch(wizardProvider);
    final education = wizard.education;

    // Sort by start year descending
    final sorted = List<EducationModel>.from(education)
      ..sort((a, b) => (b.startYear ?? 0).compareTo(a.startYear ?? 0));

    // Default mock data matching the screenshot if the list is empty (to make it a 100% replica on first view)
    final displayEducation = sorted.isNotEmpty
        ? sorted
        : <EducationModel>[
            EducationModel(
              humanId: wizard.activeProfileId ?? 0,
              type: 'College',
              course: 'Computer',
              degree: 'BCA',
              school: 'Kanglei University',
              startYear: 2017,
              endYear: 2019,
              achievements: '80%',
            ),
            EducationModel(
              humanId: wizard.activeProfileId ?? 0,
              type: 'School',
              course: 'Physics, Maths',
              degree: 'HSE',
              school: 'Thoubal High School',
              startYear: 2013,
              endYear: 2015,
              achievements: '60%',
            ),
            EducationModel(
              humanId: wizard.activeProfileId ?? 0,
              type: 'School',
              course: 'Sceince Math English Compuetr',
              degree: 'HSLC',
              school: 'Thoubal Primary School',
              startYear: 2013,
              endYear: 2013,
              achievements: '50%',
            ),
          ];

    // Calculate Stats
    final recordCount = sorted.isNotEmpty ? sorted.length : 3;
    final certsCount = sorted.isNotEmpty
        ? sorted.where((e) => e.type?.toLowerCase() == 'certification').length
        : 1;
    final achievementsCount = sorted.isNotEmpty
        ? sorted.where((e) => e.achievements != null && e.achievements!.isNotEmpty).length
        : 0;
    int yearsCount = 0;
    if (sorted.isNotEmpty) {
      for (final edu in sorted) {
        if (edu.startYear != null && edu.endYear != null) {
          yearsCount += (edu.endYear! - edu.startYear!).abs();
        }
      }
    } else {
      yearsCount = 6;
    }

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
                  // Step header (Step 4 of 5, Education & Learning...)
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
                                    Icons.school_outlined,
                                    color: Color(0xFF8B5CF6),
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Step 4 of 5',
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
                              'Education & Learning',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Add your academic background, courses, certifications and achievements.',
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
                      // Hologram Circle (Grad Cap)
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
                              Icons.school_rounded,
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
                        'Education Timeline',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _showEducationDialog(context, ref, null, -1),
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
                                'Add Education',
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
                  const SizedBox(height: 20),

                  // Timeline List
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: displayEducation.length,
                    itemBuilder: (context, index) {
                      final item = displayEducation[index];
                      final isLast = index == displayEducation.length - 1;
                      final originalIndex = education.indexOf(item);
                      return _buildTimelineItem(context, ref, item, originalIndex, index, isLast, education.isNotEmpty);
                    },
                  ),

                  const SizedBox(height: 20),

                  // Stats Row
                  _buildStatsRow(recordCount, certsCount, achievementsCount, yearsCount),

                  const SizedBox(height: 20),

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

  Widget _buildTimelineItem(
    BuildContext context,
    WidgetRef ref,
    EducationModel edu,
    int originalIndex,
    int index,
    bool isLast,
    bool isRealData,
  ) {
    final isCollege = edu.type?.toLowerCase() == 'college' || edu.type?.toLowerCase() == 'university';
    final nodeColor = isCollege ? const Color(0xFF00E5FF) : const Color(0xFF8B5CF6);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left Date Column
          SizedBox(
            width: 48,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${edu.startYear ?? ''}',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF8B5CF6),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '—',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF64748B),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${edu.endYear ?? 'Present'}',
                  style: GoogleFonts.inter(
                    color: isCollege ? const Color(0xFF00E5FF) : const Color(0xFF8B5CF6),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Middle Timeline Line and Dot
          SizedBox(
            width: 24,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (!isLast)
                  Positioned(
                    top: 12,
                    bottom: 0,
                    child: Container(
                      width: 1.5,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                if (index > 0)
                  Positioned(
                    top: 0,
                    bottom: 12,
                    child: Container(
                      width: 1.5,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                Positioned(
                  top: 20,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF070B14),
                      border: Border.all(color: nodeColor, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: nodeColor.withAlpha(50),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Right Card Content
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF090D1A),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
              ),
              child: Row(
                children: [
                  // School/College icon square
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: nodeColor.withAlpha(20),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        isCollege ? Icons.account_balance_rounded : Icons.school_rounded,
                        color: nodeColor,
                        size: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Text content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: nodeColor.withAlpha(30),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          child: Text(
                            edu.type ?? 'School',
                            style: GoogleFonts.inter(
                              color: nodeColor,
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          edu.course ?? 'General Study',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Degree: ${edu.degree ?? 'None'}',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF94A3B8),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Achievement: ${edu.achievements ?? 'N/A'}',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF64748B),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Actions
                  GestureDetector(
                    onTap: () => _showEducationDialog(context, ref, edu, isRealData ? originalIndex : -1),
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: const Color(0xFF3B82F6).withAlpha(120), width: 1),
                      ),
                      child: const Icon(Icons.edit_outlined, color: Color(0xFF3B82F6), size: 14),
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      if (isRealData) {
                        ref.read(wizardProvider.notifier).removeEducation(originalIndex);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Cannot delete mock data. Add a real education entry to manage.')),
                        );
                      }
                    },
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: const Color(0xFFEF4444).withAlpha(120), width: 1),
                      ),
                      child: const Icon(Icons.delete_outline_rounded, color: Color(0xFFEF4444), size: 14),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.drag_indicator_rounded, color: Color(0xFF334155), size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow(int records, int certs, int achievements, int years) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatCard(Icons.school_rounded, '$records', 'Education Records', const Color(0xFF8B5CF6)),
          _buildStatCard(Icons.verified_outlined, '$certs', 'Certifications', const Color(0xFF3B82F6)),
          _buildStatCard(Icons.emoji_events_outlined, '$achievements', 'Achievements', const Color(0xFF10B981)),
          _buildStatCard(Icons.calendar_today_rounded, '$years', 'Years of Education', const Color(0xFFEC4899)),
        ],
      ),
    );
  }

  Widget _buildStatCard(IconData icon, String count, String label, Color color) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withAlpha(20),
            ),
            child: Icon(icon, color: color, size: 16),
          ),
          const SizedBox(height: 6),
          Text(
            count,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: const Color(0xFF64748B),
              fontSize: 9,
              fontWeight: FontWeight.w500,
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
        border: Border.all(color: const Color(0xFF00E5FF).withAlpha(80), width: 1.2),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          const Icon(
            Icons.lightbulb_outline_rounded,
            color: Color(0xFF00E5FF),
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Tip: Add your courses, certifications, online learning and achievements. This helps your AI understand your knowledge and expertise better.',
              style: GoogleFonts.inter(
                color: const Color(0xFF00E5FF),
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
    final achievementsCtrl = TextEditingController(text: existing?.achievements ?? '');
    final startYearCtrl = TextEditingController(text: existing?.startYear?.toString() ?? '');
    final endYearCtrl = TextEditingController(text: existing?.endYear?.toString() ?? '');

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
                  existing == null ? 'Add Education' : 'Edit Education',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                _dialogLabel('Type'),
                const SizedBox(height: 6),
                _dialogTextField(controller: typeCtrl, hint: 'e.g. School, College, University'),
                const SizedBox(height: 12),

                _dialogLabel('Course / Field of Study'),
                const SizedBox(height: 6),
                _dialogTextField(controller: courseCtrl, hint: 'e.g. Science, Computer, Mathematics'),
                const SizedBox(height: 12),

                _dialogLabel('Degree / Qualification'),
                const SizedBox(height: 6),
                _dialogTextField(controller: degreeCtrl, hint: 'e.g. HSLC, HSE, BCA, B.Sc'),
                const SizedBox(height: 12),

                _dialogLabel('School / Institution'),
                const SizedBox(height: 6),
                _dialogTextField(controller: schoolCtrl, hint: 'Name of the school/college'),
                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _dialogLabel('Start Year'),
                          const SizedBox(height: 6),
                          _dialogTextField(
                            controller: startYearCtrl,
                            hint: 'e.g. 2013',
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _dialogLabel('End Year'),
                          const SizedBox(height: 6),
                          _dialogTextField(
                            controller: endYearCtrl,
                            hint: 'e.g. 2015',
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                _dialogLabel('Achievements / Marks'),
                const SizedBox(height: 6),
                _dialogTextField(controller: achievementsCtrl, hint: 'e.g. 80% or Grade A'),
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
                              'type': typeCtrl.text.trim().isEmpty ? null : typeCtrl.text.trim(),
                              'course': courseCtrl.text.trim().isEmpty ? null : courseCtrl.text.trim(),
                              'degree': degreeCtrl.text.trim().isEmpty ? null : degreeCtrl.text.trim(),
                              'school': schoolCtrl.text.trim().isEmpty ? null : schoolCtrl.text.trim(),
                              'startYear': int.tryParse(startYearCtrl.text.trim()),
                              'endYear': int.tryParse(endYearCtrl.text.trim()),
                              'achievements': achievementsCtrl.text.trim().isEmpty ? null : achievementsCtrl.text.trim(),
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

    final newEdu = EducationModel(
      humanId: humanId,
      type: result['type'] as String?,
      course: result['course'] as String?,
      degree: result['degree'] as String?,
      school: result['school'] as String?,
      startYear: result['startYear'] as int?,
      endYear: result['endYear'] as int?,
      achievements: result['achievements'] as String?,
    );

    if (existing == null || index == -1) {
      ref.read(wizardProvider.notifier).addEducation(newEdu);
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

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/ui_constants.dart';
import '../../../../core/router/route_names.dart';
import '../../providers/wizard_providers.dart';

class Step5Review extends ConsumerStatefulWidget {
  const Step5Review({super.key});

  @override
  ConsumerState<Step5Review> createState() => _Step5ReviewState();
}

class _Step5ReviewState extends ConsumerState<Step5Review> {
  final _scrollController = ScrollController();
  bool _isActivating = false;
  String _activationStatus = 'Compiling neural pathways...';

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _handleActivation() async {
    setState(() {
      _isActivating = true;
      _activationStatus = 'Compiling neural pathways...';
    });

    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    setState(() {
      _activationStatus = 'Injecting memory structures...';
    });

    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    setState(() {
      _activationStatus = 'Calibrating behavior models...';
    });

    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    setState(() {
      _activationStatus = 'Digital Human Activated!';
    });

    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;

    await ref.read(wizardProvider.notifier).completeWizard();
    if (mounted) {
      context.go(RouteNames.dashboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    final wizard = ref.watch(wizardProvider);
    final p = wizard.profile;

    // Counts for Grid
    final hasIdentity = p.fullName.isNotEmpty;
    final identityText = hasIdentity ? '100% Complete' : 'Incomplete';

    final bioSections = [p.about, p.lifePhilosophy, p.favoriteQuotes, p.hobbies]
        .where((s) => s != null && s.isNotEmpty)
        .length;
    final bioText = bioSections > 0 ? '$bioSections Sections' : '4 Sections';

    final familyCount = wizard.familyMembers.isNotEmpty
        ? wizard.familyMembers.length
        : 7; // Mock fallback for replica representation
    final familyText = '$familyCount Members';

    final educationCount = wizard.education.isNotEmpty
        ? wizard.education.length
        : 3; // Mock fallback
    final educationText = '$educationCount Records';

    final hobbiesCount = p.hobbies != null && p.hobbies!.isNotEmpty
        ? p.hobbies!.split(',').length
        : 5; // Mock fallback

    return Stack(
      children: [
        Column(
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
                      // Profile activation header
                      Center(
                        child: Column(
                          children: [
                            // Circular Profile Image with Glowing Border
                            Container(
                              width: 110,
                              height: 110,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              padding: const EdgeInsets.all(3.5),
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF070B14),
                                ),
                                child: p.photoPath != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(55),
                                        child: Image.file(
                                          File(p.photoPath!),
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return const Center(
                                              child: Icon(
                                                Icons.person_outline_rounded,
                                                color: Color(0xFF64748B),
                                                size: 40,
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : const Center(
                                        child: Icon(
                                          Icons.person_outline_rounded,
                                          color: Color(0xFF64748B),
                                          size: 40,
                                        ),
                                      ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Status badge
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF10B981).withAlpha(20),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: const Color(0xFF10B981).withAlpha(100), width: 1),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Color(0xFF10B981),
                                    size: 14,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Ready for Activation',
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFF10B981),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),

                            // User Name
                            Text(
                              p.fullName.isNotEmpty ? p.fullName : 'Aftab Shah',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 4),

                            // Occupation
                            Text(
                              p.occupation != null && p.occupation!.isNotEmpty
                                  ? p.occupation!
                                  : 'Founder & CEO - Kanglei Innovations, Software Engineer',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                color: const Color(0xFF64748B),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),
                      const Divider(color: Color(0xFF1E293B), height: 1),
                      const SizedBox(height: 24),

                      // Grid of 8 Cards
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 2.2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        children: [
                          _buildReviewCard(
                            title: 'Identity',
                            subtitle: identityText,
                            icon: Icons.person_outline_rounded,
                            iconColor: const Color(0xFF00E5FF),
                          ),
                          _buildReviewCard(
                            title: 'Biography',
                            subtitle: bioText,
                            icon: Icons.edit_note_rounded,
                            iconColor: const Color(0xFF8B5CF6),
                          ),
                          _buildReviewCard(
                            title: 'Family Tree',
                            subtitle: familyText,
                            icon: Icons.diversity_3_rounded,
                            iconColor: const Color(0xFFF59E0B),
                          ),
                          _buildReviewCard(
                            title: 'Education',
                            subtitle: educationText,
                            icon: Icons.school_rounded,
                            iconColor: const Color(0xFF10B981),
                          ),
                          _buildReviewCard(
                            title: 'Core Values',
                            subtitle: '3 Selected',
                            icon: Icons.star_rounded,
                            iconColor: const Color(0xFFF59E0B),
                          ),
                          _buildReviewCard(
                            title: 'Interests',
                            subtitle: '$hobbiesCount Hobbies',
                            icon: Icons.favorite_rounded,
                            iconColor: const Color(0xFFEC4899),
                          ),
                          _buildReviewCard(
                            title: 'Life Mission',
                            subtitle: 'Completed',
                            icon: Icons.flag_rounded,
                            iconColor: const Color(0xFF3B82F6),
                          ),
                          _buildReviewCard(
                            title: 'Hologram',
                            subtitle: 'Initialized',
                            icon: Icons.blur_on_rounded,
                            iconColor: const Color(0xFF00E5FF),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ── Bottom Navigation Bar ──
            _buildBottomBar(),
          ],
        ),

        // Activation Overlay Loader
        if (_isActivating) _buildActivationOverlay(),
      ],
    );
  }

  Widget _buildReviewCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          // Icon Circle
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconColor.withAlpha(20),
            ),
            child: Center(
              child: Icon(
                icon,
                color: iconColor,
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Titles
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF64748B),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Checkmark
          const Icon(
            Icons.check_circle_outline_rounded,
            color: Color(0xFF10B981),
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildActivationOverlay() {
    final isDone = _activationStatus.contains('Activated');
    return Container(
      color: const Color(0xEE03050A),
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Container(
          width: 280,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF1E293B), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF8B5CF6).withAlpha(40),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isDone)
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF10B981),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                )
              else
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _activationStatus.contains('Compiling')
                          ? const Color(0xFF8B5CF6)
                          : const Color(0xFF00E5FF),
                    ),
                  ),
                ),
              const SizedBox(height: 24),
              Text(
                'Creating Your Digital Human',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _activationStatus,
                style: GoogleFonts.inter(
                  color: isDone ? const Color(0xFF10B981) : const Color(0xFF64748B),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
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
          // Save Draft
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                // Save Draft and go to dashboard
                ref.read(wizardProvider.notifier).completeWizard();
                context.go(RouteNames.dashboard);
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF1E293B), width: 1.2),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Save Draft',
                style: GoogleFonts.inter(
                  color: const Color(0xFF94A3B8),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Activate My Digital Human
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
                ),
              ),
              child: ElevatedButton(
                onPressed: _handleActivation,
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
                    const Icon(
                      Icons.auto_awesome_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Activate My Digital Human',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 6),
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
}

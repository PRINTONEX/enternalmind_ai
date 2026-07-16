import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/ui_constants.dart';
import '../../../../core/widgets/glass_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _scrollController = ScrollController();
  int? _expandedSectionIndex = 0; // First section open by default

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _toggleSection(int index) {
    setState(() {
      if (_expandedSectionIndex == index) {
        _expandedSectionIndex = null;
      } else {
        _expandedSectionIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Hosted in dashboard shell
      body: Stack(
        children: [
          // ── Radial background glow ──
          Positioned(
            top: -150,
            right: -100,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF7C3AED).withAlpha(12),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // ── Scrollable Profile Panel ──
          SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.only(bottom: 120),
            child: Column(
              children: [
                // 1. Header Area
                _buildProfileHeader(),
                const SizedBox(height: Spacing.lg),

                // 2. Expandable Section Cards List
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
                  child: Column(
                    children: [
                      // Section 1: Identity
                      _buildSectionWrapper(
                        index: 0,
                        icon: Icons.person_outline_rounded,
                        title: 'Identity',
                        description: 'Your fundamental details, personal history, and bio.',
                        color: const Color(0xFF7C3AED),
                        content: _buildIdentityContent(),
                      ),
                      _buildSpacing(),

                      // Section 2: Life Stories
                      _buildSectionWrapper(
                        index: 1,
                        icon: Icons.menu_book_outlined,
                        title: 'Life Stories',
                        description: 'Write, structure, and explore your memory chapters.',
                        color: const Color(0xFF06B6D4),
                        content: _buildLifeStoriesContent(),
                      ),
                      _buildSpacing(),

                      // Section 3: Guided Interview
                      _buildSectionWrapper(
                        index: 2,
                        icon: Icons.question_answer_outlined,
                        title: 'Guided Interview',
                        description: 'Answer deep questions to detail your neural double.',
                        color: const Color(0xFFEC4899),
                        content: _buildGuidedInterviewContent(),
                      ),
                      _buildSpacing(),

                      // Section 4: Daily Journal
                      _buildSectionWrapper(
                        index: 3,
                        icon: Icons.edit_note_rounded,
                        title: 'Daily Journal',
                        description: 'Record your daily thoughts, mood, and achievements.',
                        color: const Color(0xFF10B981),
                        content: _buildDailyJournalContent(),
                      ),
                      _buildSpacing(),

                      // Section 5: Family Tree
                      _buildSectionWrapper(
                        index: 4,
                        icon: Icons.account_tree_outlined,
                        title: 'Family Tree',
                        description: 'Add family relations and map your ancestry.',
                        color: const Color(0xFF3B82F6),
                        content: _buildFamilyTreeContent(),
                      ),
                      _buildSpacing(),

                      // Section 6: Life Map
                      _buildSectionWrapper(
                        index: 5,
                        icon: Icons.map_outlined,
                        title: 'Life Map',
                        description: 'Pin the key locations of your milestones.',
                        color: const Color(0xFFF59E0B),
                        content: _buildLifeMapContent(),
                      ),
                      _buildSpacing(),

                      // Section 7: Memories
                      _buildSectionWrapper(
                        index: 6,
                        icon: Icons.photo_library_outlined,
                        title: 'Memories',
                        description: 'Archive specific memory nodes, tags, and links.',
                        color: const Color(0xFFD946EF),
                        content: _buildMemoriesContent(),
                      ),
                      _buildSpacing(),

                      // Section 8: Photo Albums
                      _buildSectionWrapper(
                        index: 7,
                        icon: Icons.collections_bookmark_outlined,
                        title: 'Photo Albums',
                        description: 'Manage photo collections and memories visual grids.',
                        color: const Color(0xFF00E5FF),
                        content: _buildPhotoAlbumsContent(),
                      ),
                      _buildSpacing(),

                      // Section 9: Voice Vault
                      _buildSectionWrapper(
                        index: 8,
                        icon: Icons.keyboard_voice_outlined,
                        title: 'Voice Vault',
                        description: 'Train your speech synthesizer and record samples.',
                        color: const Color(0xFF7C3AED),
                        content: _buildVoiceVaultContent(),
                      ),
                      _buildSpacing(),

                      // Section 10: Documents
                      _buildSectionWrapper(
                        index: 9,
                        icon: Icons.description_outlined,
                        title: 'Documents',
                        description: 'Attach certificates, letters, and text files.',
                        color: const Color(0xFF10B981),
                        content: _buildDocumentsContent(),
                      ),
                      _buildSpacing(),

                      // Section 11: Legacy Messages
                      _buildSectionWrapper(
                        index: 10,
                        icon: Icons.forward_to_inbox_outlined,
                        title: 'Legacy Messages',
                        description: 'Schedule messages for release to loved ones.',
                        color: const Color(0xFFEC4899),
                        content: _buildLegacyMessagesContent(),
                      ),
                      _buildSpacing(),

                      // Section 12: Career
                      _buildSectionWrapper(
                        index: 11,
                        icon: Icons.work_outline_rounded,
                        title: 'Career',
                        description: 'Review and edit your professional work experience.',
                        color: const Color(0xFF3B82F6),
                        content: _buildCareerContent(),
                      ),
                      _buildSpacing(),

                      // Section 13: Education
                      _buildSectionWrapper(
                        index: 12,
                        icon: Icons.school_outlined,
                        title: 'Education',
                        description: 'Display academic degrees and certificates.',
                        color: const Color(0xFF06B6D4),
                        content: _buildEducationContent(),
                      ),
                      _buildSpacing(),

                      // Section 14: Skills
                      _buildSectionWrapper(
                        index: 13,
                        icon: Icons.psychology_outlined,
                        title: 'Skills & Expertise',
                        description: 'Define your technical skills and capabilities.',
                        color: const Color(0xFFF59E0B),
                        content: _buildSkillsContent(),
                      ),
                      _buildSpacing(),

                      // Section 15: Interests
                      _buildSectionWrapper(
                        index: 14,
                        icon: Icons.favorite_border_rounded,
                        title: 'Interests',
                        description: 'Edit topics, hobbies, and topics of study.',
                        color: const Color(0xFFD946EF),
                        content: _buildInterestsContent(),
                      ),
                      _buildSpacing(),

                      // Section 16: Goals
                      _buildSectionWrapper(
                        index: 15,
                        icon: Icons.flag_outlined,
                        title: 'Goals & Aspirations',
                        description: 'Specify career targets and future dream projects.',
                        color: const Color(0xFF00E5FF),
                        content: _buildGoalsContent(),
                      ),
                      _buildSpacing(),

                      // Section 17: Personality
                      _buildSectionWrapper(
                        index: 16,
                        icon: Icons.track_changes_outlined,
                        title: 'Personality Profile',
                        description: 'Configure your core values and conversation traits.',
                        color: const Color(0xFF7C3AED),
                        content: _buildPersonalityContent(),
                      ),
                      _buildSpacing(),

                      // Section 18: AI Personality
                      _buildSectionWrapper(
                        index: 17,
                        icon: Icons.android_outlined,
                        title: 'AI Companion Personality',
                        description: 'Tailor tone, greeting style, and speaking modes.',
                        color: const Color(0xFF10B981),
                        content: _buildAIPersonalityContent(),
                      ),
                      _buildSpacing(),

                      // Section 19: Favorites
                      _buildSectionWrapper(
                        index: 18,
                        icon: Icons.star_border_rounded,
                        title: 'Favorites',
                        description: 'Your favorite movies, books, music, and food.',
                        color: const Color(0xFFEC4899),
                        content: _buildFavoritesContent(),
                      ),
                      _buildSpacing(),

                      // Section 20: Languages
                      _buildSectionWrapper(
                        index: 19,
                        icon: Icons.translate_rounded,
                        title: 'Languages',
                        description: 'Add languages and rate reading/speaking proficiency.',
                        color: const Color(0xFF3B82F6),
                        content: _buildLanguagesContent(),
                      ),
                      _buildSpacing(),

                      // Section 21: Privacy & Settings
                      _buildSectionWrapper(
                        index: 20,
                        icon: Icons.lock_outline_rounded,
                        title: 'Privacy & Security',
                        description: 'Configure local encryption, permissions, and backups.',
                        color: const Color(0xFF64748B),
                        content: _buildPrivacyContent(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpacing() => const SizedBox(height: 20);

  // ── Header Section ──
  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF7C3AED).withAlpha(30),
            Colors.transparent,
          ],
        ),
      ),
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: Column(
        children: [
          // Glowing Profile Image Stack
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 104,
                height: 104,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF00E5FF),
                    width: 2.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00E5FF).withAlpha(100),
                      blurRadius: 16,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(52),
                  child: Image.asset(
                    'assets/avatars/aftab.png',
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) => const Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                ),
              ),
              // Edit photo badge
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFF7C3AED), Color(0xFF06B6D4)],
                  ),
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: Spacing.md),

          // Name + Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Aftab Shah',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.verified_rounded,
                color: Color(0xFF00E5FF),
                size: 18,
              ),
            ],
          ),
          const SizedBox(height: 2),

          // Subtitle
          Text(
            'Neural Digital Human • Version 1.0.4',
            style: GoogleFonts.inter(
              color: const Color(0xFF64748B),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: Spacing.md),

          // Completion Progress Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Profile Completion',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF94A3B8),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '92%',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF00E5FF),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 220,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF7C3AED), Color(0xFF00E5FF)],
                          ),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Section Card Builder Wrapper ──
  Widget _buildSectionWrapper({
    required int index,
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required Widget content,
  }) {
    final isExpanded = _expandedSectionIndex == index;

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      alignment: Alignment.topCenter,
      child: GlassCard(
        borderRadius: 24,
        padding: const EdgeInsets.all(Spacing.md),
        glowColor: color.withAlpha(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row (Clickable)
            GestureDetector(
              onTap: () => _toggleSection(index),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.withAlpha(20),
                      border: Border.all(color: color.withAlpha(100), width: 1.2),
                    ),
                    child: Center(
                      child: Icon(
                        icon,
                        color: color,
                        size: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            color: const Color(0xFF64748B),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                    color: const Color(0xFF64748B),
                    size: 24,
                  ),
                ],
              ),
            ),

            // Expanded content block
            if (isExpanded) ...[
              const SizedBox(height: Spacing.lg),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color(0xFF1E293B), width: 1.2),
                  ),
                ),
                padding: const EdgeInsets.only(top: Spacing.lg),
                child: content,
              ),
              const SizedBox(height: Spacing.lg),

              // Action Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => _toggleSection(index),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF1E293B)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () => _toggleSection(index),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF7C3AED), Color(0xFF00E5FF)],
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        'Save Changes',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ── Input Field Builder ──
  Widget _buildField({
    required String label,
    required String hint,
    required IconData icon,
    bool isMultiline = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            color: const Color(0xFF94A3B8),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            maxLines: isMultiline ? 4 : 1,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 13),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 13),
              icon: Icon(icon, color: const Color(0xFF7C3AED), size: 18),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  // ── 1. IDENTITY CONTENT ──
  Widget _buildIdentityContent() {
    return Column(
      children: [
        _buildField(label: 'Full Name', hint: 'Aftab Shah', icon: Icons.person_outline_rounded),
        const SizedBox(height: 14),
        _buildField(label: 'Nickname', hint: 'Aftab', icon: Icons.alternate_email_rounded),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: _buildField(label: 'Date of Birth', hint: '04 Dec 1997', icon: Icons.calendar_today_rounded),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildField(label: 'Gender', hint: 'Male', icon: Icons.wc_rounded),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: _buildField(label: 'Place of Birth', hint: 'Phoudel, Manipur', icon: Icons.location_on_outlined),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildField(label: 'Current City', hint: 'Bangalore', icon: Icons.home_outlined),
            ),
          ],
        ),
        const SizedBox(height: 14),
        _buildField(label: 'Nationality', hint: 'Indian', icon: Icons.public_rounded),
        const SizedBox(height: 14),
        _buildField(label: 'Occupation', hint: 'Software Engineer', icon: Icons.work_outline_rounded),
        const SizedBox(height: 14),
        _buildField(label: 'About Me', hint: 'Curious programmer trying to map human memories with AI...', icon: Icons.info_outline_rounded, isMultiline: true),
      ],
    );
  }

  // ── 2. LIFE STORIES CONTENT ──
  Widget _buildLifeStoriesContent() {
    final chapters = [
      ('Chapter 1', 'Childhood Memories', '1997 - 2010', Icons.child_care_rounded),
      ('Chapter 2', 'College Years', '2015 - 2019', Icons.school_outlined),
      ('Chapter 3', 'Professional Journey', '2020 - Present', Icons.laptop_mac_rounded),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Timeline Chapters',
          style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...chapters.map((ch) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF090D1A),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF1E293B)),
            ),
            child: Row(
              children: [
                Icon(ch.$4, color: const Color(0xFF06B6D4), size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ch.$2,
                        style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${ch.$1} • ${ch.$3}',
                        style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.edit_note_rounded, color: Color(0xFF06B6D4), size: 18),
              ],
            ),
          );
        }),
      ],
    );
  }

  // ── 3. GUIDED INTERVIEW CONTENT ──
  Widget _buildGuidedInterviewContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Question card
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E152A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEC4899).withAlpha(100)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Active Question 4 of 25',
                    style: GoogleFonts.inter(color: const Color(0xFFEC4899), fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.stars_rounded, color: Color(0xFFEC4899), size: 16),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'What was the most challenging event of your career and how did you resolve it?',
                style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, height: 1.4),
              ),
              const SizedBox(height: 14),
              _buildField(label: 'Your Answer', hint: 'Type your detailed answer here...', icon: Icons.border_color_outlined, isMultiline: true),
            ],
          ),
        ),
      ],
    );
  }

  // ── 4. DAILY JOURNAL CONTENT ──
  Widget _buildDailyJournalContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Mood Selector
        Text(
          'How is your mood today?',
          style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 11, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: ['😊 Happy', '😐 Calm', '🔥 Motivated', '💤 Tired', '😔 Pensive'].map((mood) {
            final isSelected = mood.contains('Happy');
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF10B981).withAlpha(30) : const Color(0xFF090D1A),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: isSelected ? const Color(0xFF10B981) : const Color(0xFF1E293B)),
              ),
              child: Text(
                mood,
                style: GoogleFonts.inter(color: isSelected ? Colors.white : const Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.bold),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        _buildField(label: 'Journal Entry', hint: 'Write today\'s memories...', icon: Icons.book_outlined, isMultiline: true),
      ],
    );
  }

  // ── 5. FAMILY TREE CONTENT ──
  Widget _buildFamilyTreeContent() {
    final family = [
      ('Father', 'L. Shah', '1968', 'Active'),
      ('Mother', 'K. Shah', '1973', 'Active'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...family.map((f) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF090D1A),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF1E293B)),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFF3B82F6),
                  radius: 18,
                  child: Icon(Icons.person, color: Colors.white, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        f.$2,
                        style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${f.$1} • Born ${f.$3}',
                        style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.keyboard_arrow_right_rounded, color: Color(0xFF64748B)),
              ],
            ),
          );
        }),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF3B82F6), width: 1.2),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.add_rounded, color: Color(0xFF3B82F6), size: 16),
                const SizedBox(width: 6),
                Text(
                  'Add Family Member',
                  style: GoogleFonts.inter(color: const Color(0xFF3B82F6), fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ── 6. LIFE MAP CONTENT ──
  Widget _buildLifeMapContent() {
    final places = [
      ('Birth Place', 'Phoudel, Manipur', '1997', Icons.location_on_outlined),
      ('Schooling', 'Imphal', '2003 - 2015', Icons.school_outlined),
      ('First Job', 'Bangalore, India', '2020 - Present', Icons.business_center_outlined),
    ];

    return Column(
      children: places.map((p) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          child: Row(
            children: [
              Icon(p.$4, color: const Color(0xFFF59E0B), size: 18),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      p.$2,
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${p.$1} • ${p.$3}',
                      style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.pin_drop_outlined, color: Color(0xFFF59E0B), size: 16),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ── 7. MEMORIES CONTENT ──
  Widget _buildMemoriesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFF1E293B),
                ),
                child: const Icon(Icons.image_outlined, color: Color(0xFFD946EF), size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Solo Hike in Western Ghats',
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Personal • High Priority',
                      style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.lock_outline_rounded, color: Color(0xFF64748B), size: 16),
            ],
          ),
        ),
      ],
    );
  }

  // ── 8. PHOTO ALBUMS CONTENT ──
  Widget _buildPhotoAlbumsContent() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.2,
      children: [
        _buildAlbumCard('Family Gatherings', '24 Photos'),
        _buildAlbumCard('Travel Adventures', '48 Photos'),
      ],
    );
  }

  Widget _buildAlbumCard(String title, String count) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(Icons.folder_open_outlined, color: Color(0xFF00E5FF), size: 24),
          const Spacer(),
          Text(
            title,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Text(
            count,
            style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 9, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // ── 9. VOICE VAULT CONTENT ──
  Widget _buildVoiceVaultContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Voice Synthesizer Status',
                    style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Ready',
                    style: GoogleFonts.inter(color: const Color(0xFF10B981), fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Waveform representation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(20, (index) {
                  final height = (index % 3 + 1) * 6.0;
                  return Container(
                    width: 3,
                    height: height,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7C3AED),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── 10. DOCUMENTS CONTENT ──
  Widget _buildDocumentsContent() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Row(
        children: [
          const Icon(Icons.picture_as_pdf_outlined, color: Color(0xFF10B981), size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BCA Graduation Degree.pdf',
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Education • 1.2 MB',
                  style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const Icon(Icons.download_rounded, color: Color(0xFF64748B), size: 16),
        ],
      ),
    );
  }

  // ── 11. LEGACY MESSAGES CONTENT ──
  Widget _buildLegacyMessagesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildField(label: 'To Recipient', hint: 'Select contact or email...', icon: Icons.alternate_email_rounded),
        const SizedBox(height: 14),
        _buildField(label: 'Message Content', hint: 'Your legacy message to be delivered...', icon: Icons.chat_bubble_outline_rounded, isMultiline: true),
      ],
    );
  }

  // ── 12. CAREER CONTENT ──
  Widget _buildCareerContent() {
    return Column(
      children: [
        _buildField(label: 'Company Name', hint: 'EternalMind AI', icon: Icons.business_outlined),
        const SizedBox(height: 14),
        _buildField(label: 'Job Title', hint: 'Senior AI Engineer', icon: Icons.badge_outlined),
      ],
    );
  }

  // ── 13. EDUCATION CONTENT ──
  Widget _buildEducationContent() {
    return Column(
      children: [
        _buildField(label: 'Institute', hint: 'Manipur University', icon: Icons.school_outlined),
        const SizedBox(height: 14),
        _buildField(label: 'Degree', hint: 'BCA (Computer Applications)', icon: Icons.verified_user_outlined),
      ],
    );
  }

  // ── 14. SKILLS CONTENT ──
  Widget _buildSkillsContent() {
    final skills = ['Flutter', 'Dart', 'LLMs', 'API Design', 'Python', 'RAG Systems'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills.map((skill) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF7C3AED), Color(0xFF00E5FF)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                skill,
                style: GoogleFonts.inter(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 14),
        _buildField(label: 'Add Skill', hint: 'Enter skill (e.g. React)', icon: Icons.add_circle_outline_rounded),
      ],
    );
  }

  // ── 15. INTERESTS CONTENT ──
  Widget _buildInterestsContent() {
    final interests = ['Coding', 'Space Exploration', 'Psychology', 'Gaming', 'Writing', 'History'];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: interests.map((i) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          child: Text(
            i,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
          ),
        );
      }).toList(),
    );
  }

  // ── 16. GOALS CONTENT ──
  Widget _buildGoalsContent() {
    return Column(
      children: [
        _buildField(label: 'Life Goals', hint: 'Create a permanent digital clone...', icon: Icons.stars_rounded, isMultiline: true),
        const SizedBox(height: 14),
        _buildField(label: 'Career Goals', hint: 'Open source a framework...', icon: Icons.flag_outlined, isMultiline: true),
      ],
    );
  }

  // ── 17. PERSONALITY CONTENT ──
  Widget _buildPersonalityContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personality Sliders',
          style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildPersonalitySlider('Introverted / Extroverted', 0.35),
        _buildPersonalitySlider('Intuitive / Analytical', 0.82),
        _buildPersonalitySlider('Spontaneous / Planned', 0.45),
      ],
    );
  }

  Widget _buildPersonalitySlider(String title, double val) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 11, fontWeight: FontWeight.w600),
            ),
            Text(
              '${(val * 100).toInt()}%',
              style: GoogleFonts.inter(color: const Color(0xFF00E5FF), fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Slider(
          value: val,
          onChanged: (v) {},
          activeColor: const Color(0xFF7C3AED),
          inactiveColor: const Color(0xFF1E293B),
        ),
      ],
    );
  }

  // ── 18. AI PERSONALITY CONTENT ──
  Widget _buildAIPersonalityContent() {
    return Column(
      children: [
        _buildField(label: 'Speaking Tone', hint: 'Empathetic and thoughtful', icon: Icons.record_voice_over_outlined),
        const SizedBox(height: 14),
        _buildField(label: 'Greeting Phrase', hint: 'Hello Aftab, how can I assist your twin today?', icon: Icons.waving_hand_outlined),
      ],
    );
  }

  // ── 19. FAVORITES CONTENT ──
  Widget _buildFavoritesContent() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildField(label: 'Favorite Book', hint: 'The Alchemist', icon: Icons.book_outlined)),
            const SizedBox(width: 12),
            Expanded(child: _buildField(label: 'Favorite Food', hint: 'Biryani', icon: Icons.restaurant_rounded)),
          ],
        ),
        const SizedBox(height: 14),
        _buildField(label: 'Favorite Movie', hint: 'Interstellar', icon: Icons.movie_outlined),
      ],
    );
  }

  // ── 20. LANGUAGES CONTENT ──
  Widget _buildLanguagesContent() {
    return Column(
      children: [
        _buildLanguageProficiencyRow('English', 0.95),
        const SizedBox(height: 12),
        _buildLanguageProficiencyRow('Manipuri', 1.0),
        const SizedBox(height: 12),
        _buildLanguageProficiencyRow('Hindi', 0.85),
      ],
    );
  }

  Widget _buildLanguageProficiencyRow(String language, double level) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            language,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: LinearProgressIndicator(
            value: level,
            backgroundColor: const Color(0xFF1E293B),
            color: const Color(0xFF3B82F6),
            minHeight: 6,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '${(level * 100).toInt()}%',
          style: GoogleFonts.inter(color: const Color(0xFF3B82F6), fontSize: 11, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // ── 21. PRIVACY CONTENT ──
  Widget _buildPrivacyContent() {
    return Column(
      children: [
        _buildPrivacySwitch('Local Enclave Encryption', true),
        const SizedBox(height: 12),
        _buildPrivacySwitch('Sync to Encrypted Cloud Backup', false),
        const SizedBox(height: 12),
        _buildPrivacySwitch('Anonymous Analytics Feedback', true),
      ],
    );
  }

  Widget _buildPrivacySwitch(String title, bool val) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
        ),
        Switch.adaptive(
          value: val,
          onChanged: (v) {},
          activeThumbColor: const Color(0xFF00E5FF),
          activeTrackColor: const Color(0xFF00E5FF).withAlpha(100),
          inactiveThumbColor: const Color(0xFF64748B),
          inactiveTrackColor: const Color(0xFF1E293B),
        ),
      ],
    );
  }
}

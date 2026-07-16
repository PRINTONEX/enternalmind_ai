/// Profile Screen — editable sections loaded from and saved to the database.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/ui_constants.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../database/app_database.dart';
import '../../dashboard/providers/dashboard_providers.dart';
import '../../wizard/models/wizard_models.dart';
import '../../wizard/providers/wizard_providers.dart';
import '../providers/profile_providers.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _scrollController = ScrollController();
  int? _expandedSectionIndex = 0;

  // Identity controllers
  late TextEditingController _fullNameCtrl;
  late TextEditingController _nicknameCtrl;
  late TextEditingController _birthPlaceCtrl;
  late TextEditingController _currentCityCtrl;
  late TextEditingController _nationalityCtrl;
  late TextEditingController _occupationCtrl;
  late TextEditingController _aboutCtrl;
  late TextEditingController _quoteCtrl;
  int? _lastProfileId;

  @override
  void initState() {
    super.initState();
    _fullNameCtrl = TextEditingController();
    _nicknameCtrl = TextEditingController();
    _birthPlaceCtrl = TextEditingController();
    _currentCityCtrl = TextEditingController();
    _nationalityCtrl = TextEditingController();
    _occupationCtrl = TextEditingController();
    _aboutCtrl = TextEditingController();
    _quoteCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _fullNameCtrl.dispose();
    _nicknameCtrl.dispose();
    _birthPlaceCtrl.dispose();
    _currentCityCtrl.dispose();
    _nationalityCtrl.dispose();
    _occupationCtrl.dispose();
    _aboutCtrl.dispose();
    _quoteCtrl.dispose();
    super.dispose();
  }

  void _syncControllers(ProfileModel? profile) {
    if (profile == null) return;
    // Only update when profile ID changes (new profile loaded)
    if (profile.id == _lastProfileId) return;
    _lastProfileId = profile.id;
    _fullNameCtrl.text = profile.fullName;
    _nicknameCtrl.text = profile.nickname ?? '';
    _birthPlaceCtrl.text = profile.birthPlace ?? '';
    _currentCityCtrl.text = profile.currentCity ?? '';
    _nationalityCtrl.text = profile.nationality ?? '';
    _occupationCtrl.text = profile.occupation ?? '';
    _aboutCtrl.text = profile.about ?? '';
    _quoteCtrl.text = profile.favoriteQuotes ?? '';
  }

  void _saveIdentity() {
    final profile = ref.read(dashProfileProvider).valueOrNull;
    if (profile == null) return;
    ref.read(wizardProvider.notifier).updateProfile(
          profile.copyWith(
            fullName: _fullNameCtrl.text.trim().isEmpty
                ? profile.fullName
                : _fullNameCtrl.text.trim(),
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
            occupation: _occupationCtrl.text.trim().isEmpty
                ? null
                : _occupationCtrl.text.trim(),
            about: _aboutCtrl.text.trim().isEmpty
                ? null
                : _aboutCtrl.text.trim(),
            favoriteQuotes: _quoteCtrl.text.trim().isEmpty
                ? null
                : _quoteCtrl.text.trim(),
          ),
        );
    _toggleSection(0);
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
    final profileAsync = ref.watch(dashProfileProvider);
    final profile = profileAsync.valueOrNull;

    // ── Watch all section data providers ──
    final lifeStoriesAsync = ref.watch(profileLifeStoriesProvider);
    final journalsAsync = ref.watch(profileDailyJournalsProvider);
    final familyAsync = ref.watch(profileFamilyMembersProvider);
    final lifePlacesAsync = ref.watch(profileLifePlacesProvider);
    final memoriesAsync = ref.watch(profileMemoriesProvider);
    final albumsAsync = ref.watch(profilePhotoAlbumsProvider);
    final voiceSettingsAsync = ref.watch(profileVoiceSettingsProvider);
    final documentsAsync = ref.watch(profileDocumentsProvider);
    final legacyAsync = ref.watch(profileLegacyMessagesProvider);
    final careerAsync = ref.watch(profileCareerProvider);
    final educationAsync = ref.watch(profileEducationProvider);
    final skillsAsync = ref.watch(profileSkillsProvider);
    final interestsAsync = ref.watch(profileInterestsProvider);
    final goalsAsync = ref.watch(profileGoalsProvider);
    final traitsAsync = ref.watch(profilePersonalityTraitsProvider);
    final stylesAsync = ref.watch(profileConversationStylesProvider);
    final favoritesAsync = ref.watch(profileFavoritesProvider);
    final languagesAsync = ref.watch(profileLanguagesProvider);
    final timelineAsync = ref.watch(profileTimelineProvider);
    final dailyHabitsAsync = ref.watch(profileDailyHabitsProvider);
    final valuesBeliefsAsync = ref.watch(profileValuesBeliefsProvider);
    final decisionProfilesAsync = ref.watch(profileDecisionProfilesProvider);
    final favoriteWordsAsync = ref.watch(profileFavoriteWordsProvider);

    // Sync controllers when profile data arrives from DB
    _syncControllers(profile);

    final name = profile?.fullName.isNotEmpty == true
        ? profile!.fullName
        : 'Aftab Shah';
    final initial = name.isNotEmpty ? name[0].toUpperCase() : 'A';

    return Scaffold(
      backgroundColor: Colors.transparent,
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
                _buildProfileHeader(name, initial),
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
                        content: _buildIdentityContent(profile),
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

                      // Section 15: Daily Habits
                      _buildSectionWrapper(
                        index: 14,
                        icon: Icons.wb_sunny_outlined,
                        title: 'Daily Habits',
                        description: dailyHabitsAsync.valueOrNull != null
                            ? 'Daily routine configured.'
                            : 'Record your daily rhythms.',
                        color: const Color(0xFFF59E0B),
                        content: _buildDailyHabitsContent(dailyHabitsAsync.valueOrNull),
                      ),
                      _buildSpacing(),

                      // Section 16: Skills
                      _buildSectionWrapper(
                        index: 15,
                        icon: Icons.psychology_outlined,
                        title: 'Skills & Expertise',
                        description: '${skillsAsync.valueOrNull?.length ?? 0} skills defined.',
                        color: const Color(0xFFF59E0B),
                        content: _buildSkillsContent(skillsAsync.valueOrNull ?? []),
                      ),
                      _buildSpacing(),

                      // Section 17: Interests
                      _buildSectionWrapper(
                        index: 16,
                        icon: Icons.favorite_border_rounded,
                        title: 'Interests',
                        description: '${interestsAsync.valueOrNull?.length ?? 0} interests listed.',
                        color: const Color(0xFFD946EF),
                        content: _buildInterestsContent(interestsAsync.valueOrNull ?? []),
                      ),
                      _buildSpacing(),

                      // Section 18: Goals
                      _buildSectionWrapper(
                        index: 17,
                        icon: Icons.flag_outlined,
                        title: 'Goals & Aspirations',
                        description: '${goalsAsync.valueOrNull?.length ?? 0} goals set.',
                        color: const Color(0xFF00E5FF),
                        content: _buildGoalsContent(goalsAsync.valueOrNull ?? []),
                      ),
                      _buildSpacing(),

                      // Section 19: Personality
                      _buildSectionWrapper(
                        index: 18,
                        icon: Icons.track_changes_outlined,
                        title: 'Personality Profile',
                        description: traitsAsync.valueOrNull != null
                            ? 'Traits quantified.'
                            : 'Configure your core values.',
                        color: const Color(0xFF7C3AED),
                        content: _buildPersonalityContent(traitsAsync.valueOrNull),
                      ),
                      _buildSpacing(),

                      // Section 20: AI Personality
                      _buildSectionWrapper(
                        index: 19,
                        icon: Icons.android_outlined,
                        title: 'AI Companion Personality',
                        description: stylesAsync.valueOrNull != null
                            ? 'Speaking style configured.'
                            : 'Tailor tone and greeting style.',
                        color: const Color(0xFF10B981),
                        content: _buildAIPersonalityContent(stylesAsync.valueOrNull),
                      ),
                      _buildSpacing(),

                      // Section 21: Values & Beliefs
                      _buildSectionWrapper(
                        index: 20,
                        icon: Icons.auto_awesome_rounded,
                        title: 'Values & Beliefs',
                        description: valuesBeliefsAsync.valueOrNull != null
                            ? 'Core principles defined.'
                            : 'Define your values and ethics.',
                        color: const Color(0xFF10B981),
                        content: _buildValuesBeliefsContent(valuesBeliefsAsync.valueOrNull),
                      ),
                      _buildSpacing(),

                      // Section 22: Decision Profile
                      _buildSectionWrapper(
                        index: 21,
                        icon: Icons.psychology_alt_rounded,
                        title: 'Decision Profile',
                        description: decisionProfilesAsync.valueOrNull != null
                            ? 'Decision style configured.'
                            : 'Analyze your decision patterns.',
                        color: const Color(0xFF7C3AED),
                        content: _buildDecisionProfileContent(decisionProfilesAsync.valueOrNull),
                      ),
                      _buildSpacing(),

                      // Section 23: Favorites
                      _buildSectionWrapper(
                        index: 22,
                        icon: Icons.star_border_rounded,
                        title: 'Favorites',
                        description: '${favoritesAsync.valueOrNull?.length ?? 0} favorites saved.',
                        color: const Color(0xFFEC4899),
                        content: _buildFavoritesContent(favoritesAsync.valueOrNull ?? []),
                      ),
                      _buildSpacing(),

                      // Section 24: Languages
                      _buildSectionWrapper(
                        index: 23,
                        icon: Icons.translate_rounded,
                        title: 'Languages',
                        description: '${languagesAsync.valueOrNull?.length ?? 0} languages added.',
                        color: const Color(0xFF3B82F6),
                        content: _buildLanguagesContent(languagesAsync.valueOrNull ?? []),
                      ),
                      _buildSpacing(),

                      // Section 25: Favorite Words
                      _buildSectionWrapper(
                        index: 24,
                        icon: Icons.chat_bubble_outline_rounded,
                        title: 'Favorite Words',
                        description: '${favoriteWordsAsync.valueOrNull?.length ?? 0} cherished words.',
                        color: const Color(0xFFD946EF),
                        content: _buildFavoriteWordsContent(favoriteWordsAsync.valueOrNull ?? []),
                      ),
                      _buildSpacing(),

                      // Section 26: Privacy & Settings
                      _buildSectionWrapper(
                        index: 25,
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
  Widget _buildProfileHeader(String name, String initial) {
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
                child: Center(
                  child: Text(
                    initial,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                    ),
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
                name,
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
                    onTap: index == 0 ? _saveIdentity : () => _toggleSection(index),
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
    TextEditingController? controller,
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
            controller: controller,
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
  Widget _buildIdentityContent(ProfileModel? profile) {
    return Column(
      children: [
        _buildField(
          label: 'Full Name',
          hint: 'Aftab Shah',
          icon: Icons.person_outline_rounded,
          controller: _fullNameCtrl,
        ),
        const SizedBox(height: 14),
        _buildField(
          label: 'Nickname',
          hint: 'Aftab',
          icon: Icons.alternate_email_rounded,
          controller: _nicknameCtrl,
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: _buildField(
                label: 'Date of Birth',
                hint: profile?.birthDate != null
                    ? '${profile!.birthDate!.day.toString().padLeft(2, '0')} ${_getMonthName(profile.birthDate!.month)} ${profile.birthDate!.year}'
                    : '04 Dec 1997',
                icon: Icons.calendar_today_rounded,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildField(
                label: 'Gender',
                hint: profile?.gender ?? 'Male',
                icon: Icons.wc_rounded,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: _buildField(
                label: 'Place of Birth',
                hint: profile?.birthPlace ?? 'Phoudel, Manipur',
                icon: Icons.location_on_outlined,
                controller: _birthPlaceCtrl,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildField(
                label: 'Current City',
                hint: profile?.currentCity ?? 'Bangalore',
                icon: Icons.home_outlined,
                controller: _currentCityCtrl,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        _buildField(
          label: 'Nationality',
          hint: profile?.nationality ?? 'Indian',
          icon: Icons.public_rounded,
          controller: _nationalityCtrl,
        ),
        const SizedBox(height: 14),
        _buildField(
          label: 'Occupation',
          hint: profile?.occupation ?? 'Software Engineer',
          icon: Icons.work_outline_rounded,
          controller: _occupationCtrl,
        ),
        const SizedBox(height: 14),
        _buildField(
          label: 'Favorite Quote',
          hint: profile?.favoriteQuotes ?? 'Curious programmer...',
          icon: Icons.format_quote_rounded,
          controller: _quoteCtrl,
          isMultiline: true,
        ),
        const SizedBox(height: 14),
        _buildField(
          label: 'About Me',
          hint: profile?.about ?? 'Curious programmer trying to map human memories with AI...',
          icon: Icons.info_outline_rounded,
          controller: _aboutCtrl,
          isMultiline: true,
        ),
      ],
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  String _fmtDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return 'Unknown date';
    try {
      final dt = DateTime.parse(dateStr);
      return '${dt.day.toString().padLeft(2, '0')} ${_getMonthName(dt.month)} ${dt.year}';
    } catch (_) {
      return dateStr;
    }
  }

  String? _moodEmoji(String? mood) {
    switch (mood?.toLowerCase()) {
      case 'happy': case 'joyful': return '😊';
      case 'calm': return '😐';
      case 'motivated': case 'hopeful': return '🔥';
      case 'tired': return '💤';
      case 'pensive': case 'sad': return '😔';
      case 'grateful': return '🙏';
      default: return null;
    }
  }

  String _storyTitle(String? key) {
    if (key == null) return 'Story';
    return key.split('_').map((w) => w.isEmpty ? '' : '${w[0].toUpperCase()}${w.substring(1)}').join(' ');
  }

  Color _relColor(String? rel) {
    switch (rel?.toLowerCase()) {
      case 'father': case 'mother': case 'parent': return const Color(0xFF3B82F6);
      case 'brother': case 'sister': case 'sibling': return const Color(0xFF10B981);
      case 'wife': case 'husband': case 'spouse': return const Color(0xFFEC4899);
      case 'children': case 'son': case 'daughter': return const Color(0xFFF59E0B);
      default: return const Color(0xFF7C3AED);
    }
  }

  IconData _memIcon(String? category) {
    switch (category?.toLowerCase()) {
      case 'career': return Icons.work_outlined;
      case 'family': return Icons.family_restroom_outlined;
      case 'business': return Icons.business_center_outlined;
      case 'marriage': return Icons.favorite_rounded;
      default: return Icons.image_outlined;
    }
  }

  Widget _emptyPlaceholder(String message, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF475569), size: 32),
          const SizedBox(height: 8),
          Text(message, textAlign: TextAlign.center,
            style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 12, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }

  Widget _buildTraitRow(String label, int? value) {
    final clamped = (value ?? 50).clamp(0, 100) / 100.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(width: 90,
            child: Text(label,
              style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 11, fontWeight: FontWeight.w500)),
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: clamped,
              backgroundColor: const Color(0xFF1E293B),
              color: const Color(0xFF7C3AED),
              minHeight: 6,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          SizedBox(width: 30,
            child: Text('$value', textAlign: TextAlign.right,
              style: GoogleFonts.inter(color: const Color(0xFF00E5FF), fontSize: 11, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildStyleRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          SizedBox(width: 100,
            child: Text(label,
              style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 11, fontWeight: FontWeight.w500)),
          ),
          Expanded(
            child: Text(value,
              style: GoogleFonts.inter(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  Widget _buildVoiceRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          SizedBox(width: 100,
            child: Text(label,
              style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 11, fontWeight: FontWeight.w500)),
          ),
          Expanded(
            child: Text(value,
              style: GoogleFonts.inter(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
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
  Widget _buildSkillsContent(List<SkillsTableData> skills) {
    if (skills.isEmpty) {
      return _emptyPlaceholder('No skills added yet.', Icons.psychology_outlined);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills.map((s) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF7C3AED), Color(0xFF00E5FF)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                s.name,
                style: GoogleFonts.inter(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // ── 17. INTERESTS CONTENT ──
  Widget _buildInterestsContent(List<InterestsTableData> interests) {
    if (interests.isEmpty) {
      return _emptyPlaceholder('No interests listed.', Icons.favorite_border_rounded);
    }
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
            i.name,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
          ),
        );
      }).toList(),
    );
  }

  // ── 18. GOALS CONTENT ──
  Widget _buildGoalsContent(List<GoalsTableData> goals) {
    if (goals.isEmpty) {
      return _emptyPlaceholder('No goals set yet.', Icons.flag_outlined);
    }
    return Column(
      children: goals.map((g) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFF00E5FF).withAlpha(20),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  g.type ?? 'Goal',
                  style: GoogleFonts.inter(color: const Color(0xFF00E5FF), fontSize: 9, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                g.description ?? '',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 11, height: 1.4),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ── 19. PERSONALITY CONTENT ──
  Widget _buildPersonalityContent(PersonalityTraitsTableData? traits) {
    if (traits == null) {
      return _emptyPlaceholder('No personality traits recorded.', Icons.track_changes_outlined);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personality Traits',
          style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildTraitRow('Kindness', traits.kindness),
        _buildTraitRow('Patience', traits.patience),
        _buildTraitRow('Leadership', traits.leadership),
        _buildTraitRow('Confidence', traits.confidence),
        _buildTraitRow('Humor', traits.humor),
        _buildTraitRow('Creativity', traits.creativity),
        _buildTraitRow('Optimism', traits.optimism),
        _buildTraitRow('Discipline', traits.discipline),
        _buildTraitRow('Curiosity', traits.curiosity),
        _buildTraitRow('Emotional', traits.emotional),
        if (traits.speakingStyle != null) ...[
          const SizedBox(height: 8),
          Text(
            'Speaking Style: ${traits.speakingStyle}',
            style: GoogleFonts.inter(color: const Color(0xFF7C3AED), fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
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
  Widget _buildAIPersonalityContent(ConversationStylesTableData? style) {
    if (style == null) {
      return _emptyPlaceholder('No conversation style configured.', Icons.android_outlined);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          child: Column(
            children: [
              _buildStyleRow('Tone', style.tone ?? '—'),
              _buildStyleRow('Story Teller', style.storyTeller == 1 ? 'Yes' : 'No'),
              _buildStyleRow('Teacher Mode', style.teacherMode == 1 ? 'Yes' : 'No'),
              _buildStyleRow('Motivational', style.motivational == 1 ? 'Yes' : 'No'),
              _buildStyleRow('Reply Length', style.replyLength ?? '—'),
              _buildStyleRow('Emoji Usage', style.emojiUsage ?? '—'),
              _buildStyleRow('Local Language', style.localLanguage ?? '—'),
            ],
          ),
        ),
        if (style.favoriteGreetings != null && style.favoriteGreetings!.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            'Favorite Greetings',
            style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            style.favoriteGreetings!,
            style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 11),
          ),
        ],
      ],
    );
  }

  // ── 23. FAVORITES CONTENT ──
  Widget _buildFavoritesContent(List<FavoritesTableData> favorites) {
    if (favorites.isEmpty) {
      return _emptyPlaceholder('No favorites saved yet.', Icons.star_border_rounded);
    }
    final grouped = <String, List<FavoritesTableData>>{};
    for (final f in favorites) {
      grouped.putIfAbsent(f.type, () => []).add(f);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: grouped.entries.map((e) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${e.key}',
                style: GoogleFonts.inter(color: const Color(0xFFEC4899), fontSize: 11, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              ...e.value.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  '• ${f.value}',
                  style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 11, height: 1.3),
                ),
              )),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ── 24. LANGUAGES CONTENT ──
  Widget _buildLanguagesContent(List<LanguagesTableData> languages) {
    if (languages.isEmpty) {
      return _emptyPlaceholder('No languages added.', Icons.translate_rounded);
    }
    return Column(
      children: languages.map((l) {
        final overall = ((l.readingRating ?? 0) + (l.writingRating ?? 0) + (l.speakingRating ?? 0)) / 15.0;
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(l.language, style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                  Text('${(overall * 100).round()}%', style: GoogleFonts.inter(color: const Color(0xFF3B82F6), fontSize: 11, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 6),
              LinearProgressIndicator(
                value: overall.clamp(0.0, 1.0),
                backgroundColor: const Color(0xFF1E293B),
                color: const Color(0xFF3B82F6),
                minHeight: 6,
                borderRadius: BorderRadius.circular(3),
              ),
              const SizedBox(height: 4),
              Text(
                'Reading: ${l.readingRating ?? 0}/5  Writing: ${l.writingRating ?? 0}/5  Speaking: ${l.speakingRating ?? 0}/5',
                style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 9, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      }).toList(),
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

  // ── 7. TIMELINE CONTENT ──
  Widget _buildTimelineContent(List<TimelineTableData> events) {
    if (events.isEmpty) {
      return _emptyPlaceholder('No timeline events recorded.', Icons.timeline_rounded);
    }

    return Column(
      children: [
        Text(
          '${events.length} Life Milestones',
          style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...events.map((e) {
          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Timeline line + dot
                SizedBox(
                  width: 30,
                  child: Column(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF8B5CF6),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF8B5CF6).withAlpha(80),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 1,
                          color: const Color(0xFF8B5CF6).withAlpha(40),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Event card
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF090D1A),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFF1E293B)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (e.year != null)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF8B5CF6).withAlpha(20),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  '${e.year}',
                                  style: GoogleFonts.inter(color: const Color(0xFF8B5CF6), fontSize: 10, fontWeight: FontWeight.bold),
                                ),
                              ),
                            if (e.emotion != null && e.emotion!.isNotEmpty) ...[
                              const SizedBox(width: 6),
                              Text(_emojiForEmotion(e.emotion!), style: const TextStyle(fontSize: 14)),
                            ],
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          e.title ?? 'Event',
                          style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        if (e.location != null && e.location!.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined, color: const Color(0xFF64748B), size: 12),
                              const SizedBox(width: 3),
                              Text(
                                e.location!,
                                style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                        if (e.description != null && e.description!.isNotEmpty) ...[
                          const SizedBox(height: 6),
                          Text(
                            e.description!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 11, height: 1.4),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  String _emojiForEmotion(String emotion) {
    switch (emotion.toLowerCase()) {
      case 'happy': case 'joy': case 'excited': return '😊';
      case 'sad': case 'sorrow': return '😢';
      case 'challenging': case 'difficult': case 'hard': return '😤';
      case 'neutral': case 'calm': return '😐';
      case 'proud': return '🥹';
      case 'grateful': return '🙏';
      case 'hopeful': return '🌟';
      case 'stressful': case 'anxious': return '😰';
      default: return '📌';
    }
  }

  // ── 15. DAILY HABITS CONTENT ──
  Widget _buildDailyHabitsContent(DailyHabitsTableData? h) {
    if (h == null) {
      return _emptyPlaceholder('No daily habits recorded.', Icons.wb_sunny_outlined);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Schedule card
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
                  _habitPill(Icons.wb_sunny_outlined, 'Wake', h.wakeTime ?? '—', const Color(0xFFF59E0B)),
                  _habitPill(Icons.nightlight_round, 'Sleep', h.sleepTime ?? '—', const Color(0xFF3B82F6)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Morning Habits
        if (h.prayer != null || h.teaCoffee != null || h.exercise != null) ...[
          _habitSection('🌄 Morning', [
            if (h.prayer != null) _habitItem('Prayer', h.prayer!),
            if (h.teaCoffee != null) _habitItem('Tea/Coffee', h.teaCoffee!),
            if (h.exercise != null) _habitItem('Exercise', h.exercise!),
          ]),
          const SizedBox(height: 8),
        ],

        // Day Habits
        if (h.reading != null || h.coding != null) ...[
          _habitSection('☀️ Day', [
            if (h.reading != null) _habitItem('Reading', h.reading!),
            if (h.coding != null) _habitItem('Coding', h.coding!),
          ]),
          const SizedBox(height: 8),
        ],

        // Evening / Other
        if (h.meditationWalking != null || h.customHabits != null || h.smokingAlcohol != null) ...[
          _habitSection('🌆 Evening & Other', [
            if (h.meditationWalking != null) _habitItem('Meditation/Walking', h.meditationWalking!),
            if (h.smokingAlcohol != null) _habitItem('Smoking/Alcohol', h.smokingAlcohol!),
            if (h.customHabits != null) _habitItem('Custom Habits', h.customHabits!),
          ]),
        ],
      ],
    );
  }

  Widget _habitPill(IconData icon, String label, String value, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 11, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: GoogleFonts.inter(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _habitSection(String title, List<Widget> items) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...items,
        ],
      ),
    );
  }

  Widget _habitItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(Icons.check_circle_outline, color: const Color(0xFF10B981), size: 14),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 11, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Text(
            value,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  // ── 21. VALUES & BELIEFS CONTENT ──
  Widget _buildValuesBeliefsContent(ValuesBeliefsTableData? vb) {
    if (vb == null) {
      return _emptyPlaceholder('No values & beliefs recorded.', Icons.auto_awesome_rounded);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Religion
        if (vb.religion != null && vb.religion!.isNotEmpty)
          _buildInfoCard(
            '🕌 Religion',
            vb.religion!,
            const Color(0xFF10B981),
          ),
        const SizedBox(height: 10),

        // Core Values as chips
        if (vb.coreValues != null && vb.coreValues!.isNotEmpty) ...[
          Text(
            '💎 Core Values',
            style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: vb.coreValues!.split(',').map((v) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF10B981), Color(0xFF059669)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  v.trim(),
                  style: GoogleFonts.inter(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
        ],

        // Life Principles
        if (vb.lifePrinciples != null && vb.lifePrinciples!.isNotEmpty)
          _buildInfoCard('📜 Life Principles', vb.lifePrinciples!, const Color(0xFF7C3AED)),
        const SizedBox(height: 10),

        // Ethics
        if (vb.ethics != null && vb.ethics!.isNotEmpty)
          _buildInfoCard('⚖️ Ethics', vb.ethics!, const Color(0xFFEC4899)),
        const SizedBox(height: 10),

        // Always Do / Never Do side by side
        if ((vb.thingsAlwaysDo != null && vb.thingsAlwaysDo!.isNotEmpty) ||
            (vb.thingsNeverDo != null && vb.thingsNeverDo!.isNotEmpty)) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (vb.thingsAlwaysDo != null && vb.thingsAlwaysDo!.isNotEmpty)
                Expanded(
                  child: _buildInfoCard('✅ Always Do', vb.thingsAlwaysDo!, const Color(0xFF10B981)),
                ),
              if (vb.thingsAlwaysDo != null && vb.thingsAlwaysDo!.isNotEmpty &&
                  vb.thingsNeverDo != null && vb.thingsNeverDo!.isNotEmpty)
                const SizedBox(width: 8),
              if (vb.thingsNeverDo != null && vb.thingsNeverDo!.isNotEmpty)
                Expanded(
                  child: _buildInfoCard('❌ Never Do', vb.thingsNeverDo!, const Color(0xFFEF4444)),
                ),
            ],
          ),
          const SizedBox(height: 10),
        ],

        // Political Preference
        if (vb.politicalPreference != null && vb.politicalPreference!.isNotEmpty)
          _buildInfoCard('🗳️ Political', vb.politicalPreference!, const Color(0xFF3B82F6)),
      ],
    );
  }

  Widget _buildInfoCard(String title, String content, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(color: color, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            content,
            style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 11, height: 1.4),
          ),
        ],
      ),
    );
  }

  // ── 22. DECISION PROFILE CONTENT ──
  Widget _buildDecisionProfileContent(DecisionProfilesTableData? dp) {
    if (dp == null) {
      return _emptyPlaceholder('No decision profile recorded.', Icons.psychology_alt_rounded);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Decision Dimensions',
          style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildDecisionBar('Logic', dp.logicLevel, const Color(0xFF3B82F6)),
        _buildDecisionBar('Emotion', dp.emotionLevel, const Color(0xFFEC4899)),
        _buildDecisionBar('Faith', dp.faithLevel, const Color(0xFF10B981)),
        _buildDecisionBar('Research', dp.researchLevel, const Color(0xFFF59E0B)),
        _buildDecisionBar('Experience', dp.experienceLevel, const Color(0xFF8B5CF6)),
        _buildDecisionBar('Friends Influence', dp.friendsInfluence, const Color(0xFF06B6D4)),
        _buildDecisionBar('Family Influence', dp.familyInfluence, const Color(0xFFD946EF)),
        const SizedBox(height: 12),

        // Style cards
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          child: Column(
            children: [
              _buildDecisionStyle('Risk Level', dp.riskLevel),
              _buildDecisionStyle('Financial Style', dp.financialStyle),
              _buildDecisionStyle('Leadership', dp.leadershipStyle),
              _buildDecisionStyle('Conflict Handling', dp.conflictHandling),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDecisionBar(String label, int? value, Color color) {
    final clamped = ((value ?? 5).clamp(0, 10)) / 10.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 11, fontWeight: FontWeight.w500),
              ),
              Text(
                '$value/10',
                style: GoogleFonts.inter(color: color, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: clamped,
            backgroundColor: const Color(0xFF1E293B),
            color: color,
            minHeight: 6,
            borderRadius: BorderRadius.circular(3),
          ),
        ],
      ),
    );
  }

  Widget _buildDecisionStyle(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 11, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(
              value ?? '—',
              style: GoogleFonts.inter(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  // ── 25. FAVORITE WORDS CONTENT ──
  Widget _buildFavoriteWordsContent(List<FavoriteWordsTableData> words) {
    if (words.isEmpty) {
      return _emptyPlaceholder('No favorite words saved.', Icons.chat_bubble_outline_rounded);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${words.length} Cherished Words',
          style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: words.map((w) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF090D1A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFD946EF).withAlpha(80),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFD946EF).withAlpha(15),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.auto_awesome, color: const Color(0xFFD946EF), size: 12),
                  const SizedBox(width: 6),
                  Text(
                    w.word,
                    style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // ── 26. PRIVACY CONTENT ──
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

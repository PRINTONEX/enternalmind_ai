import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/ui_constants.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../dashboard/providers/dashboard_providers.dart';
import '../../wizard/models/wizard_models.dart';
import '../../wizard/providers/wizard_providers.dart';
import '../providers/profile_providers.dart';
import 'widgets/profile_sections.dart';

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
                        content: ProfileIdentitySection(
                          profile: profile,
                          fullNameCtrl: _fullNameCtrl,
                          nicknameCtrl: _nicknameCtrl,
                          birthPlaceCtrl: _birthPlaceCtrl,
                          currentCityCtrl: _currentCityCtrl,
                          nationalityCtrl: _nationalityCtrl,
                          occupationCtrl: _occupationCtrl,
                          quoteCtrl: _quoteCtrl,
                          aboutCtrl: _aboutCtrl,
                        ),
                      ),
                      _buildSpacing(),

                      // Section 2: Life Stories
                      _buildSectionWrapper(
                        index: 1,
                        icon: Icons.menu_book_outlined,
                        title: 'Life Stories',
                        description: 'Write, structure, and explore your memory chapters.',
                        color: const Color(0xFF06B6D4),
                        content: const ProfileLifeStoriesSection(),
                      ),
                      _buildSpacing(),

                      // Section 3: Guided Interview
                      _buildSectionWrapper(
                        index: 2,
                        icon: Icons.question_answer_outlined,
                        title: 'Guided Interview',
                        description: 'Answer deep questions to detail your neural double.',
                        color: const Color(0xFFEC4899),
                        content: const ProfileGuidedInterviewSection(),
                      ),
                      _buildSpacing(),

                      // Section 4: Daily Journal
                      _buildSectionWrapper(
                        index: 3,
                        icon: Icons.edit_note_rounded,
                        title: 'Daily Journal',
                        description: 'Record your daily thoughts, mood, and achievements.',
                        color: const Color(0xFF10B981),
                        content: const ProfileDailyJournalSection(),
                      ),
                      _buildSpacing(),

                      // Section 5: Family Tree
                      _buildSectionWrapper(
                        index: 4,
                        icon: Icons.account_tree_outlined,
                        title: 'Family Tree',
                        description: 'Add family relations and map your ancestry.',
                        color: const Color(0xFF3B82F6),
                        content: const ProfileFamilyTreeSection(),
                      ),
                      _buildSpacing(),

                      // Section 6: Life Map
                      _buildSectionWrapper(
                        index: 5,
                        icon: Icons.map_outlined,
                        title: 'Life Map',
                        description: 'Pin the key locations of your milestones.',
                        color: const Color(0xFFF59E0B),
                        content: const ProfileLifeMapSection(),
                      ),
                      _buildSpacing(),

                      // Section 7: Memories
                      _buildSectionWrapper(
                        index: 6,
                        icon: Icons.photo_library_outlined,
                        title: 'Memories',
                        description: 'Archive specific memory nodes, tags, and links.',
                        color: const Color(0xFFD946EF),
                        content: const ProfileMemoriesSection(),
                      ),
                      _buildSpacing(),

                      // Section 8: Photo Albums
                      _buildSectionWrapper(
                        index: 7,
                        icon: Icons.collections_bookmark_outlined,
                        title: 'Photo Albums',
                        description: 'Manage photo collections and memories visual grids.',
                        color: const Color(0xFF00E5FF),
                        content: const ProfilePhotoAlbumsSection(),
                      ),
                      _buildSpacing(),

                      // Section 9: Voice Vault
                      _buildSectionWrapper(
                        index: 8,
                        icon: Icons.keyboard_voice_outlined,
                        title: 'Voice Vault',
                        description: 'Train your speech synthesizer and record samples.',
                        color: const Color(0xFF7C3AED),
                        content: const ProfileVoiceVaultSection(),
                      ),
                      _buildSpacing(),

                      // Section 10: Documents
                      _buildSectionWrapper(
                        index: 9,
                        icon: Icons.description_outlined,
                        title: 'Documents',
                        description: 'Attach certificates, letters, and text files.',
                        color: const Color(0xFF10B981),
                        content: const ProfileDocumentsSection(),
                      ),
                      _buildSpacing(),

                      // Section 11: Legacy Messages
                      _buildSectionWrapper(
                        index: 10,
                        icon: Icons.forward_to_inbox_outlined,
                        title: 'Legacy Messages',
                        description: 'Schedule messages for release to loved ones.',
                        color: const Color(0xFFEC4899),
                        content: const ProfileLegacyMessagesSection(),
                      ),
                      _buildSpacing(),

                      // Section 12: Career
                      _buildSectionWrapper(
                        index: 11,
                        icon: Icons.work_outline_rounded,
                        title: 'Career',
                        description: 'Review and edit your professional work experience.',
                        color: const Color(0xFF3B82F6),
                        content: const ProfileCareerSection(),
                      ),
                      _buildSpacing(),

                      // Section 13: Education
                      _buildSectionWrapper(
                        index: 12,
                        icon: Icons.school_outlined,
                        title: 'Education',
                        description: 'Display academic degrees and certificates.',
                        color: const Color(0xFF06B6D4),
                        content: const ProfileEducationSection(),
                      ),
                      _buildSpacing(),

                      // Section 14: Timeline
                      _buildSectionWrapper(
                        index: 13,
                        icon: Icons.timeline_rounded,
                        title: 'Timeline Milestones',
                        description: '${timelineAsync.valueOrNull?.length ?? 0} milestones.',
                        color: const Color(0xFF8B5CF6),
                        content: ProfileTimelineSection(events: timelineAsync.valueOrNull ?? []),
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
                        content: ProfileDailyHabitsSection(habits: dailyHabitsAsync.valueOrNull),
                      ),
                      _buildSpacing(),

                      // Section 16: Skills
                      _buildSectionWrapper(
                        index: 15,
                        icon: Icons.psychology_outlined,
                        title: 'Skills & Expertise',
                        description: '${skillsAsync.valueOrNull?.length ?? 0} skills defined.',
                        color: const Color(0xFFF59E0B),
                        content: ProfileSkillsSection(skills: skillsAsync.valueOrNull ?? []),
                      ),
                      _buildSpacing(),

                      // Section 17: Interests
                      _buildSectionWrapper(
                        index: 16,
                        icon: Icons.favorite_border_rounded,
                        title: 'Interests',
                        description: '${interestsAsync.valueOrNull?.length ?? 0} interests listed.',
                        color: const Color(0xFFD946EF),
                        content: ProfileInterestsSection(interests: interestsAsync.valueOrNull ?? []),
                      ),
                      _buildSpacing(),

                      // Section 18: Goals
                      _buildSectionWrapper(
                        index: 17,
                        icon: Icons.flag_outlined,
                        title: 'Goals & Aspirations',
                        description: '${goalsAsync.valueOrNull?.length ?? 0} goals set.',
                        color: const Color(0xFF00E5FF),
                        content: ProfileGoalsSection(goals: goalsAsync.valueOrNull ?? []),
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
                        content: ProfilePersonalitySection(traits: traitsAsync.valueOrNull),
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
                        content: ProfileAIPersonalitySection(styles: stylesAsync.valueOrNull),
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
                        content: ProfileValuesBeliefsSection(values: valuesBeliefsAsync.valueOrNull),
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
                        content: ProfileDecisionProfileSection(decisions: decisionProfilesAsync.valueOrNull),
                      ),
                      _buildSpacing(),

                      // Section 23: Favorites
                      _buildSectionWrapper(
                        index: 22,
                        icon: Icons.star_border_rounded,
                        title: 'Favorites',
                        description: '${favoritesAsync.valueOrNull?.length ?? 0} favorites saved.',
                        color: const Color(0xFFEC4899),
                        content: ProfileFavoritesSection(favorites: favoritesAsync.valueOrNull ?? []),
                      ),
                      _buildSpacing(),

                      // Section 24: Languages
                      _buildSectionWrapper(
                        index: 23,
                        icon: Icons.translate_rounded,
                        title: 'Languages',
                        description: '${languagesAsync.valueOrNull?.length ?? 0} languages added.',
                        color: const Color(0xFF3B82F6),
                        content: ProfileLanguagesSection(languages: languagesAsync.valueOrNull ?? []),
                      ),
                      _buildSpacing(),

                      // Section 25: Favorite Words
                      _buildSectionWrapper(
                        index: 24,
                        icon: Icons.chat_bubble_outline_rounded,
                        title: 'Favorite Words',
                        description: '${favoriteWordsAsync.valueOrNull?.length ?? 0} cherished words.',
                        color: const Color(0xFFD946EF),
                        content: ProfileFavoriteWordsSection(words: favoriteWordsAsync.valueOrNull ?? []),
                      ),
                      _buildSpacing(),

                      // Section 26: Privacy & Settings
                      _buildSectionWrapper(
                        index: 25,
                        icon: Icons.lock_outline_rounded,
                        title: 'Privacy & Security',
                        description: 'Configure local encryption, permissions, and backups.',
                        color: const Color(0xFF64748B),
                        content: const ProfilePrivacySection(),
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
}

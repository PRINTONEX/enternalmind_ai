/// {@template dashboard_screen}
/// Dashboard — the main hub after login/import.
///
/// Sections: Top Header, Hero Card, Quick Actions, Statistics Row,
/// Explore Cards, Privacy Banner, Bottom Navigation.
/// UI ONLY — no business logic.
/// {@endtemplate}
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/ui_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/glass_card.dart';
import '../../wizard/models/wizard_models.dart';
import '../providers/dashboard_providers.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/route_names.dart';
import '../../chat/presentation/chat_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../memories/presentation/memories_screen.dart';

/// {@macro dashboard_screen}
class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int _currentNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    // ── Realtime data streams ──
    final profileAsync = ref.watch(dashProfileProvider);
    final familyCountAsync = ref.watch(dashFamilyCountProvider);
    final educationCountAsync = ref.watch(dashEducationCountProvider);
    final careerCountAsync = ref.watch(dashCareerCountProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF03050A),
      body: Stack(
        children: [
          // ── Subtle blue radial glow ──
          if (_currentNavIndex == 0)
            Positioned(
              top: -120,
              left: -80,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 0.7,
                    colors: [
                      const Color(0xFF3B82F6).withAlpha(12),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

          // ── Main Content ──
          SafeArea(
            child: Column(
              children: [
                if (_currentNavIndex == 0) ...[
                  // ── Top Header ──
                  _buildHeader(profileAsync),

                  // ── Scrollable Body ──
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: Spacing.md),

                          // ── Hero Card ──
                          _buildHeroCard(profileAsync),

                          const SizedBox(height: Spacing.lg),

                          // ── Quick Actions ──
                          _buildQuickActions(),

                          const SizedBox(height: Spacing.lg),

                          // ── Statistics Row ──
                          _buildStatisticsRow(
                            profileAsync,
                            familyCountAsync,
                            educationCountAsync,
                            careerCountAsync,
                          ),

                          const SizedBox(height: Spacing.lg),

                          // ── Explore Title ──
                          const Text(
                            'Explore',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          const SizedBox(height: Spacing.md),

                          // ── Explore Cards ──
                          _buildExploreSection(),

                          const SizedBox(height: Spacing.lg),

                          // ── Privacy Banner ──
                          _buildPrivacyBanner(),

                          const SizedBox(height: 100), // space for bottom nav
                        ],
                      ),
                    ),
                  ),
                ] else if (_currentNavIndex == 1) ...[
                  // ── Chat Screen ──
                  const Expanded(
                    child: ChatScreen(),
                  ),
                ] else if (_currentNavIndex == 3) ...[
                  const Expanded(
                    child: ProfileScreen(),
                  ),
                ] else ...[
                  const Expanded(
                    child: MemoriesScreen(),
                  ),
                ],
              ],
            ),
          ),

          // ── Bottom Navigation ──
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildBottomNav(),
          ),
        ],
      ),
    );
  }

  // ── Header ──
  Widget _buildHeader(AsyncValue<ProfileModel?> profileAsync) {
    final profile = profileAsync.valueOrNull;
    final initial = profile != null && profile.fullName.isNotEmpty
        ? profile.fullName[0].toUpperCase()
        : 'A';

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.lg,
        vertical: Spacing.sm,
      ),
      child: Row(
        children: [
          // Hamburger
          GestureDetector(
            onTap: () => context.push(RouteNames.settings),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.surfaceGlass,
                borderRadius: BorderRadius.circular(RadiusConstants.sm),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: const Icon(Icons.menu_rounded, color: Colors.white, size: 20),
            ),
          ),
          const SizedBox(width: Spacing.md),

          // Title
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF7C3AED), Color(0xFF06B6D4)],
                ).createShader(bounds),
                child: const Text(
                  'EternalMind AI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                'Digital Human Replica',
                style: TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 11,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Notification bell
          Stack(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.surfaceGlass,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.white70,
                  size: 20,
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF7C3AED),
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: Spacing.sm),

          // Avatar
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF7C3AED), Color(0xFF06B6D4)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF7C3AED).withAlpha(51),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Center(
              child: Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF1A1F33),
                ),
                child: Center(
                  child: Text(
                    initial,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Hero Card ──
  Widget _buildHeroCard(AsyncValue<ProfileModel?> profileAsync) {
    final profile = profileAsync.valueOrNull;
    final name = profile?.fullName.isNotEmpty == true
        ? profile!.fullName
        : 'Aftab Shah';
    final initial = name.isNotEmpty ? name[0].toUpperCase() : 'A';
    final quote = profile?.favoriteQuotes?.isNotEmpty == true
        ? profile!.favoriteQuotes!
        : (profile?.lifePhilosophy?.isNotEmpty == true
            ? profile!.lifePhilosophy!
            : '"Technology should improve people\'s lives."');
    final birthDateStr = profile?.birthDate != null
        ? '${profile!.birthDate!.day.toString().padLeft(2, '0')} ${_getMonthName(profile.birthDate!.month)} ${profile.birthDate!.year}'
        : '04 Dec 1997';
    final location = profile?.currentCity?.isNotEmpty == true
        ? profile!.currentCity!
        : (profile?.birthPlace?.isNotEmpty == true
            ? profile!.birthPlace!
            : 'Thoubal');

    return GlassCard(
      borderRadius: 24,
      padding: const EdgeInsets.all(Spacing.lg),
      glowColor: const Color(0xFF7C3AED).withAlpha(60),
      variant: GlassCardVariant.hero,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left — Profile info
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar with ring
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF7C3AED), Color(0xFF06B6D4)],
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 58,
                          height: 58,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF111827),
                          ),
                          child: Center(
                            child: Text(
                              initial,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: Spacing.md),
                    const Text(
                      'Welcome back,',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF3B82F6),
                          ),
                          child: const Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 10,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      quote,
                      style: const TextStyle(
                        color: AppColors.textTertiary,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: Spacing.md),
                    Row(
                      children: [
                        _miniInfoCard(Icons.cake_outlined, birthDateStr),
                        const SizedBox(width: Spacing.sm),
                        _miniInfoCard(
                            Icons.location_on_outlined, location),
                      ],
                    ),
                  ],
                ),
              ),

              // Right — Brain illustration area
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    // Brain icon
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF7C3AED).withAlpha(26),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF7C3AED).withAlpha(26),
                            blurRadius: 20,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.psychology_rounded,
                        color: Color(0xFF7C3AED),
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: Spacing.sm),
                    // Floating action icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _miniAction(Icons.person_outline, 'Profile'),
                        _miniAction(Icons.photo_library_outlined, 'Gallery'),
                        _miniAction(Icons.description_outlined, 'Docs'),
                        _miniAction(Icons.perm_media_outlined, 'Media'),
                      ],
                    ),
                    const SizedBox(height: Spacing.md),
                    // View Profile button
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.md,
                        vertical: Spacing.xs + 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFF7C3AED).withAlpha(128),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'View My Profile',
                            style: TextStyle(
                              color: Color(0xFF7C3AED),
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            color: Color(0xFF7C3AED),
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _miniInfoCard(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.sm,
        vertical: Spacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceGlass,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFF06B6D4), size: 12),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _miniAction(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: AppColors.textTertiary, size: 18),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textTertiary,
            fontSize: 8,
          ),
        ),
      ],
    );
  }

  // ── Quick Actions ──
  Widget _buildQuickActions() {
    final actions = [
      ('Chat', Icons.chat_bubble_outline, const Color(0xFF7C3AED)),
      ('Voice', Icons.mic_outlined, const Color(0xFF06B6D4)),
      ('Memory', Icons.memory_outlined, const Color(0xFF10B981)),
      ('Mic', Icons.radio_button_checked, const Color(0xFFEC4899)),
      ('Journal', Icons.book_outlined, const Color(0xFF3B82F6)),
    ];

    return GlassCard(
      borderRadius: 20,
      padding: const EdgeInsets.all(Spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Quick Actions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Customize',
                style: TextStyle(
                  color: const Color(0xFF06B6D4).withAlpha(180),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: Spacing.lg),
          Row(
            children: actions.map((a) {
              return Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: Spacing.md,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceGlass,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.glassBorder),
                      ),
                      child: Column(
                        children: [
                          Icon(a.$2, color: a.$3, size: 24),
                          const SizedBox(height: 6),
                          Text(
                            a.$1,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Action',
                            style: TextStyle(
                              color: AppColors.textTertiary,
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // ── Statistics Row ──
  Widget _buildStatisticsRow(
    AsyncValue<ProfileModel?> profileAsync,
    AsyncValue<int> familyCountAsync,
    AsyncValue<int> educationCountAsync,
    AsyncValue<int> careerCountAsync,
  ) {
    final profileExists = profileAsync.valueOrNull != null ? '1' : '0';
    final familyCount = familyCountAsync.valueOrNull ?? 0;
    final educationCount = educationCountAsync.valueOrNull ?? 0;
    final careerCount = careerCountAsync.valueOrNull ?? 0;

    final stats = [
      ('Profile', Icons.person_outline, profileExists),
      ('Family', Icons.family_restroom_outlined, '$familyCount'),
      ('Education', Icons.school_outlined, '$educationCount'),
      ('Career', Icons.work_outline, '$careerCount'),
      ('Memories', Icons.memory_outlined, '0'),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Spacing.md,
        horizontal: Spacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceGlass,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        children: List.generate(stats.length, (index) {
          return Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Icon(stats[index].$2,
                          color: _statColor(index), size: 18),
                      const SizedBox(height: 4),
                      Text(
                        stats[index].$3,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        stats[index].$1,
                        style: TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ),
                if (index < stats.length - 1)
                  Container(
                    width: 1,
                    height: 32,
                    color: AppColors.glassBorder,
                  ),
              ],
            ),
          );
        }),
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

  Color _statColor(int index) {
    const colors = [
      Color(0xFF7C3AED),
      Color(0xFFEC4899),
      Color(0xFF3B82F6),
      Color(0xFF10B981),
      Color(0xFFF59E0B),
    ];
    return colors[index % colors.length];
  }

  // ── Explore Section ──
  Widget _buildExploreSection() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _exploreCard(0)),
            const SizedBox(width: Spacing.md),
            Expanded(child: _exploreCard(1)),
            const SizedBox(width: Spacing.md),
            Expanded(child: _exploreCard(2)),
          ],
        ),
        const SizedBox(height: Spacing.md),
        Row(
          children: [
            Expanded(child: _exploreCard(3)),
            const SizedBox(width: Spacing.md),
            Expanded(child: _exploreCard(4)),
            const SizedBox(width: Spacing.md),
            Expanded(child: _exploreCard(5)),
          ],
        ),
      ],
    );
  }

  Widget _exploreCard(int index) {
    final cards = [
      ('Neural Chat', Icons.chat_bubble_rounded, const Color(0xFF7C3AED),
          '3 New', 'Chat with your\ndigital human'),
      ('Memory Vault', Icons.memory_rounded, const Color(0xFF10B981), '',
          'Browse your\nmemories'),
      ('Timeline', Icons.timeline_rounded, const Color(0xFFEC4899), '',
          'Your life\nmilestones'),
      ('Family Tree', Icons.account_tree_rounded, const Color(0xFF3B82F6), '',
          'View family\nconnections'),
      ('Voice Space', Icons.mic_rounded, const Color(0xFF7C3AED), '',
          'Voice recordings\n& settings'),
      ('AI Providers', Icons.cloud_rounded, const Color(0xFF10B981), '',
          'Manage AI\nproviders'),
    ];

    final card = cards[index];

    return GestureDetector(
      onTap: () {
        if (index == 0) {
          setState(() => _currentNavIndex = 1);
        } else if (index == 1) {
          context.push(RouteNames.memories);
        } else if (index == 2) {
          context.push(RouteNames.timeline);
        } else if (index == 3) {
          context.push(RouteNames.familyTree);
        } else if (index == 4) {
          context.push(RouteNames.voiceSpace);
        } else if (index == 5) {
          context.push(RouteNames.aiProviders);
        }
      },
      child: GlassCard(
        borderRadius: 16,
        padding: const EdgeInsets.all(Spacing.md),
        glowColor: card.$3.withAlpha(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(card.$2, color: card.$3, size: 22),
                if (card.$4.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: card.$3.withAlpha(30),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      card.$4,
                      style: TextStyle(
                        color: card.$3,
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: Spacing.sm),
            Text(
              card.$1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              card.$5,
              style: TextStyle(
                color: AppColors.textTertiary,
                fontSize: 9,
                height: 1.3,
              ),
            ),
            const SizedBox(height: Spacing.sm),
            Text(
              'Open →',
              style: TextStyle(
                color: card.$3,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Privacy Banner ──
  Widget _buildPrivacyBanner() {
    return GlassCard(
      borderRadius: 20,
      padding: const EdgeInsets.all(Spacing.lg),
      glowColor: const Color(0xFF7C3AED).withAlpha(30),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF7C3AED).withAlpha(26),
            ),
            child: const Icon(
              Icons.shield_rounded,
              color: Color(0xFF7C3AED),
              size: 20,
            ),
          ),
          const SizedBox(width: Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your data is private & secure',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'All data is stored locally on your device.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: AppColors.textTertiary,
            size: 20,
          ),
        ],
      ),
    );
  }

  // ── Bottom Navigation ──
  Widget _buildBottomNav() {
    final items = [
      ('Dashboard', Icons.grid_view_rounded, 0),
      ('Chat', Icons.chat_bubble_outline_rounded, 1),
      ('', Icons.add_rounded, -1), // center FAB
      ('Memories', Icons.memory_outlined, 2),
      ('Profile', Icons.person_outline_rounded, 3),
    ];

    return Container(
      margin: const EdgeInsets.fromLTRB(
        Spacing.lg,
        0,
        Spacing.lg,
        Spacing.sm,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.sm,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceGlass,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: AppColors.glassBorderLight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          if (item.$3 == -1) {
            // Center FAB
            return Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFF7C3AED), Color(0xFF06B6D4)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF7C3AED).withAlpha(77),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 24,
              ),
            );
          }

          final isActive = _currentNavIndex == item.$3;
          return GestureDetector(
            onTap: () {
              setState(() => _currentNavIndex = item.$3);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item.$2,
                  color: isActive
                      ? const Color(0xFF7C3AED)
                      : AppColors.textTertiary,
                  size: 20,
                ),
                Text(
                  item.$1,
                  style: TextStyle(
                    color: isActive
                        ? const Color(0xFF7C3AED)
                        : AppColors.textTertiary,
                    fontSize: 9,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

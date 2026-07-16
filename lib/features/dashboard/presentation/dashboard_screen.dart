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

import '../../wizard/models/wizard_models.dart';
import '../providers/dashboard_providers.dart';
import '../../ai_providers/providers/ai_providers_providers.dart';
import '../../ai_providers/models/ai_provider_model.dart';
import '../../ai_providers/core/constants.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/route_names.dart';
import '../../chat/presentation/chat_screen.dart';
import '../../memories/presentation/memories_screen.dart';
import '../../settings/presentation/settings_screen.dart';

/// {@macro dashboard_screen}
class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int _currentNavIndex = 0;
  bool _showProfileCard = false;

  // Scaling helper to dynamically adjust sizes based on screen width
  double _scale(double size) {
    final factor = context.width / 375.0; // 375 is standard base width (e.g. iPhone)
    return size * factor.clamp(0.75, 1.25);
  }

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
          // ── Subtle blue/purple radial glows ──
          if (_currentNavIndex == 0) ...[
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
            Positioned(
              top: -100,
              right: -60,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 0.7,
                    colors: [
                      const Color(0xFF7C3AED).withAlpha(10),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],

          // ── Main Content ──
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                if (_currentNavIndex == 0) ...[
                  // ── Top Header ──
                  _buildHeader(profileAsync),

                  // ── Scrollable Body ──
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: _scale(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: _scale(4)),

                          // ── Hero Card ──
                          AnimatedSize(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeInOut,
                            child: _showProfileCard
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _buildHeroCard(profileAsync),
                                      SizedBox(height: _scale(16)),
                                    ],
                                  )
                                : const SizedBox.shrink(),
                          ),

                          // ── Quick Actions ──
                          _buildQuickActions(),

                          SizedBox(height: _scale(16)),

                          // ── Statistics Row ──
                          _buildStatisticsRow(
                            profileAsync,
                            familyCountAsync,
                            educationCountAsync,
                            careerCountAsync,
                          ),

                          SizedBox(height: _scale(16)),

                          // ── Explore Title ──
                          Text(
                            'Explore',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _scale(18),
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: _scale(12)),

                          // ── Explore Cards ──
                          _buildExploreSection(),

                          SizedBox(height: _scale(16)),

                          // ── Privacy Banner ──
                          _buildPrivacyBanner(),

                          SizedBox(height: 120), // space for bottom nav
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
                    child: SettingsScreen(),
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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _scale(16),
        vertical: _scale(8),
      ),
      child: Row(
        children: [
          // Custom Menu Button
          GestureDetector(
            onTap: () {
              // Menu drawer/popup placeholder or no-op as Settings is now in navbar
            },
            child: Container(
              width: _scale(42),
              height: _scale(42),
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A).withAlpha(180),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF1E293B)),
              ),
              padding: EdgeInsets.symmetric(horizontal: _scale(11), vertical: _scale(13)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: _scale(18), height: 2, color: Colors.white),
                  Container(width: _scale(12), height: 2, color: Colors.white),
                  Container(width: _scale(6), height: 2, color: Colors.white),
                ],
              ),
            ),
          ),
          SizedBox(width: _scale(12)),

          // Title
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'EternalMind AI',
                style: TextStyle(
                  color: const Color(0xFFC084FC),
                  fontSize: _scale(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Digital Human Replica',
                style: TextStyle(
                  color: const Color(0xFF94A3B8).withAlpha(180),
                  fontSize: _scale(11),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Notification Bell
          GestureDetector(
            onTap: () {},
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.white,
                  size: _scale(26),
                ),
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    width: _scale(14),
                    height: _scale(14),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF7C3AED),
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _scale(8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: _scale(12)),

          GestureDetector(
            onTap: () => setState(() => _showProfileCard = !_showProfileCard),
            child: Container(
              width: _scale(40),
              height: _scale(40),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFF8B5CF6), Color(0xFF06B6D4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF0D111C),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/avatars/aftab.png',
                    fit: BoxFit.cover,
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
    final quote = profile?.favoriteQuotes?.isNotEmpty == true
        ? profile!.favoriteQuotes!
        : 'I exist to learn, remember and grow just like you.';
    final birthDateStr = profile?.birthDate != null
        ? '${profile!.birthDate!.day.toString().padLeft(2, '0')} ${_getMonthName(profile.birthDate!.month)} ${profile.birthDate!.year}'
        : '04 Dec 1997';
    final location = profile?.currentCity?.isNotEmpty == true
        ? profile!.currentCity!
        : (profile?.birthPlace?.isNotEmpty == true
            ? profile!.birthPlace!
            : 'Phoudel, Manipur');

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(_scale(16)),
      decoration: BoxDecoration(
        color: const Color(0xFF070B16).withAlpha(220),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF1E293B),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7C3AED).withAlpha(20),
            blurRadius: 16,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side: User details (flex 7)
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Avatar
                    Container(
                      width: _scale(76),
                      height: _scale(76),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFF8B5CF6), Color(0xFF06B6D4)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      padding: const EdgeInsets.all(2.5),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0D111C),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/avatars/aftab.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: _scale(12)),
                    // Text Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back,',
                            style: TextStyle(
                              color: const Color(0xFF94A3B8),
                              fontSize: _scale(12),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: _scale(18),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 5),
                              // Verification badge
                              Container(
                                padding: const EdgeInsets.all(1.5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF3B82F6),
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: _scale(9),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '“$quote”',
                            style: TextStyle(
                              color: const Color(0xFF64748B),
                              fontSize: _scale(11),
                              fontStyle: FontStyle.italic,
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: _scale(20)),
                // Info Cards
                Row(
                  children: [
                    Expanded(
                      child: _buildMiniCard(
                        icon: Icons.calendar_today_outlined,
                        title: 'Born',
                        value: birthDateStr,
                      ),
                    ),
                    SizedBox(width: _scale(8)),
                    Expanded(
                      child: _buildMiniCard(
                        icon: Icons.location_on_outlined,
                        title: 'From',
                        value: location,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: _scale(8)),
          // Right side: Brain Art + Button (flex 5)
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Neon brain graphic with floating icons
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      'assets/illustrations/neon_brain.png',
                      height: _scale(96),
                      fit: BoxFit.contain,
                    ),
                    // Floating icons around the brain
                    Positioned(
                      left: _scale(-12),
                      top: _scale(25),
                      child: _miniFloatingIcon(Icons.person_outline, const Color(0xFFC084FC)),
                    ),
                    Positioned(
                      left: _scale(8),
                      top: _scale(-2),
                      child: _miniFloatingIcon(Icons.description_outlined, const Color(0xFFC084FC)),
                    ),
                    Positioned(
                      left: _scale(2),
                      top: _scale(55),
                      child: _miniFloatingIcon(Icons.description_outlined, const Color(0xFFC084FC)),
                    ),
                    Positioned(
                      right: _scale(-8),
                      top: _scale(8),
                      child: _miniFloatingIcon(Icons.image_outlined, const Color(0xFFC084FC)),
                    ),
                    Positioned(
                      right: _scale(-8),
                      top: _scale(40),
                      child: _miniFloatingIcon(Icons.image_outlined, const Color(0xFFC084FC)),
                    ),
                    Positioned(
                      right: _scale(-12),
                      top: _scale(68),
                      child: _miniFloatingIcon(Icons.description_outlined, const Color(0xFFC084FC)),
                    ),
                  ],
                ),
                SizedBox(height: _scale(16)),
                // View My Profile button
                GestureDetector(
                  onTap: () => context.push(
                    RouteNames.profileDetail.replaceAll(':id', 'active'),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: _scale(12), vertical: _scale(7)),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F172A).withAlpha(128),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF8B5CF6), width: 1),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'View My Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: _scale(10),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: _scale(4)),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: _scale(11),
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

  Widget _buildMiniCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _scale(10), vertical: _scale(8)),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withAlpha(120),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF0EA5E9), size: _scale(14)),
          SizedBox(width: _scale(8)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF64748B),
                    fontSize: _scale(9),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: _scale(10),
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _miniFloatingIcon(IconData icon, Color color) {
    return Container(
      width: _scale(18),
      height: _scale(18),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0F19).withAlpha(200),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: color.withAlpha(100), width: 0.8),
      ),
      child: Center(
        child: Icon(
          icon,
          color: color,
          size: _scale(10),
        ),
      ),
    );
  }

  // ── Quick Actions ──
  Widget _buildQuickActions() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(_scale(16)),
      decoration: BoxDecoration(
        color: const Color(0xFF070B16).withAlpha(220),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF1E293B),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quick Actions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: _scale(16),
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.edit_outlined,
                      color: const Color(0xFF0EA5E9),
                      size: _scale(13),
                    ),
                    SizedBox(width: _scale(4)),
                    Text(
                      'Customize',
                      style: TextStyle(
                        color: const Color(0xFF0EA5E9),
                        fontSize: _scale(12),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: _scale(16)),
          Row(
            children: [
              _buildQuickActionCard(
                title: 'Chat with AI',
                subtitle: 'Start a conversation',
                icon: Icons.chat_bubble_outline_rounded,
                color: const Color(0xFFC084FC),
                onTap: () => setState(() => _currentNavIndex = 1),
              ),
              _buildQuickActionCard(
                title: 'Voice Chat',
                subtitle: 'Talk in real-time',
                icon: Icons.graphic_eq_rounded,
                color: const Color(0xFFC084FC),
                onTap: () => context.push(RouteNames.voiceSpace),
              ),
              _buildQuickActionCard(
                title: 'Add Memory',
                subtitle: 'Save a memory',
                icon: Icons.add_circle_outline_rounded,
                color: const Color(0xFF2DD4BF),
                onTap: () => context.push(RouteNames.memories),
              ),
              _buildQuickActionCard(
                title: 'Record Voice',
                subtitle: 'Update my voice',
                icon: Icons.mic_none_outlined,
                color: const Color(0xFFEC4899),
                onTap: () => context.push(RouteNames.voiceSpace),
              ),
              _buildQuickActionCard(
                title: 'New Journal',
                subtitle: 'Write journal entry',
                icon: Icons.menu_book_outlined,
                color: const Color(0xFFC084FC),
                onTap: () => context.push(RouteNames.memories),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2.0),
          padding: EdgeInsets.symmetric(vertical: _scale(10), horizontal: 2),
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A).withAlpha(120),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFF1E293B),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: _scale(20)),
              SizedBox(height: _scale(6)),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: _scale(8.5),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  color: const Color(0xFF64748B),
                  fontSize: _scale(6.5),
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatisticsRow(
    AsyncValue<ProfileModel?> profileAsync,
    AsyncValue<int> familyCountAsync,
    AsyncValue<int> educationCountAsync,
    AsyncValue<int> careerCountAsync,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _scale(12), vertical: _scale(10)),
      decoration: BoxDecoration(
        color: const Color(0xFF070B16).withAlpha(180),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatItem(
            icon: Icons.psychology_outlined,
            iconColor: const Color(0xFFC084FC),
            label: 'Memories',
            value: '10',
          ),
          _buildStatItem(
            icon: Icons.chat_bubble_outline_rounded,
            iconColor: const Color(0xFF0EA5E9),
            label: 'Conversations',
            value: '128',
          ),
          _buildStatItem(
            icon: Icons.image_outlined,
            iconColor: const Color(0xFF2DD4BF),
            label: 'Photos',
            value: '23',
          ),
          _buildStatItem(
            icon: Icons.description_outlined,
            iconColor: const Color(0xFFC084FC),
            label: 'Documents',
            value: '15',
          ),
          _buildStatItem(
            icon: Icons.apps_rounded,
            iconColor: const Color(0xFF3B82F6),
            label: 'More',
            value: '',
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: _scale(16)),
          SizedBox(width: _scale(4)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: const Color(0xFF64748B),
                    fontSize: _scale(8),
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (value.isNotEmpty) ...[
                  const SizedBox(height: 1),
                  Text(
                    value,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: _scale(12),
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
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

  // ── Explore Section ──
  Widget _buildExploreSection() {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _buildExploreCard(0)),
              SizedBox(width: _scale(8)),
              Expanded(child: _buildExploreCard(1)),
              SizedBox(width: _scale(8)),
              Expanded(child: _buildExploreCard(2)),
            ],
          ),
        ),
        SizedBox(height: _scale(8)),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _buildExploreCard(3)),
              SizedBox(width: _scale(8)),
              Expanded(child: _buildExploreCard(4)),
              SizedBox(width: _scale(8)),
              Expanded(child: _buildExploreCard(5)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExploreCard(int index) {
    switch (index) {
      case 0:
        return _buildNeuralChatCard();
      case 1:
        return _buildMemoryVaultCard();
      case 2:
        return _buildTimelineCard();
      case 3:
        return _buildFamilyTreeCard();
      case 4:
        return _buildVoiceSpaceCard();
      case 5:
        return _buildAIProvidersCard();
      default:
        return const SizedBox();
    }
  }

  Widget _buildNeuralChatCard() {
    return Container(
      padding: EdgeInsets.all(_scale(10)),
      decoration: BoxDecoration(
        color: const Color(0xFF070B16),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.chat_bubble_outline_rounded, color: const Color(0xFFC084FC), size: _scale(20)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFEC4899).withAlpha(40),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  '3 New',
                  style: TextStyle(
                    color: Color(0xFFEC4899),
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: _scale(10)),
          Text(
            'Neural Chat',
            style: TextStyle(color: Colors.white, fontSize: _scale(11.5), fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(
            'Chat with your AI replica',
            style: TextStyle(color: const Color(0xFF64748B), fontSize: _scale(8)),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          _buildCardButton(
            label: 'Open Chat',
            color: const Color(0xFFC084FC),
            onTap: () => setState(() => _currentNavIndex = 1),
          ),
        ],
      ),
    );
  }

  Widget _buildMemoryVaultCard() {
    return Container(
      padding: EdgeInsets.all(_scale(10)),
      decoration: BoxDecoration(
        color: const Color(0xFF070B16),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lock_outline_rounded, color: const Color(0xFF2DD4BF), size: _scale(20)),
          SizedBox(height: _scale(10)),
          Text(
            'Memory Vault',
            style: TextStyle(color: Colors.white, fontSize: _scale(11.5), fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(
            'Your memories, safely stored',
            style: TextStyle(color: const Color(0xFF64748B), fontSize: _scale(8)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: _scale(8)),
          // Polaroid Stack
          SizedBox(
            height: _scale(55),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  bottom: 2,
                  child: Transform.rotate(
                    angle: -0.15,
                    child: Container(
                      width: _scale(32),
                      height: _scale(42),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.white, width: 1),
                        image: const DecorationImage(
                          image: AssetImage('assets/illustrations/timeline_manali.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 2,
                  child: Transform.rotate(
                    angle: 0.15,
                    child: Container(
                      width: _scale(32),
                      height: _scale(42),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.white, width: 1),
                        image: const DecorationImage(
                          image: AssetImage('assets/illustrations/concert.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: _scale(34),
                    height: _scale(44),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.white, width: 1),
                      image: const DecorationImage(
                        image: AssetImage('assets/illustrations/timeline_family.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          _buildCardButton(
            label: 'Explore',
            color: const Color(0xFF2DD4BF),
            onTap: () => context.push(RouteNames.memories),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineCard() {
    return Container(
      padding: EdgeInsets.all(_scale(10)),
      decoration: BoxDecoration(
        color: const Color(0xFF070B16),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.access_time_rounded, color: const Color(0xFFEC4899), size: _scale(20)),
          SizedBox(height: _scale(10)),
          Text(
            'Timeline',
            style: TextStyle(color: Colors.white, fontSize: _scale(11.5), fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(
            'Your life journey',
            style: TextStyle(color: const Color(0xFF64748B), fontSize: _scale(8)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: _scale(8)),
          // Timeline list
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTimelineRow(const Color(0xFF8B5CF6), '1997', 'Born on 04 Dec'),
              SizedBox(height: _scale(3.5)),
              _buildTimelineRow(const Color(0xFF8B5CF6), '2013', 'Completed HSLC'),
              SizedBox(height: _scale(3.5)),
              _buildTimelineRow(const Color(0xFF06B6D4), '2015', 'Completed HSE'),
              SizedBox(height: _scale(3.5)),
              _buildTimelineRow(const Color(0xFF3B82F6), '2019', 'Graduated BCA'),
              SizedBox(height: _scale(3.5)),
              _buildTimelineRow(const Color(0xFFEC4899), '2020', 'Started Career'),
            ],
          ),
          const Spacer(),
          _buildCardButton(
            label: 'View Timeline',
            color: const Color(0xFFEC4899),
            onTap: () => context.push(RouteNames.timeline),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineRow(Color dotColor, String year, String text) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: dotColor,
          ),
        ),
        SizedBox(width: _scale(4)),
        Text(
          year,
          style: TextStyle(
            color: Colors.white,
            fontSize: _scale(7.5),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: const Color(0xFF64748B),
              fontSize: _scale(7.5),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildFamilyTreeCard() {
    return Container(
      padding: EdgeInsets.all(_scale(10)),
      decoration: BoxDecoration(
        color: const Color(0xFF070B16),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.people_outline_rounded, color: const Color(0xFF3B82F6), size: _scale(20)),
          SizedBox(height: _scale(10)),
          Text(
            'Family Tree',
            style: TextStyle(color: Colors.white, fontSize: _scale(11.5), fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(
            'Your family, your strength',
            style: TextStyle(color: const Color(0xFF64748B), fontSize: _scale(8)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: _scale(8)),
          // Family tree lines & avatars
          SizedBox(
            height: _scale(55),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // Top Row of 2 Avatars
                Positioned(
                  top: 0,
                  left: _scale(15),
                  right: _scale(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _treeAvatar('assets/avatars/family_father.png', _scale(14)),
                      _treeAvatar('assets/avatars/family_mother.png', _scale(14)),
                    ],
                  ),
                ),
                // Horizontal connector
                Positioned(
                  top: _scale(7),
                  left: _scale(28),
                  right: _scale(28),
                  child: Container(
                    height: 1,
                    color: const Color(0xFF0EA5E9).withAlpha(150),
                  ),
                ),
                // Vertical connector down
                Positioned(
                  top: _scale(7),
                  child: Container(
                    width: 1,
                    height: _scale(13),
                    color: const Color(0xFF0EA5E9).withAlpha(150),
                  ),
                ),
                // Horizontal connector middle
                Positioned(
                  top: _scale(20),
                  left: _scale(8),
                  right: _scale(8),
                  child: Container(
                    height: 1,
                    color: const Color(0xFF0EA5E9).withAlpha(150),
                  ),
                ),
                // Middle Row of 4 Avatars
                Positioned(
                  top: _scale(14),
                  left: _scale(2),
                  right: _scale(2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _treeAvatar('assets/avatars/family_yusuf.png', _scale(12)),
                      _treeAvatar('assets/avatars/family_sara.png', _scale(12)),
                      _treeAvatar('assets/avatars/family_arif.png', _scale(12)),
                      _treeAvatar('assets/avatars/family_armaan.png', _scale(12)),
                    ],
                  ),
                ),
                // Extra vertical lines down to bottom row
                Positioned(
                  top: _scale(20),
                  left: _scale(16),
                  child: Container(
                    width: 1,
                    height: _scale(13),
                    color: const Color(0xFF0EA5E9).withAlpha(150),
                  ),
                ),
                Positioned(
                  top: _scale(20),
                  right: _scale(16),
                  child: Container(
                    width: 1,
                    height: _scale(13),
                    color: const Color(0xFF0EA5E9).withAlpha(150),
                  ),
                ),
                // Bottom Row of 2 Avatars
                Positioned(
                  top: _scale(28),
                  left: _scale(8),
                  right: _scale(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _treeAvatar('assets/avatars/aftab.png', _scale(12)),
                      _treeAvatar('assets/avatars/family_sara.png', _scale(12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          _buildCardButton(
            label: 'View Tree',
            color: const Color(0xFF3B82F6),
            onTap: () => context.push(RouteNames.familyTree),
          ),
        ],
      ),
    );
  }

  Widget _treeAvatar(String asset, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF0EA5E9), width: 0.8),
      ),
      child: ClipOval(
        child: Image.asset(
          asset,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildVoiceSpaceCard() {
    return Container(
      padding: EdgeInsets.all(_scale(10)),
      decoration: BoxDecoration(
        color: const Color(0xFF070B16),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.keyboard_voice_outlined, color: const Color(0xFFC084FC), size: _scale(20)),
          SizedBox(height: _scale(10)),
          Text(
            'Voice Space',
            style: TextStyle(color: Colors.white, fontSize: _scale(11.5), fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(
            'Your voice, your identity',
            style: TextStyle(color: const Color(0xFF64748B), fontSize: _scale(8)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: _scale(8)),
          // Waveform
          SizedBox(
            height: _scale(55),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(10, (index) {
                          final heights = [10.0, 24.0, 15.0, 30.0, 8.0, 20.0, 28.0, 12.0, 22.0, 16.0];
                          final h = heights[index % heights.length] * _scale(1).clamp(0.8, 1.2);
                          return Container(
                            width: 2,
                            height: h,
                            decoration: BoxDecoration(
                              color: Color.lerp(
                                const Color(0xFFEC4899),
                                const Color(0xFF0EA5E9),
                                index / 10,
                              ),
                              borderRadius: BorderRadius.circular(1),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: _scale(6)),
                      const Text(
                        'Last Recorded 2 days ago',
                        style: TextStyle(
                          color: Color(0xFF10B981),
                          fontSize: 7,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: _scale(4)),
                Container(
                  width: _scale(22),
                  height: _scale(22),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF0EA5E9),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: _scale(14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          _buildCardButton(
            label: 'Open Voice',
            color: const Color(0xFFC084FC),
            onTap: () => context.push(RouteNames.voiceSpace),
          ),
        ],
      ),
    );
  }

  Widget _buildAIProvidersCard() {
    final providers = ref.watch(aiProvidersProvider);

    return Container(
      padding: EdgeInsets.all(_scale(10)),
      decoration: BoxDecoration(
        color: const Color(0xFF070B16),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.psychology_outlined, color: const Color(0xFF10B981), size: _scale(20)),
          SizedBox(height: _scale(10)),
          Text(
            'AI Providers',
            style: TextStyle(color: Colors.white, fontSize: _scale(11.5), fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(
            'Connected & ready',
            style: TextStyle(color: const Color(0xFF64748B), fontSize: _scale(8)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: _scale(8)),
          // Providers list
          if (providers.isEmpty)
            Expanded(
              child: Center(
                child: Text(
                  'No providers configured',
                  style: TextStyle(color: const Color(0xFF64748B), fontSize: _scale(8)),
                ),
              ),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                providers.length.clamp(0, 4),
                (index) {
                  final provider = providers[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: index == providers.length.clamp(0, 4) - 1 ? 0 : _scale(3.5),
                    ),
                    child: _buildProviderRow(provider),
                  );
                },
              ),
            ),
          const Spacer(),
          _buildCardButton(
            label: 'Manage',
            color: const Color(0xFF10B981),
            onTap: () => context.push(RouteNames.aiProviders),
          ),
        ],
      ),
    );
  }

  Widget _buildProviderRow(AIProviderModel provider) {
    final info = AppConstants.providerTypes[provider.providerType];
    final icon = info?.icon ?? '🔗';
    final isActive = provider.isActive;

    return Row(
      children: [
        Text(
          icon,
          style: TextStyle(fontSize: _scale(9)),
        ),
        SizedBox(width: _scale(4)),
        Expanded(
          child: Text(
            provider.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: _scale(7.5),
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: _scale(4)),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isActive ? 'Active' : 'Inactive',
              style: TextStyle(
                color: isActive ? const Color(0xFF10B981) : const Color(0xFF64748B),
                fontSize: _scale(7),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: _scale(3)),
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? const Color(0xFF10B981) : const Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCardButton({
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: _scale(5)),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A).withAlpha(128),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFF1E293B)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: _scale(8.5),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: _scale(3)),
            Icon(
              Icons.arrow_forward_rounded,
              color: color,
              size: _scale(9),
            ),
          ],
        ),
      ),
    );
  }

  // ── Privacy Banner ──
  Widget _buildPrivacyBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: _scale(16), vertical: _scale(14)),
      decoration: BoxDecoration(
        color: const Color(0xFF070B16).withAlpha(220),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF1E293B)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withAlpha(10),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: _scale(42),
            height: _scale(42),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF6366F1).withAlpha(20),
              border: Border.all(color: const Color(0xFF6366F1).withAlpha(80), width: 1),
            ),
            child: Center(
              child: Icon(
                Icons.shield_outlined,
                color: const Color(0xFF818CF8),
                size: _scale(22),
              ),
            ),
          ),
          SizedBox(width: _scale(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your data is private & secure',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: _scale(13),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: _scale(3)),
                Text(
                  'All your memories, conversations and documents are stored locally on your device.',
                  style: TextStyle(
                    color: const Color(0xFF94A3B8).withAlpha(180),
                    fontSize: _scale(9.5),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: _scale(8)),
          Icon(
            Icons.chevron_right_rounded,
            color: const Color(0xFF64748B),
            size: _scale(20),
          ),
        ],
      ),
    );
  }

  // ── Bottom Navigation ──
  Widget _buildBottomNav() {
    final items = [
      ('Dashboard', Icons.home_outlined, 0),
      ('Chat', Icons.chat_bubble_outline_rounded, 1),
      ('', Icons.add_rounded, -1), // center FAB
      ('Memories', Icons.folder_outlined, 2),
      ('Settings', Icons.settings_outlined, 3),
    ];

    return Container(
      margin: EdgeInsets.fromLTRB(
        _scale(24),
        0,
        _scale(24),
        MediaQuery.of(context).padding.bottom > 0
            ? MediaQuery.of(context).padding.bottom
            : _scale(16),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: _scale(8),
        vertical: _scale(8),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A).withAlpha(235),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFF1E293B),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(120),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          if (item.$3 == -1) {
            // Center FAB
            return GestureDetector(
              onTap: () => _showAddMenu(context),
              child: Container(
                width: _scale(52),
                height: _scale(52),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8B5CF6), Color(0xFF06B6D4)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8B5CF6).withAlpha(80),
                      blurRadius: 14,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: _scale(28),
                ),
              ),
            );
          }

          final isActive = _currentNavIndex == item.$3;
          final color = isActive ? const Color(0xFFD672FF) : const Color(0xFF64748B);
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => _currentNavIndex = item.$3);
              },
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    item.$2,
                    color: color,
                    size: _scale(22),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.$1,
                    style: TextStyle(
                      color: color,
                      fontSize: _scale(9),
                      fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void _showAddMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF090D1A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Color(0xFF090D1A),
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create New Entry',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: _scale(16),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildAddMenuItem(
                    icon: Icons.photo_library_outlined,
                    label: 'Memory',
                    color: const Color(0xFFD946EF),
                    onTap: () {
                      Navigator.pop(context);
                      context.push(RouteNames.memories);
                    },
                  ),
                  _buildAddMenuItem(
                    icon: Icons.timeline_rounded,
                    label: 'Milestone',
                    color: const Color(0xFF8B5CF6),
                    onTap: () {
                      Navigator.pop(context);
                      context.push(RouteNames.timeline);
                    },
                  ),
                  _buildAddMenuItem(
                    icon: Icons.people_alt_outlined,
                    label: 'Family',
                    color: const Color(0xFF3B82F6),
                    onTap: () {
                      Navigator.pop(context);
                      context.push(RouteNames.familyTree);
                    },
                  ),
                  _buildAddMenuItem(
                    icon: Icons.mic_none_rounded,
                    label: 'Voice Note',
                    color: const Color(0xFF00E5FF),
                    onTap: () {
                      Navigator.pop(context);
                      context.push(RouteNames.voiceSpace);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAddMenuItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: _scale(54),
            height: _scale(54),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withAlpha(20),
              border: Border.all(color: color.withAlpha(80), width: 1.2),
            ),
            child: Icon(icon, color: color, size: _scale(22)),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: const Color(0xFF94A3B8),
              fontSize: _scale(10),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Responsive Context Extensions (GetX syntax style) ──
extension ResponsiveContext on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
}

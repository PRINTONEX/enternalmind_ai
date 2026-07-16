import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/ui_constants.dart';
import '../../../../core/router/route_names.dart';

class VoiceSpaceScreen extends StatefulWidget {
  const VoiceSpaceScreen({super.key});

  @override
  State<VoiceSpaceScreen> createState() => _VoiceSpaceScreenState();
}

class _VoiceSpaceScreenState extends State<VoiceSpaceScreen> {
  final _scrollController = ScrollController();
  final int _currentNavIndex = 3; // Linked tab profile/settings area

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03050A),
      body: Stack(
        children: [
          // ── Radial background glow ──
          Positioned(
            top: -120,
            right: -80,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF8B5CF6).withAlpha(8),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // ── Main Column Content ──
          SafeArea(
            child: Column(
              children: [
                // 1. Header Bar
                _buildHeader(context),

                // 2. Scrollable Body
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: Spacing.xs),

                        // Talk with your AI Card
                        _buildTalkWithAICard(),
                        const SizedBox(height: Spacing.lg),

                        // Quick Actions (4 buttons)
                        _buildQuickActionsRow(),
                        const SizedBox(height: Spacing.lg),

                        // Recent Conversations
                        _buildRecentConversationsSection(),
                        const SizedBox(height: Spacing.lg),

                        // Voice Memories Banner
                        _buildVoiceMemoriesBanner(),
                        const SizedBox(height: 160), // Space for player and bottom nav
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 3. Floating Player Bar (above bottom nav)
          Positioned(
            left: Spacing.lg,
            right: Spacing.lg,
            bottom: 80,
            child: _buildAudioPlayerBar(),
          ),

          // 4. Bottom Navigation
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildBottomNav(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.lg,
        vertical: Spacing.xs,
      ),
      child: Row(
        children: [
          // Back Button
          GestureDetector(
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                context.go(RouteNames.dashboard);
              }
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF0F172A),
                border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 14),

          // Icon + Titles
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF8B5CF6).withAlpha(20),
            ),
            child: const Center(
              child: Icon(
                Icons.graphic_eq_rounded,
                color: Color(0xFF8B5CF6),
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Voice Space',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Your voice, your identity',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF64748B),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Settings gear icon
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF0F172A),
                border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
              ),
              child: const Icon(
                Icons.settings_outlined,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTalkWithAICard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF070B14),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Circular microphone equalizer frame
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF8B5CF6), width: 1.5),
              color: const Color(0xFF8B5CF6).withAlpha(12),
            ),
            child: const Center(
              child: Icon(
                Icons.mic_none_rounded,
                color: Color(0xFF8B5CF6),
                size: 32,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Details text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Talk with Your AI',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Have natural voice conversations with your AI replica.',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF64748B),
                    fontSize: 11,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF10B981),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Online',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF10B981),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Start conversation button
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.mic_rounded, color: Colors.black, size: 14),
                      const SizedBox(width: 6),
                      Text(
                        'Start Voice Conversation',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
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

  Widget _buildQuickActionsRow() {
    final actions = [
      ('Voice Call', Icons.call_rounded, const Color(0xFF8B5CF6), 'Call your AI'),
      ('Record Note', Icons.mic_rounded, const Color(0xFF10B981), 'Save your voice'),
      ('Voice Journal', Icons.audiotrack_rounded, const Color(0xFFEC4899), 'Speak your mind'),
      ('Voice Settings', Icons.settings_rounded, const Color(0xFF3B82F6), 'Customize voice'),
    ];

    return Row(
      children: actions.map((a) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF090D1A),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF1E293B)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
            child: Column(
              children: [
                Icon(a.$2, color: a.$3, size: 18),
                const SizedBox(height: 6),
                Text(
                  a.$1,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  a.$4,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF64748B),
                    fontSize: 7,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildRecentConversationsSection() {
    final conversations = [
      ('Morning Motivation', 'You & AI Replica', 'Today, 8:15 AM', '05:32'),
      ('Life Goals Discussion', 'You & AI Replica', 'Yesterday, 9:42 PM', '12:18'),
      ('Family Stories', 'You & AI Replica', '12 May 2024', '08:47'),
      ('Peaceful Night Talk', 'You & AI Replica', '10 May 2024', '06:21'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Conversations',
              style: GoogleFonts.inter(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              'View All',
              style: GoogleFonts.inter(color: const Color(0xFF8B5CF6), fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: Spacing.md),

        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: List.generate(conversations.length, (index) {
              final c = conversations[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: Color(0xFF1E293B),
                          child: Icon(Icons.person, color: Color(0xFF8B5CF6), size: 18),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                c.$1,
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                c.$3,
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF64748B),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              c.$4,
                              style: GoogleFonts.inter(
                                color: const Color(0xFF94A3B8),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 14),
                        const Icon(Icons.more_vert_rounded, color: Color(0xFF64748B), size: 16),
                      ],
                    ),
                  ),
                  if (index < conversations.length - 1)
                    Container(height: 1, color: const Color(0xFF1E293B)),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildVoiceMemoriesBanner() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF110B24),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFEC4899).withAlpha(100), width: 1.2),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFEC4899).withAlpha(20),
              border: Border.all(color: const Color(0xFFEC4899), width: 1.2),
            ),
            child: const Center(
              child: Icon(
                Icons.graphic_eq_rounded,
                color: Color(0xFFEC4899),
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Voice Memories',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'You have 23 voice memories recorded',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF94A3B8),
                    fontSize: 10,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Explore All Button
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFEC4899).withAlpha(120), width: 1.2),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Text(
                'Explore All',
                style: GoogleFonts.inter(
                  color: const Color(0xFFEC4899),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAudioPlayerBar() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A).withAlpha(235),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF8B5CF6), width: 1.2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundColor: Color(0xFF1E293B),
            child: Icon(Icons.person, color: Color(0xFF8B5CF6), size: 16),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Morning Motivation',
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                ),
                Text(
                  'You & AI Replica',
                  style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 8, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                // Audio linear progress slider
                Row(
                  children: [
                    Text('01:24', style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 8)),
                    const SizedBox(width: 6),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: const LinearProgressIndicator(
                          value: 0.3,
                          backgroundColor: Color(0xFF1E293B),
                          color: Color(0xFF8B5CF6),
                          minHeight: 4,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text('05:32', style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 8)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),

          // Player controls
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.replay_10_rounded, color: Colors.white70, size: 20),
              const SizedBox(width: 8),
              const Icon(Icons.pause_circle_filled_rounded, color: Color(0xFF8B5CF6), size: 36),
              const SizedBox(width: 8),
              const Icon(Icons.forward_10_rounded, color: Colors.white70, size: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
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
        color: const Color(0xFF090D1A).withAlpha(220),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFF1E293B),
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
              context.go(RouteNames.dashboard);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item.$2,
                  color: isActive
                      ? const Color(0xFF7C3AED)
                      : const Color(0xFF64748B),
                  size: 20,
                ),
                Text(
                  item.$1,
                  style: TextStyle(
                    color: isActive
                        ? const Color(0xFF7C3AED)
                        : const Color(0xFF64748B),
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

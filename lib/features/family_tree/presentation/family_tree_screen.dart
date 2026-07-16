import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/ui_constants.dart';
import '../../../../core/router/route_names.dart';
import '../providers/family_tree_providers.dart';

class FamilyTreeScreen extends ConsumerStatefulWidget {
  const FamilyTreeScreen({super.key});

  @override
  ConsumerState<FamilyTreeScreen> createState() => _FamilyTreeScreenState();
}

class _FamilyTreeScreenState extends ConsumerState<FamilyTreeScreen> {
  final _scrollController = ScrollController();
  final int _currentNavIndex = 3; // Highlight Profile/Family tree area

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final familyState = ref.watch(familyTreeProvider);
    final members = familyState.members;

    // Get specific members
    final father = members.firstWhere((m) => m.id == 'father');
    final mother = members.firstWhere((m) => m.id == 'mother');
    final you = members.firstWhere((m) => m.id == 'you');
    final arif = members.firstWhere((m) => m.id == 'arif');
    final sara = members.firstWhere((m) => m.id == 'sara');
    final armaan = members.firstWhere((m) => m.id == 'armaan');
    final yusuf = members.firstWhere((m) => m.id == 'yusuf');

    return Scaffold(
      backgroundColor: const Color(0xFF03050A),
      body: Stack(
        children: [
          // ── Background Glows ──
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
                    const Color(0xFF00E5FF).withAlpha(10),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // ── Main Content Column ──
          SafeArea(
            child: Column(
              children: [
                // 1. Header Bar
                _buildHeader(context),

                // 2. Tab Bar Selector
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.lg, vertical: Spacing.xs),
                  child: _buildTabBarSelector(familyState),
                ),
                const SizedBox(height: Spacing.md),

                // 3. Scrollable Tree Body
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.only(bottom: 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Interactive Tree Area
                        _buildInteractiveTreeView(father, mother, you, arif, sara, armaan, yusuf),
                        const SizedBox(height: Spacing.lg),

                        // Recent Members
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
                          child: _buildRecentMembersSection(),
                        ),
                        const SizedBox(height: Spacing.lg),

                        // Legacy History Banner
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
                          child: _buildLegacyHistoryBanner(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom navigation handled by parent Dashboard shell
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

          // Icon + Title
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF3B82F6).withAlpha(20),
            ),
            child: const Center(
              child: Icon(
                Icons.people_alt_rounded,
                color: Color(0xFF3B82F6),
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
                  'Family Tree',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Your family, your roots',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF64748B),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Search + Add Buttons
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
                Icons.search_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 10),
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
                Icons.add_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBarSelector(FamilyTreeState state) {
    final tabs = [
      ('Tree View', Icons.account_tree_outlined),
      ('List View', Icons.list_rounded),
      ('Statistics', Icons.bar_chart_rounded),
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF070B14),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: tabs.map((t) {
          final isActive = state.selectedTab == t.$1;
          final activeColor = const Color(0xFF7C3AED);

          return Expanded(
            child: GestureDetector(
              onTap: () {
                ref.read(familyTreeProvider.notifier).selectTab(t.$1);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isActive ? activeColor.withAlpha(20) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isActive ? activeColor : Colors.transparent,
                    width: 1.2,
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      t.$2,
                      color: isActive ? Colors.white : const Color(0xFF64748B),
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      t.$1,
                      style: GoogleFonts.inter(
                        color: isActive ? Colors.white : const Color(0xFF94A3B8),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildInteractiveTreeView(
    FamilyMemberModel father,
    FamilyMemberModel mother,
    FamilyMemberModel you,
    FamilyMemberModel arif,
    FamilyMemberModel sara,
    FamilyMemberModel armaan,
    FamilyMemberModel yusuf,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 440,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: Spacing.md),

            // 1. LEVEL 1 (Parents Row)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildNodeCard(father),
                // Horizontal connecting line with heart
                Container(
                  width: 50,
                  height: 1.5,
                  color: const Color(0xFFEC4899),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: -8,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFEC4899),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.favorite_rounded,
                              color: Colors.white,
                              size: 8,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildNodeCard(mother),
              ],
            ),

            // Vertical pathway connecting Level 1 to Level 2
            Stack(
              alignment: Alignment.topCenter,
              children: [
                // Horizontal bar linking siblings
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  width: 250,
                  height: 1.5,
                  color: const Color(0xFF7C3AED),
                ),
                // Vertical stem from parents down to branching point
                Container(
                  width: 1.5,
                  height: 25,
                  color: const Color(0xFFEC4899),
                ),
                // Vertical stems to each sibling
                Positioned(
                  left: 0,
                  top: 25,
                  child: Container(width: 1.5, height: 25, color: const Color(0xFF7C3AED)),
                ),
                Positioned(
                  top: 25,
                  child: Container(width: 1.5, height: 25, color: const Color(0xFF7C3AED)),
                ),
                Positioned(
                  right: 0,
                  top: 25,
                  child: Container(width: 1.5, height: 25, color: const Color(0xFF7C3AED)),
                ),
              ],
            ),
            const SizedBox(height: 4),

            // 2. LEVEL 2 (Children Row)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNodeCard(you),
                _buildNodeCard(arif),
                _buildNodeCard(sara),
              ],
            ),

            // Vertical pathway connecting Arif to Level 3
            Stack(
              alignment: Alignment.topCenter,
              children: [
                // Horizontal bar linking Grandchildren
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  width: 250,
                  height: 1.5,
                  color: const Color(0xFF8B5CF6),
                ),
                // Vertical stem from Arif
                Container(
                  width: 1.5,
                  height: 25,
                  color: const Color(0xFF3B82F6),
                ),
                // Stems down to grandchildren
                Positioned(
                  left: 0,
                  top: 25,
                  child: Container(width: 1.5, height: 25, color: const Color(0xFF8B5CF6)),
                ),
                Positioned(
                  top: 25,
                  child: Container(width: 1.5, height: 25, color: const Color(0xFF8B5CF6)),
                ),
                Positioned(
                  right: 0,
                  top: 25,
                  child: Container(width: 1.5, height: 25, color: const Color(0xFF8B5CF6)),
                ),
              ],
            ),
            const SizedBox(height: 4),

            // 3. LEVEL 3 (Grandchildren Row)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNodeCard(armaan),
                _buildNodeCard(yusuf),
                // Add Member Dotted Card
                _buildAddMemberNode(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNodeCard(FamilyMemberModel m) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: 106,
              height: 106,
              decoration: BoxDecoration(
                color: const Color(0xFF090D1A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: m.colorTheme, width: 1.2),
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Circular Avatar
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: m.colorTheme, width: 1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Image.asset(
                        m.imageAsset,
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, s) => const Icon(Icons.person, color: Colors.white, size: 24),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Name
                  Text(
                    m.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    m.birthDetails,
                    style: GoogleFonts.inter(
                      color: const Color(0xFF64748B),
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // Gender Badge
            if (m.gender == 'Male' && !m.isYou)
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF3B82F6),
                  ),
                  child: const Center(
                    child: Text(
                      '♂',
                      style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
          ],
        ),
        if (m.isYou) ...[
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF00E5FF).withAlpha(30),
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Text(
              'You',
              style: GoogleFonts.inter(
                color: const Color(0xFF00E5FF),
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ] else
          const SizedBox(height: 16), // keep rows balanced
      ],
    );
  }

  Widget _buildAddMemberNode() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 106,
          height: 106,
          decoration: BoxDecoration(
            color: const Color(0xFF070B14).withAlpha(8),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF1E293B),
              style: BorderStyle.solid,
              width: 1.2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF1E293B).withAlpha(50),
                ),
                child: const Icon(
                  Icons.add_rounded,
                  color: Color(0xFF64748B),
                  size: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Add\nMember',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: const Color(0xFF64748B),
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildRecentMembersSection() {
    final recent = [
      ('Armaan Shah', 'Son', '6 Years', 'Born on 14 Feb 2018', 'assets/avatars/family_armaan.png'),
      ('Yusuf Shah', 'Son', '3.5 Years', 'Born on 20 Jan 2021', 'assets/avatars/family_yusuf.png'),
      ('Sara Shah', 'Sister', '21 Years', 'Born on 12 Aug 2003', 'assets/avatars/family_sara.png'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Members',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'View All',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF8B5CF6),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xFF8B5CF6),
                    size: 10,
                  ),
                ],
              ),
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
            children: List.generate(recent.length, (index) {
              final r = recent[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(r.$5),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                r.$1,
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                r.$2,
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF64748B),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              r.$3,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              r.$4,
                              style: GoogleFonts.inter(
                                color: const Color(0xFF64748B),
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 14),
                        const Icon(
                          Icons.more_vert_rounded,
                          color: Color(0xFF64748B),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  if (index < recent.length - 1)
                    Container(
                      height: 1,
                      color: const Color(0xFF1E293B),
                    ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildLegacyHistoryBanner() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF16112E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF7C3AED).withAlpha(100), width: 1.2),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Glowing Tree Icon Badge
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF7C3AED).withAlpha(20),
              border: Border.all(color: const Color(0xFF7C3AED), width: 1.2),
            ),
            child: const Center(
              child: Icon(
                Icons.park_rounded,
                color: Color(0xFF8B5CF6),
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Keep Your Family History Alive',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Add stories, photos and memories to preserve your legacy.',
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

          // Add Story Button
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF7C3AED).withAlpha(120), width: 1.2),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.menu_book_outlined,
                    color: Color(0xFF8B5CF6),
                    size: 12,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Add Story',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF8B5CF6),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/ui_constants.dart';
import '../../../../core/router/route_names.dart';
import '../providers/timeline_providers.dart';

class TimelineScreen extends ConsumerStatefulWidget {
  const TimelineScreen({super.key});

  @override
  ConsumerState<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends ConsumerState<TimelineScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timelineState = ref.watch(timelineProvider);
    final events = timelineState.filteredEvents;

    return Scaffold(
      backgroundColor: const Color(0xFF03050A),
      body: Stack(
        children: [
          // ── Subtle radial glow in background ──
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF8B5CF6).withAlpha(10),
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

                // 2. Summary Stats Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.lg, vertical: Spacing.xs),
                  child: _buildSummaryStatsRow(),
                ),
                const SizedBox(height: Spacing.md),

                // 3. Category Filter Chips Row
                _buildFilterChipsRow(timelineState),
                const SizedBox(height: Spacing.md),

                // 4. Vertical Timeline List
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.fromLTRB(Spacing.lg, Spacing.xs, Spacing.lg, 100),
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final item = events[index];
                      final isLast = index == events.length - 1;
                      return _buildTimelineItem(item, index, isLast);
                    },
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
          // Back button
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
                Icons.history_toggle_off_rounded,
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
                  'Timeline',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Your life journey',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF64748B),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Actions (Filter + Add)
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
                Icons.tune_rounded,
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

  Widget _buildSummaryStatsRow() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF070B14),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatColumn(Icons.calendar_today_rounded, '28', 'Events', const Color(0xFF8B5CF6)),
          _buildDivider(),
          _buildStatColumn(Icons.star_border_rounded, '12', 'Milestones', const Color(0xFFEC4899)),
          _buildDivider(),
          _buildStatColumn(Icons.location_on_outlined, '9', 'Places', const Color(0xFF00E5FF)),
          _buildDivider(),
          _buildStatColumn(Icons.image_outlined, '156', 'Memories', const Color(0xFF3B82F6)),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1.2,
      height: 30,
      color: const Color(0xFF1E293B),
    );
  }

  Widget _buildStatColumn(IconData icon, String count, String label, Color color) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 6),
          Text(
            count,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.inter(
              color: const Color(0xFF64748B),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChipsRow(TimelineState state) {
    final categories = [
      ('All', null),
      ('Milestones', Icons.star_border_rounded),
      ('Education', Icons.school_outlined),
      ('Career', Icons.work_outline_rounded),
      ('Personal', Icons.favorite_border_rounded),
    ];

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isActive = state.selectedCategory == cat.$1;
          final activeColor = const Color(0xFF8B5CF6);

          return GestureDetector(
            onTap: () {
              ref.read(timelineProvider.notifier).selectCategory(cat.$1);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: isActive ? activeColor.withAlpha(20) : const Color(0xFF070B14),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isActive ? activeColor : const Color(0xFF1E293B),
                  width: 1.2,
                ),
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: activeColor.withAlpha(50),
                          blurRadius: 6,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              child: Row(
                children: [
                  if (cat.$2 != null) ...[
                    Icon(cat.$2, color: isActive ? Colors.white : const Color(0xFF64748B), size: 14),
                    const SizedBox(width: 6),
                  ],
                  Text(
                    cat.$1,
                    style: GoogleFonts.inter(
                      color: isActive ? Colors.white : const Color(0xFF94A3B8),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTimelineItem(TimelineEventModel item, int index, bool isLast) {
    // Determine category capsule styles
    Color tagColor = const Color(0xFF8B5CF6);
    if (item.category == 'Education') {
      tagColor = const Color(0xFF3B82F6);
    } else if (item.category == 'Career') {
      tagColor = const Color(0xFFEC4899);
    } else if (item.category == 'Personal') {
      tagColor = const Color(0xFFF59E0B);
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Year display
          SizedBox(
            width: 44,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  '${item.year}',
                  style: GoogleFonts.inter(
                    color: item.dotColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),

          // 2. Line + Dot
          SizedBox(
            width: 24,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
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
                      color: const Color(0xFF03050A),
                      border: Border.all(color: item.dotColor, width: 2.5),
                      boxShadow: [
                        BoxShadow(
                          color: item.dotColor.withAlpha(80),
                          blurRadius: 6,
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

          // 3. Card Content
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
                  // Event Image
                  Container(
                    width: 76,
                    height: 76,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFF070B14),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item.imageAsset,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(child: Icon(Icons.broken_image_outlined, color: Color(0xFF64748B)));
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Texts Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title + Tag
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item.title,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: tagColor.withAlpha(20),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              child: Text(
                                item.category,
                                style: GoogleFonts.inter(
                                  color: tagColor,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        // Description
                        Text(
                          item.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            color: const Color(0xFF94A3B8),
                            fontSize: 11,
                            height: 1.4,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Date Row
                        Row(
                          children: [
                            const Icon(Icons.calendar_today_rounded, color: Color(0xFF64748B), size: 10),
                            const SizedBox(width: 4),
                            Text(
                              item.dateStr,
                              style: GoogleFonts.inter(
                                color: const Color(0xFF64748B),
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Actions
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF070B14),
                        border: Border.all(color: const Color(0xFF1E293B)),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.more_horiz_rounded,
                          color: Color(0xFF64748B),
                          size: 16,
                        ),
                      ),
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

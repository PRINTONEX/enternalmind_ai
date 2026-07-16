import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/ui_constants.dart';
import '../../../../core/router/route_names.dart';
import '../../../database/app_database.dart';
import '../providers/memories_providers.dart';

class MemoriesScreen extends ConsumerStatefulWidget {
  const MemoriesScreen({super.key});

  @override
  ConsumerState<MemoriesScreen> createState() => _MemoriesScreenState();
}

class _MemoriesScreenState extends ConsumerState<MemoriesScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stats = ref.watch(vaultStorageStatsProvider);
    final recentMemoriesAsync = ref.watch(recentMemoriesProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF03050A),
      body: Stack(
        children: [
          // ── Radial background glow ──
          Positioned(
            top: -120,
            left: -80,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF00E5FF).withAlpha(8),
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

                        // Storage Used Card
                        _buildStorageCard(stats),
                        const SizedBox(height: Spacing.lg),

                        // Category Filter Chips
                        _buildCategoryChips(),
                        const SizedBox(height: Spacing.lg),

                        // Recent Memories Section
                        _buildRecentMemoriesSection(recentMemoriesAsync),
                        const SizedBox(height: Spacing.lg),

                        // Albums Section
                        _buildAlbumsSection(stats),
                        const SizedBox(height: Spacing.lg),

                        // Security Shield Banner
                        _buildSecurityBanner(context),
                        const SizedBox(height: 100), // Space for bottom nav
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
            onTap: () => context.go(RouteNames.dashboard),
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
              color: const Color(0xFF00E5FF).withAlpha(20),
            ),
            child: const Center(
              child: Icon(
                Icons.business_center_outlined,
                color: Color(0xFF00E5FF),
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
                  'Memory Vault',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Your memories, safely stored',
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

  Widget _buildStorageCard(VaultStorageStats stats) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF070B14),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Storage cloud icon
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF00E5FF), width: 2),
              color: const Color(0xFF00E5FF).withAlpha(12),
            ),
            child: const Center(
              child: Icon(
                Icons.cloud_queue_rounded,
                color: Color(0xFF00E5FF),
                size: 28,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Text details + Progress bar
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Storage Used',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF64748B),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      stats.formattedUsage,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      ' / 20 GB',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF64748B),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Horizontal Progress Bar
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: stats.percentOfLimit,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF00E5FF), Color(0xFF7C3AED)],
                        ),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // Upgrade Button
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF7C3AED).withAlpha(120), width: 1.2),
                color: const Color(0xFF7C3AED).withAlpha(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.workspace_premium_outlined,
                    color: Color(0xFF8B5CF6),
                    size: 14,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Upgrade',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF8B5CF6),
                      fontSize: 11,
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

  Widget _buildCategoryChips() {
    final chips = [
      ('All', null, true),
      ('Photos', Icons.image_outlined, false),
      ('Videos', Icons.video_library_outlined, false),
      ('Documents', Icons.description_outlined, false),
      ('Audio', Icons.audiotrack_outlined, false),
    ];

    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chips.length,
        itemBuilder: (context, index) {
          final c = chips[index];
          final isActive = c.$3;
          final activeColor = const Color(0xFF7C3AED);

          return Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: isActive ? activeColor.withAlpha(20) : const Color(0xFF070B14),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isActive ? activeColor : const Color(0xFF1E293B),
                width: 1.2,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              children: [
                if (c.$2 != null) ...[
                  Icon(c.$2, color: isActive ? Colors.white : const Color(0xFF64748B), size: 14),
                  const SizedBox(width: 6),
                ],
                Text(
                  c.$1,
                  style: GoogleFonts.inter(
                    color: isActive ? Colors.white : const Color(0xFF94A3B8),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecentMemoriesSection(AsyncValue<List<MemoriesTableData>> recentMemoriesAsync) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Memories',
              style: GoogleFonts.inter(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              'View All',
              style: GoogleFonts.inter(color: const Color(0xFF00E5FF), fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: Spacing.md),
        recentMemoriesAsync.when(
          data: (items) {
            if (items.isEmpty) {
              return Container(
                height: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF070B14),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF1E293B)),
                ),
                child: Text(
                  'No recent memories yet',
                  style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 12),
                ),
              );
            }
            return SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final assetPath = _getAssetForCategory(item.category);
                  final icon = _getIconForCategory(item.category);

                  return Container(
                    width: 130,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFF1E293B)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              assetPath,
                              fit: BoxFit.cover,
                              errorBuilder: (c, e, s) => Container(color: const Color(0xFF090D1A)),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black.withAlpha(180)],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withAlpha(150),
                              ),
                              child: Icon(icon, color: Colors.white, size: 12),
                            ),
                          ),
                          Positioned(
                            left: 8,
                            right: 8,
                            bottom: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  item.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                ),
                                if (item.date != null)
                                  Text(
                                    item.date!,
                                    style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 8, fontWeight: FontWeight.w500),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
          loading: () => const SizedBox(
            height: 150,
            child: Center(
              child: CircularProgressIndicator(color: Color(0xFF00E5FF)),
            ),
          ),
          error: (err, stack) => Container(
            height: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF070B14),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF1E293B)),
            ),
            child: Text(
              'Error loading memories',
              style: GoogleFonts.inter(color: Colors.redAccent, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAlbumsSection(VaultStorageStats stats) {
    final albums = [
      ('Text Memories', '${stats.memoriesCount} Items', 'assets/illustrations/timeline_grad.png', Icons.favorite_border_rounded, const Color(0xFFEC4899)),
      ('Photos & Videos', '${stats.photosCount} Items', 'assets/illustrations/timeline_manali.png', Icons.image_outlined, const Color(0xFF00E5FF)),
      ('Documents & Files', '${stats.documentsCount} Items', 'assets/illustrations/timeline_college.png', Icons.description_outlined, const Color(0xFF8B5CF6)),
      ('Voice Recordings', '${stats.audioCount} Items', 'assets/illustrations/timeline_career.png', Icons.audiotrack_outlined, const Color(0xFFF59E0B)),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Vault Categories',
              style: GoogleFonts.inter(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              'View All',
              style: GoogleFonts.inter(color: const Color(0xFF00E5FF), fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: Spacing.md),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: albums.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            final a = albums[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF1E293B)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    // Background Image
                    Positioned.fill(
                      child: Image.asset(
                        a.$3,
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, s) => Container(color: const Color(0xFF090D1A)),
                      ),
                    ),
                    // Gradient overlay
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black.withAlpha(200)],
                          ),
                        ),
                      ),
                    ),
                    // Icon Badge (Top Left)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: a.$5.withAlpha(50),
                          border: Border.all(color: a.$5.withAlpha(150)),
                        ),
                        child: Icon(a.$4, color: a.$5, size: 14),
                      ),
                    ),
                    // Actions menu dot
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: const Icon(Icons.more_vert_rounded, color: Colors.white70, size: 16),
                    ),
                    // Album Details text
                    Positioned(
                      left: 12,
                      bottom: 12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            a.$1,
                            style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            a.$2,
                            style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 9, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSecurityBanner(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF080F21),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF3B82F6).withAlpha(100), width: 1.2),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF3B82F6).withAlpha(20),
              border: Border.all(color: const Color(0xFF3B82F6), width: 1.2),
            ),
            child: const Center(
              child: Icon(
                Icons.shield_rounded,
                color: Color(0xFF3B82F6),
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
                  'Your memories are encrypted & secure',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Only you and your AI replica can access them.',
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

          // Security Settings Button
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF3B82F6).withAlpha(120), width: 1.2),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.lock_outline_rounded,
                    color: Color(0xFF3B82F6),
                    size: 12,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Settings',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF3B82F6),
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

  String _getAssetForCategory(String? category) {
    switch (category?.toLowerCase()) {
      case 'family':
        return 'assets/illustrations/timeline_family.png';
      case 'travel':
        return 'assets/illustrations/timeline_manali.png';
      case 'education':
        return 'assets/illustrations/timeline_college.png';
      case 'career':
        return 'assets/illustrations/timeline_career.png';
      default:
        return 'assets/illustrations/timeline_grad.png';
    }
  }

  IconData _getIconForCategory(String? category) {
    switch (category?.toLowerCase()) {
      case 'family':
        return Icons.favorite_border_rounded;
      case 'travel':
        return Icons.image_outlined;
      case 'education':
        return Icons.description_outlined;
      case 'career':
        return Icons.business_center_outlined;
      default:
        return Icons.psychology_outlined;
    }
  }
}

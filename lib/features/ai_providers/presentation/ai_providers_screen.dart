import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/ui_constants.dart';
import '../../../../core/router/route_names.dart';
import '../providers/ai_providers_providers.dart';

class AiProvidersScreen extends ConsumerStatefulWidget {
  const AiProvidersScreen({super.key});

  @override
  ConsumerState<AiProvidersScreen> createState() => _AiProvidersScreenState();
}

class _AiProvidersScreenState extends ConsumerState<AiProvidersScreen> {
  final _scrollController = ScrollController();
  final int _currentNavIndex = 0; // AI Providers page as fullscreen view

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providersState = ref.watch(aiProvidersProvider);
    final providers = providersState.providers;
    final active = providersState.activeProvider;

    return Scaffold(
      backgroundColor: const Color(0xFF03050A),
      body: Stack(
        children: [
          // ── Subtle radial glow ──
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
                    const Color(0xFF7C3AED).withAlpha(10),
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

                        // Active Provider Large Card
                        if (active != null) _buildActiveCard(active),
                        const SizedBox(height: Spacing.lg),

                        // Title
                        Text(
                          'Your Providers',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: Spacing.md),

                        // List of Providers
                        ...providers.map((p) {
                          return _buildProviderCard(p);
                        }),
                        const SizedBox(height: Spacing.md),

                        // Recommendation Banner
                        _buildRecommendationBanner(),
                        const SizedBox(height: Spacing.lg),

                        // Quick Settings Grid (4 buttons)
                        _buildQuickSettingsRow(),
                        const SizedBox(height: 100), // Space for bottom nav
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 3. Bottom Navigation
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
                Icons.memory_rounded,
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
                  'AI Providers',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Choose your intelligence',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF64748B),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () => _showAddProviderDialog(context),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF8B5CF6).withAlpha(100), width: 1.2),
                color: const Color(0xFF8B5CF6).withAlpha(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.add_rounded,
                    color: Color(0xFF8B5CF6),
                    size: 14,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Add Provider',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF8B5CF6),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
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

  Widget _buildActiveCard(AIProviderModel p) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF070B14),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Brain outline circle
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF00E5FF), width: 2),
              color: const Color(0xFF00E5FF).withAlpha(12),
            ),
            child: const Center(
              child: Icon(
                Icons.psychology_outlined,
                color: Color(0xFF00E5FF),
                size: 36,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Active Provider',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF10B981),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      p.name,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981).withAlpha(20),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      child: Text(
                        'Default',
                        style: GoogleFonts.inter(
                          color: const Color(0xFF10B981),
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  p.modelName,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF64748B),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildStatusChip(
                      icon: Icons.circle_rounded,
                      text: 'Online',
                      color: const Color(0xFF10B981),
                    ),
                    const SizedBox(width: 8),
                    _buildStatusChip(
                      icon: Icons.bolt_rounded,
                      text: 'Fast',
                      color: const Color(0xFF3B82F6),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Glowing Brain Platform Hologram
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 70,
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8B5CF6).withAlpha(100),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Image.asset(
                  'assets/illustrations/neon_brain.png',
                  width: 70,
                  height: 70,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.psychology_rounded, color: Color(0xFF8B5CF6), size: 50);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color.withAlpha(20),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(80), width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: icon == Icons.circle_rounded ? 6 : 10),
          const SizedBox(width: 4),
          Text(
            text,
            style: GoogleFonts.inter(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProviderCard(AIProviderModel p) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: p.isActive ? const Color(0xFF00E5FF).withAlpha(100) : const Color(0xFF1E293B),
          width: p.isActive ? 1.5 : 1.2,
        ),
      ),
      child: Row(
        children: [
          // Logo Mascot
          _buildProviderLogo(p),
          const SizedBox(width: 14),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      p.name,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: (p.isActive
                                ? const Color(0xFF10B981)
                                : p.isConfigured
                                    ? const Color(0xFF8B5CF6)
                                    : const Color(0xFF64748B))
                            .withAlpha(20),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      child: Text(
                        p.isActive
                            ? 'Active'
                            : p.isConfigured
                                ? 'Configured'
                                : 'Disabled',
                        style: GoogleFonts.inter(
                          color: p.isActive
                              ? const Color(0xFF10B981)
                              : p.isConfigured
                                  ? const Color(0xFF8B5CF6)
                                  : const Color(0xFF64748B),
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  p.modelName,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF64748B),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                // Tags Row
                Row(
                  children: [
                    _buildTagChip(Icons.storage_outlined, p.type),
                    _buildSeparator(),
                    _buildTagChip(Icons.bolt_outlined, p.speed),
                    _buildSeparator(),
                    _buildTagChip(Icons.shield_outlined, p.security),
                  ],
                ),
              ],
            ),
          ),

          // Actions (More + Switch)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.more_vert_rounded,
                color: Color(0xFF64748B),
                size: 20,
              ),
              const SizedBox(width: 4),
              Switch.adaptive(
                value: p.isActive,
                activeThumbColor: const Color(0xFF00E5FF),
                activeTrackColor: const Color(0xFF00E5FF).withAlpha(100),
                inactiveThumbColor: const Color(0xFF64748B),
                inactiveTrackColor: const Color(0xFF1E293B),
                onChanged: (val) {
                  ref.read(aiProvidersProvider.notifier).toggleProvider(p.id, val);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProviderLogo(AIProviderModel p) {
    if (p.iconAsset != null) {
      return Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: p.id == 'ollama' ? Colors.white : const Color(0xFF090D1A),
          border: Border.all(
            color: p.id == 'openai' ? const Color(0xFF10B981) : const Color(0xFF1E293B),
            width: 1.2,
          ),
        ),
        padding: p.id == 'openai' ? EdgeInsets.zero : const EdgeInsets.all(2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Image.asset(
            p.iconAsset!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.smart_toy_outlined, color: Colors.white, size: 20);
            },
          ),
        ),
      );
    } else if (p.id == 'openrouter') {
      return Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF1E1E38),
          border: Border.all(color: const Color(0xFF8B5CF6), width: 1.2),
        ),
        child: const Center(
          child: Icon(
            Icons.swap_horiz_rounded,
            color: Colors.white,
            size: 22,
          ),
        ),
      );
    } else if (p.id == 'huggingface') {
      return Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF0F172A),
          border: Border.all(color: Colors.orange, width: 1.5),
        ),
        child: const Center(
          child: Text(
            'H',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF8B5CF6).withAlpha(20),
          border: Border.all(color: const Color(0xFF8B5CF6), width: 1.2),
        ),
        child: const Center(
          child: Icon(
            Icons.settings_outlined,
            color: Color(0xFF8B5CF6),
            size: 22,
          ),
        ),
      );
    }
  }

  Widget _buildTagChip(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color(0xFF64748B), size: 12),
        const SizedBox(width: 4),
        Text(
          text,
          style: GoogleFonts.inter(
            color: const Color(0xFF94A3B8),
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSeparator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Text(
        '|',
        style: GoogleFonts.inter(color: const Color(0xFF1E293B), fontSize: 10),
      ),
    );
  }

  Widget _buildRecommendationBanner() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1B1126),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEC4899).withAlpha(80), width: 1.2),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFEC4899).withAlpha(20),
            ),
            child: const Center(
              child: Icon(
                Icons.star_rounded,
                color: Color(0xFFEC4899),
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Provider Recommendation',
                  style: GoogleFonts.inter(
                    color: const Color(0xFFEC4899),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Enable multiple providers for automatic failover and better reliability.',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF94A3B8),
                    fontSize: 11,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Setup Failover Button
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFEC4899).withAlpha(120), width: 1.2),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.verified_user_outlined,
                    color: Color(0xFFEC4899),
                    size: 12,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Setup Failover',
                    style: GoogleFonts.inter(
                      color: const Color(0xFFEC4899),
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

  Widget _buildQuickSettingsRow() {
    final settings = [
      ('Provider Settings', Icons.settings_rounded, const Color(0xFF8B5CF6)),
      ('Model Manager', Icons.layers_rounded, const Color(0xFF00E5FF)),
      ('Usage & Limits', Icons.bar_chart_rounded, const Color(0xFFEC4899)),
      ('API Keys', Icons.vpn_key_rounded, const Color(0xFF3B82F6)),
    ];

    return Row(
      children: settings.map((s) {
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
                Icon(s.$2, color: s.$3, size: 20),
                const SizedBox(height: 6),
                Text(
                  s.$1,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF64748B),
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
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
              // Custom action to switch screens back to dashboard index
              if (item.$3 == 0) {
                context.go(RouteNames.dashboard);
              } else {
                // Return to dashboard and select tab
                context.go(RouteNames.dashboard);
              }
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

  void _showAddProviderDialog(BuildContext context) {
    final nameController = TextEditingController();
    final modelController = TextEditingController();
    final urlController = TextEditingController();
    final keyController = TextEditingController();
    bool obscureKey = true;

    String selectedType = 'Cloud';
    String selectedSpeed = 'Smart';
    String selectedSecurity = 'Reliable';

    showDialog(
      context: context,
      barrierColor: Colors.black.withAlpha(200),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Dialog(
              backgroundColor: const Color(0xFF090D1A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: const BorderSide(color: Color(0xFF1E293B), width: 1.2),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Add AI Provider',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Connect a new intelligence model',
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF64748B),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFF0F172A),
                                border: Border.all(color: const Color(0xFF1E293B)),
                              ),
                              child: const Icon(
                                Icons.close_rounded,
                                color: Color(0xFF64748B),
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Input Fields
                      _buildDialogInputField(
                        label: 'Provider Name',
                        hint: 'Enter provider name (e.g. Gemini)',
                        controller: nameController,
                      ),
                      const SizedBox(height: 16),

                      _buildDialogInputField(
                        label: 'Model Identifier',
                        hint: 'Enter model identifier (e.g. gemini-1.5-pro)',
                        controller: modelController,
                      ),
                      const SizedBox(height: 16),

                      _buildDialogInputField(
                        label: 'API Endpoint / URL',
                        hint: 'Enter API endpoint URL (Optional)',
                        controller: urlController,
                      ),
                      const SizedBox(height: 16),

                      _buildDialogInputField(
                        label: 'API Key',
                        hint: 'Enter your API key',
                        controller: keyController,
                        obscureText: obscureKey,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setDialogState(() {
                              obscureKey = !obscureKey;
                            });
                          },
                          child: Icon(
                            obscureKey ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                            color: const Color(0xFF64748B),
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Dropdown Selectors
                      Row(
                        children: [
                          Expanded(
                            child: _buildDropdownSelection(
                              label: 'Provider Type',
                              value: selectedType,
                              options: ['Cloud', 'Local Server', 'Custom'],
                              onChanged: (val) {
                                setDialogState(() {
                                  selectedType = val;
                                  if (val == 'Local Server') {
                                    selectedSecurity = 'Private';
                                  } else if (val == 'Custom') {
                                    selectedSecurity = 'Advanced';
                                  } else {
                                    selectedSecurity = 'Reliable';
                                  }
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildDropdownSelection(
                              label: 'Speed Tag',
                              value: selectedSpeed,
                              options: ['Fast', 'Smart', 'Variety', 'Flexible'],
                              onChanged: (val) {
                                setDialogState(() {
                                  selectedSpeed = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Action Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
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
                            onTap: () {
                              if (nameController.text.trim().isEmpty ||
                                  modelController.text.trim().isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please fill in Provider Name and Model Identifier'),
                                    backgroundColor: Colors.redAccent,
                                  ),
                                );
                                return;
                              }

                              // Create provider
                              final newProvider = AIProviderModel(
                                id: nameController.text.trim().toLowerCase().replaceAll(' ', '_'),
                                name: nameController.text.trim(),
                                modelName: modelController.text.trim(),
                                type: selectedType,
                                speed: selectedSpeed,
                                security: selectedSecurity,
                                isConfigured: keyController.text.trim().isNotEmpty,
                              );

                              ref.read(aiProvidersProvider.notifier).addProvider(newProvider);
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Text(
                                'Add Provider',
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
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDialogInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool obscureText = false,
    Widget? suffixIcon,
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
            color: const Color(0xFF0F172A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 13),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 13),
              border: InputBorder.none,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownSelection({
    required String label,
    required String value,
    required List<String> options,
    required ValueChanged<String> onChanged,
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
            color: const Color(0xFF0F172A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF1E293B)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              dropdownColor: const Color(0xFF0F172A),
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF64748B)),
              items: options.map((String opt) {
                return DropdownMenuItem<String>(
                  value: opt,
                  child: Text(
                    opt,
                    style: GoogleFonts.inter(color: Colors.white, fontSize: 13),
                  ),
                );
              }).toList(),
              onChanged: (val) {
                if (val != null) onChanged(val);
              },
            ),
          ),
        ),
      ],
    );
  }
}

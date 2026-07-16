import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/ui_constants.dart';
import '../../../../core/router/route_names.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _scrollController = ScrollController();

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
            left: -80,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF7C3AED).withAlpha(8),
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

                        // Profile details card
                        _buildProfileDetailsCard(),
                        const SizedBox(height: Spacing.lg),

                        // Section: Preferences
                        _buildSectionHeader('Preferences'),
                        _buildSettingsRow(Icons.settings_outlined, 'General', 'App behavior and appearance'),
                        _buildSettingsRow(Icons.notifications_none_rounded, 'Notifications', 'Manage alerts and reminders'),
                        _buildSettingsRow(Icons.security_outlined, 'Privacy & Security', 'Data, privacy and security settings'),
                        _buildSettingsRow(Icons.cloud_outlined, 'Backup & Sync', 'Backup your data and sync across devices'),
                        const SizedBox(height: Spacing.lg),

                        // Section: AI & Voice
                        _buildSectionHeader('AI & Voice'),
                        _buildSettingsRow(
                          Icons.memory_rounded,
                          'AI Providers',
                          'Manage and configure AI providers',
                          onTap: () => context.push(RouteNames.aiProviders),
                        ),
                        _buildSettingsRow(
                          Icons.mic_none_rounded,
                          'Voice Settings',
                          'Speech, voice and playback settings',
                          onTap: () => context.push(RouteNames.voiceSpace),
                        ),
                        _buildSettingsRow(Icons.psychology_outlined, 'Memory & Context', 'Manage AI memory and context'),
                        const SizedBox(height: Spacing.lg),

                        // Section: Data & Storage
                        _buildSectionHeader('Data & Storage'),
                        _buildSettingsRow(Icons.storage_outlined, 'Storage Usage', 'Manage storage and files', trailingText: '4.27 GB / 20 GB'),
                        _buildSettingsRow(Icons.file_download_outlined, 'Download Settings', 'Manage downloads and offline content'),
                        _buildSettingsRow(
                          Icons.bug_report_outlined,
                          'Debug Database',
                          'View all raw database tables and data',
                          onTap: () => context.push(RouteNames.debug),
                        ),
                        const SizedBox(height: Spacing.lg),

                        // Section: Support & About
                        _buildSectionHeader('Support & About'),
                        _buildSettingsRow(Icons.help_outline_rounded, 'Help & Support', 'Get help and contact support'),
                        _buildSettingsRow(Icons.info_outline_rounded, 'About EternalMind AI', 'App information and version', trailingText: 'v1.0.0'),
                        const SizedBox(height: Spacing.lg),

                        // Logout button
                        _buildLogoutButton(),
                        const SizedBox(height: 100), // Space for bottom nav
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
                Icons.settings_outlined,
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
                  'Settings',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Customize your experience',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF64748B),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileDetailsCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF070B14),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              // Avatar
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF8B5CF6), width: 2),
                      color: const Color(0xFF8B5CF6).withAlpha(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.asset(
                        'assets/avatars/aftab.png',
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, s) => const Icon(Icons.person, color: Colors.white, size: 36),
                      ),
                    ),
                  ),
                  Container(
                    width: 22,
                    height: 22,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF8B5CF6),
                    ),
                    child: const Icon(Icons.edit_rounded, color: Colors.white, size: 10),
                  ),
                ],
              ),
              const SizedBox(width: 14),

              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Aftab Shah',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.verified_rounded, color: Color(0xFF00E5FF), size: 14),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'aftab.shah97@example.com',
                      style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 11, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '🎂 04 Dec 1997',
                      style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B5CF6).withAlpha(30),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      child: Text(
                        'Premium Plan',
                        style: GoogleFonts.inter(
                          color: const Color(0xFF8B5CF6),
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Edit profile button
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFF1E293B)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Text(
                  'Edit Profile',
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(height: 1, color: const Color(0xFF1E293B)),
          const SizedBox(height: 16),

          // Quick properties row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildQuickProp(Icons.dark_mode_outlined, 'Theme', 'Dark', const Color(0xFF8B5CF6)),
              _buildQuickProp(Icons.language_rounded, 'Language', 'English', const Color(0xFF00E5FF)),
              _buildQuickProp(Icons.graphic_eq_rounded, 'Voice', 'Male', const Color(0xFFEC4899)),
              _buildQuickProp(Icons.text_fields_rounded, 'Font Size', 'Medium', const Color(0xFF3B82F6)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickProp(IconData icon, String label, String value, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 8, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: GoogleFonts.inter(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 12),
      child: Text(
        title,
        style: GoogleFonts.inter(
          color: const Color(0xFF64748B),
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildSettingsRow(
    IconData icon,
    String title,
    String subtitle, {
    String? trailingText,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF090D1A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF1E293B)),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF1E293B).withAlpha(40),
              ),
              child: Icon(icon, color: const Color(0xFF8B5CF6), size: 18),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),

            if (trailingText != null)
              Text(
                trailingText,
                style: GoogleFonts.inter(color: const Color(0xFF8B5CF6), fontSize: 10, fontWeight: FontWeight.bold),
              ),
            const SizedBox(width: 6),
            const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFF64748B), size: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1B0C16),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEC4899).withAlpha(60)),
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
            child: const Icon(Icons.logout_rounded, color: Color(0xFFEC4899), size: 16),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Logout',
                  style: GoogleFonts.inter(color: const Color(0xFFEC4899), fontSize: 13, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Sign out from your account',
                  style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFEC4899), size: 12),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/ui_constants.dart';
import '../../providers/wizard_providers.dart';

class Step2Biography extends ConsumerStatefulWidget {
  const Step2Biography({super.key});

  @override
  ConsumerState<Step2Biography> createState() => _Step2BiographyState();
}

class _Step2BiographyState extends ConsumerState<Step2Biography> {
  final _scrollController = ScrollController();

  late TextEditingController _aboutCtrl;
  late TextEditingController _philosophyCtrl;
  late TextEditingController _missionCtrl;

  @override
  void initState() {
    super.initState();
    final p = ref.read(wizardProvider).profile;
    _aboutCtrl = TextEditingController(text: p.about ?? '');
    _philosophyCtrl = TextEditingController(text: p.lifePhilosophy ?? '');
    _missionCtrl = TextEditingController(text: 'My mission is to preserve human knowledge through EternalMind AI and create technology that helps future generations. I want to build useful systems, support my family, and leave behind something meaningful for the world.');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _aboutCtrl.dispose();
    _philosophyCtrl.dispose();
    _missionCtrl.dispose();
    super.dispose();
  }

  void _updateProfile() {
    final p = ref.read(wizardProvider).profile;
    ref.read(wizardProvider.notifier).updateProfile(
          p.copyWith(
            about: _aboutCtrl.text.trim().isEmpty ? null : _aboutCtrl.text.trim(),
            lifePhilosophy: _philosophyCtrl.text.trim().isEmpty
                ? null
                : _philosophyCtrl.text.trim(),
          ),
        );
  }

  void _generateWithAI() {
    setState(() {
      _aboutCtrl.text = "My name is Aftab Shah, a software developer, entrepreneur, and founder of PrintOnex Printing & Digital Solutions and Kanglei Innovations. I enjoy building AI systems, Flutter applications, Linux server infrastructure, and self-hosted technologies...";
      _philosophyCtrl.text = "Life is temporary, but the knowledge, kindness, and positive impact we leave behind can continue for generations. I believe technology should serve humanity, family should always come first, and every challenge is an opportunity to learn and grow...";
      _missionCtrl.text = "My mission is to preserve human knowledge through EternalMind AI and create technology that helps future generations. I want to build useful systems, support my family, and leave behind something meaningful for the world.";
    });
    _updateProfile();
  }

  @override
  Widget build(BuildContext context) {
    final wizard = ref.watch(wizardProvider);
    final p = wizard.profile;

    // Get quotes list
    final quotes = p.favoriteQuotes != null && p.favoriteQuotes!.isNotEmpty
        ? p.favoriteQuotes!.split(';')
        : <String>[
            "Never stop learning.",
            "Success comes from consistency.",
            "Every problem has a solution.",
            "Trust Allah and keep moving forward."
          ];

    // Get hobbies list
    final hobbies = p.hobbies != null && p.hobbies!.isNotEmpty
        ? p.hobbies!.split(',')
        : <String>["Coding", "Linux", "AI & ML", "Reading", "Business"];

    return Column(
      children: [
        // ── Scrollable Card Content ──
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.lg,
              vertical: Spacing.xs,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF070B14),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFF1E293B),
                  width: 1.2,
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Step header (Step 2 of 5, Biography & Core Beliefs...)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xFF8B5CF6).withAlpha(30),
                                  ),
                                  child: const Icon(
                                    Icons.psychology_outlined,
                                    color: Color(0xFF8B5CF6),
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Step 2 of 5',
                                  style: GoogleFonts.inter(
                                    color: const Color(0xFF8B5CF6),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Biography & Core Beliefs',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Help your AI understand who you are, what you believe in, and how you see the world.',
                              style: GoogleFonts.inter(
                                color: const Color(0xFF64748B),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Hologram Circle (Feather/Book)
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              const Color(0xFF8B5CF6).withAlpha(40),
                              Colors.transparent,
                            ],
                            radius: 0.6,
                          ),
                        ),
                        child: Center(
                          child: ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
                            ).createShader(bounds),
                            child: const Icon(
                              Icons.edit_note_rounded,
                              color: Colors.white,
                              size: 48,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  const Divider(color: Color(0xFF1E293B), height: 1),
                  const SizedBox(height: 20),

                  // About Me Field
                  _buildMultilineInputField(
                    controller: _aboutCtrl,
                    label: 'About Me',
                    hintText: 'Tell your story...',
                    maxLength: 2000,
                    prefixIcon: const Icon(Icons.person_outline_rounded, color: Color(0xFF8B5CF6), size: 18),
                    isRequired: true,
                    onChanged: (_) => _updateProfile(),
                  ),
                  const SizedBox(height: 16),

                  // Life Philosophy Field
                  _buildMultilineInputField(
                    controller: _philosophyCtrl,
                    label: 'Life Philosophy',
                    hintText: 'What drives you?',
                    maxLength: 1500,
                    prefixIcon: const Icon(Icons.track_changes_outlined, color: Color(0xFF00E5FF), size: 18),
                    isRequired: true,
                    onChanged: (_) => _updateProfile(),
                  ),
                  const SizedBox(height: 16),

                  // Favorite Quotes Section
                  _buildFavoriteQuotesSection(quotes),
                  const SizedBox(height: 16),

                  // Hobbies & Interests Section
                  _buildHobbiesSection(hobbies),
                  const SizedBox(height: 16),

                  // Mission in Life Field
                  _buildMultilineInputField(
                    controller: _missionCtrl,
                    label: 'Mission in Life',
                    hintText: 'What is your ultimate mission?',
                    maxLength: 1500,
                    prefixIcon: const Icon(Icons.outlined_flag_rounded, color: Color(0xFF10B981), size: 18),
                  ),
                ],
              ),
            ),
          ),
        ),

        // ── Quick Fill Banner ──
        _buildQuickFillBanner(),

        // ── Bottom Navigation Bar ──
        _buildBottomBar(),
      ],
    );
  }

  Widget _buildMultilineInputField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required int maxLength,
    Widget? prefixIcon,
    bool isRequired = false,
    void Function(String)? onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF1E293B),
          width: 1.2,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (prefixIcon != null) ...[
                prefixIcon,
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (isRequired) ...[
                const SizedBox(width: 4),
                const Text(
                  '*',
                  style: TextStyle(
                    color: Color(0xFFEF4444),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
              const Spacer(),
              Text(
                '${controller.text.length}/$maxLength',
                style: GoogleFonts.inter(
                  color: const Color(0xFF64748B),
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: controller,
            maxLines: 4,
            minLines: 3,
            onChanged: (text) {
              setState(() {});
              if (onChanged != null) onChanged(text);
            },
            style: GoogleFonts.inter(
              color: const Color(0xFFF8FAFC),
              fontSize: 14,
              height: 1.5,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.inter(
                color: const Color(0xFF475569),
                fontSize: 14,
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteQuotesSection(List<String> quotes) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFEC4899).withAlpha(20),
                ),
                child: const Center(
                  child: Icon(Icons.format_quote_rounded, color: Color(0xFFEC4899), size: 16),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Favorite Quotes',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                '${quotes.length} quotes added >',
                style: GoogleFonts.inter(
                  color: const Color(0xFF00E5FF),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: quotes.map((quote) {
              return Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF8B5CF6).withAlpha(100),
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '"$quote"',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () => _removeQuote(quote, quotes),
                      child: const Icon(
                        Icons.close_rounded,
                        color: Color(0xFF64748B),
                        size: 14,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => _addQuoteDialog(quotes),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFF00E5FF).withAlpha(120),
                  width: 1.2,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.add_rounded,
                    color: Color(0xFF00E5FF),
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Add Quote',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF00E5FF),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
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

  Widget _buildHobbiesSection(List<String> hobbies) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF090D1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF00E5FF).withAlpha(20),
                ),
                child: const Center(
                  child: Icon(Icons.favorite_rounded, color: Color(0xFF00E5FF), size: 16),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Hobbies & Interests',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ...hobbies.map((hobby) {
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF00E5FF).withAlpha(60),
                      width: 1.2,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _getHobbyIcon(hobby),
                      const SizedBox(width: 6),
                      Text(
                        hobby,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () => _removeHobby(hobby, hobbies),
                        child: const Icon(
                          Icons.close_rounded,
                          color: Color(0xFF64748B),
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              GestureDetector(
                onTap: () => _addHobbyDialog(hobbies),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF64748B).withAlpha(120),
                      width: 1.2,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add_rounded,
                      color: Color(0xFF64748B),
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getHobbyIcon(String hobby) {
    final lower = hobby.toLowerCase();
    if (lower.contains('code') || lower.contains('coding') || lower.contains('develop')) {
      return const Icon(Icons.code_rounded, color: Color(0xFF8B5CF6), size: 14);
    } else if (lower.contains('linux') || lower.contains('tux') || lower.contains('sysadmin')) {
      return const Icon(Icons.terminal_rounded, color: Color(0xFF00E5FF), size: 14);
    } else if (lower.contains('ai') || lower.contains('ml') || lower.contains('intelligence')) {
      return const Icon(Icons.psychology_rounded, color: Color(0xFFEC4899), size: 14);
    } else if (lower.contains('read') || lower.contains('book')) {
      return const Icon(Icons.menu_book_rounded, color: Color(0xFF10B981), size: 14);
    } else if (lower.contains('business') || lower.contains('finance') || lower.contains('entrepreneur')) {
      return const Icon(Icons.business_center_rounded, color: Color(0xFFF59E0B), size: 14);
    }
    return const Icon(Icons.star_rounded, color: Color(0xFF00E5FF), size: 14);
  }

  Widget _buildQuickFillBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Spacing.lg, vertical: Spacing.xs),
      decoration: BoxDecoration(
        color: const Color(0xFF0C162D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E293B), width: 1.2),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          const Icon(
            Icons.auto_awesome_rounded,
            color: Color(0xFF00E5FF),
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Quick Fill (Optional)',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF00E5FF),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Use AI to generate initial content based on basic info.',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF94A3B8),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: _generateWithAI,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
                  ),
                ),
                padding: const EdgeInsets.all(1.2),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF0C162D),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.auto_awesome_rounded,
                        color: Colors.white,
                        size: 14,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Generate with AI',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        Spacing.lg,
        Spacing.sm,
        Spacing.lg,
        Spacing.lg,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF03050A),
        border: Border(
          top: BorderSide(color: Color(0xFF1E293B), width: 1),
        ),
      ),
      child: Row(
        children: [
          // Previous Step
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                ref.read(wizardProvider.notifier).previousStep();
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF1E293B), width: 1.2),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_back_rounded,
                    color: Color(0xFF64748B),
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Previous Step',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF94A3B8),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Next Step
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  ref.read(wizardProvider.notifier).nextStep();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next Step',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addQuoteDialog(List<String> quotes) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF0F172A),
          title: Text(
            'Add Favorite Quote',
            style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: TextField(
            controller: controller,
            style: GoogleFonts.inter(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Enter quote here...',
              hintStyle: GoogleFonts.inter(color: const Color(0xFF475569)),
              enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF1E293B))),
              focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF8B5CF6))),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: GoogleFonts.inter(color: const Color(0xFF64748B))),
            ),
            TextButton(
              onPressed: () {
                final text = controller.text.trim();
                if (text.isNotEmpty) {
                  quotes.add(text);
                  final updated = quotes.join(';');
                  final p = ref.read(wizardProvider).profile;
                  ref.read(wizardProvider.notifier).updateProfile(
                        p.copyWith(favoriteQuotes: updated),
                      );
                  setState(() {});
                }
                Navigator.pop(context);
              },
              child: Text('Add', style: GoogleFonts.inter(color: const Color(0xFF00E5FF))),
            ),
          ],
        );
      },
    );
  }

  void _removeQuote(String quote, List<String> quotes) {
    quotes.remove(quote);
    final updated = quotes.join(';');
    final p = ref.read(wizardProvider).profile;
    ref.read(wizardProvider.notifier).updateProfile(
          p.copyWith(favoriteQuotes: updated.isEmpty ? null : updated),
        );
    setState(() {});
  }

  void _addHobbyDialog(List<String> hobbies) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF0F172A),
          title: Text(
            'Add Hobby / Interest',
            style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: TextField(
            controller: controller,
            style: GoogleFonts.inter(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'e.g. Hiking, Cooking',
              hintStyle: GoogleFonts.inter(color: const Color(0xFF475569)),
              enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF1E293B))),
              focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF8B5CF6))),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: GoogleFonts.inter(color: const Color(0xFF64748B))),
            ),
            TextButton(
              onPressed: () {
                final text = controller.text.trim();
                if (text.isNotEmpty) {
                  hobbies.add(text);
                  final updated = hobbies.join(',');
                  final p = ref.read(wizardProvider).profile;
                  ref.read(wizardProvider.notifier).updateProfile(
                        p.copyWith(hobbies: updated),
                      );
                  setState(() {});
                }
                Navigator.pop(context);
              },
              child: Text('Add', style: GoogleFonts.inter(color: const Color(0xFF00E5FF))),
            ),
          ],
        );
      },
    );
  }

  void _removeHobby(String hobby, List<String> hobbies) {
    hobbies.remove(hobby);
    final updated = hobbies.join(',');
    final p = ref.read(wizardProvider).profile;
    ref.read(wizardProvider.notifier).updateProfile(
          p.copyWith(hobbies: updated.isEmpty ? null : updated),
        );
    setState(() {});
  }
}

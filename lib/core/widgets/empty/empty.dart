import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';

/// ── BaseEmptyState ──
class BaseEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Widget? actionButton;
  final Color accentColor;

  const BaseEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.actionButton,
    this.accentColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: accentColor.withAlpha(20),
                border: Border.all(color: accentColor.withAlpha(80), width: 1.2),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: accentColor,
                  size: 28,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: AppColors.textSecondary,
                fontSize: 11,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
            if (actionButton != null) ...[
              const SizedBox(height: 20),
              actionButton!,
            ],
          ],
        ),
      ),
    );
  }
}

/// ── EmptyMemories ──
class EmptyMemories extends StatelessWidget {
  final Widget? actionButton;

  const EmptyMemories({super.key, this.actionButton});

  @override
  Widget build(BuildContext context) {
    return BaseEmptyState(
      icon: Icons.photo_library_outlined,
      title: 'No Memories Archived',
      description: 'Create memory nodes, tag milestones, and store photos to map your replica.',
      actionButton: actionButton,
      accentColor: AppColors.accent,
    );
  }
}

/// ── EmptyTimeline ──
class EmptyTimeline extends StatelessWidget {
  final Widget? actionButton;

  const EmptyTimeline({super.key, this.actionButton});

  @override
  Widget build(BuildContext context) {
    return BaseEmptyState(
      icon: Icons.timeline_rounded,
      title: 'Timeline is Empty',
      description: 'Configure chronological life milestones to build your neural double\'s history.',
      actionButton: actionButton,
      accentColor: AppColors.primary,
    );
  }
}

/// ── EmptyVoice ──
class EmptyVoice extends StatelessWidget {
  final Widget? actionButton;

  const EmptyVoice({super.key, this.actionButton});

  @override
  Widget build(BuildContext context) {
    return BaseEmptyState(
      icon: Icons.keyboard_voice_outlined,
      title: 'Voice Model Unrecorded',
      description: 'Record reference audio samples to train the digital replica synthesizer.',
      actionButton: actionButton,
      accentColor: AppColors.secondary,
    );
  }
}

/// ── EmptyFamily ──
class EmptyFamily extends StatelessWidget {
  final Widget? actionButton;

  const EmptyFamily({super.key, this.actionButton});

  @override
  Widget build(BuildContext context) {
    return BaseEmptyState(
      icon: Icons.account_tree_outlined,
      title: 'No Family Added',
      description: 'Build your family map to teach your digital clone your ancestry.',
      actionButton: actionButton,
      accentColor: AppColors.info,
    );
  }
}

/// ── EmptyJournal ──
class EmptyJournal extends StatelessWidget {
  final Widget? actionButton;

  const EmptyJournal({super.key, this.actionButton});

  @override
  Widget build(BuildContext context) {
    return BaseEmptyState(
      icon: Icons.edit_note_rounded,
      title: 'No Journal Entries',
      description: 'Record today\'s thoughts, mood, and activities to keep your clone synced.',
      actionButton: actionButton,
      accentColor: AppColors.success,
    );
  }
}

/// ── EmptyProvider ──
class EmptyProvider extends StatelessWidget {
  final Widget? actionButton;

  const EmptyProvider({super.key, this.actionButton});

  @override
  Widget build(BuildContext context) {
    return BaseEmptyState(
      icon: Icons.api_rounded,
      title: 'No AI Providers Connected',
      description: 'Link external LLM services (Gemini, Groq, Ollama) to route conversation tokens.',
      actionButton: actionButton,
      accentColor: AppColors.warning,
    );
  }
}

/// ── EmptySearch ──
class EmptySearch extends StatelessWidget {
  const EmptySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseEmptyState(
      icon: Icons.search_off_rounded,
      title: 'No Results Found',
      description: 'We couldn\'t find any records matching your search queries.',
      accentColor: AppColors.textTertiary,
    );
  }
}

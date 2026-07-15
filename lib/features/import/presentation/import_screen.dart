/// {@template import_screen}
/// Import Replica Backup screen.
///
/// Sections: AppBar, Title, Step Progress, Upload Area, Selected File Card,
/// Backup Preview Card (profile + 3×5 stat grid), Security Card,
/// Bottom Action Buttons.
/// {@endtemplate}
library;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/constants/ui_constants.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/inputs/gradient_button.dart';
import '../providers/import_providers.dart';
import '../models/import_models.dart';

/// {@macro import_screen}
class ImportScreen extends ConsumerStatefulWidget {
  const ImportScreen({super.key});

  @override
  ConsumerState<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends ConsumerState<ImportScreen>
    with TickerProviderStateMixin {
  late final AnimationController _glowController;
  late final AnimationController _floatController;
  late final AnimationController _fadeController;

  late final Animation<double> _breathingGlow;
  late final Animation<double> _floatAnim;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _breathingGlow = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOutSine),
    );

    _floatAnim = Tween<double>(begin: -8.0, end: 8.0).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _glowController.dispose();
    _floatController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  Future<void> _pickFile() async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
        withData: true,
      );
      if (result == null || result.files.isEmpty) return;

      final file = result.files.first;
      final filePath = file.path;
      final fileName = file.name;

      if (filePath == null) {
        _showError('Could not access the selected file.');
        return;
      }

      // Show loading state during file read
      ref.read(importProvider.notifier).setLoading(true);

      final contents = await File(filePath).readAsString();
      if (!mounted) return;

      await ref.read(importProvider.notifier).selectFile(
            filePath,
            fileName,
            contents,
          );

      // Handle validation errors immediately after selectFile
      final updatedState = ref.read(importProvider);
      if (updatedState.validationError != null) {
        _showError(updatedState.validationError!);
        ref.read(importProvider.notifier).dismissError();
      } else {
        _fadeController.forward(from: 0.0);
      }
    } catch (e) {
      _showError(
          'Failed to read file: ${e.toString().replaceFirst('Exception: ', '')}');
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.error,
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(importProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF070B16),
      body: SafeArea(
        child: Column(
          children: [
            // ── AppBar ──
            _buildAppBar(),

            // ── Loading overlay during file read ──
            if (state.isLoading)
              const LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8A2EFF)),
                minHeight: 2,
              ),

            // ── Scrollable Content ──
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Spacing.md),

                    // ── Title Section ──
                    _buildTitleSection(),

                    const SizedBox(height: Spacing.xxl),

                    // ── Step Progress ──
                    _buildStepProgress(state.currentStep),

                    const SizedBox(height: Spacing.xxl),

                    // ── Upload Area ──
                    _buildUploadArea(),

                    const SizedBox(height: Spacing.lg),

                    // ── Selected File Card ──
                    if (state.selectedFileName != null)
                      FadeTransition(
                        opacity: _fadeController,
                        child: _buildSelectedFileCard(state),
                      ),

                    if (state.selectedFileName != null)
                      const SizedBox(height: Spacing.lg),

                    // ── Validation Error Card ──
                    if (state.selectedFileName != null &&
                        state.backupData == null &&
                        !state.isLoading)
                      _buildErrorCard(),

                    if (state.selectedFileName != null &&
                        state.backupData == null &&
                        !state.isLoading)
                      const SizedBox(height: Spacing.lg),

                    // ── Backup Preview Card ──
                    if (state.backupData != null)
                      FadeTransition(
                        opacity: _fadeController,
                        child: _buildBackupPreviewCard(state.backupData!),
                      ),

                    if (state.backupData != null)
                      const SizedBox(height: Spacing.lg),

                    // ── Security Card ──
                    if (state.backupData != null)
                      FadeTransition(
                        opacity: _fadeController,
                        child: _buildSecurityCard(),
                      ),

                    const SizedBox(height: Spacing.xxl),
                  ],
                ),
              ),
            ),

            // ── Bottom Action Buttons ──
            if (state.selectedFileName != null) _buildBottomButtons(state),
          ],
        ),
      ),
    );
  }

  // ── AppBar ──
  Widget _buildAppBar() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Spacing.md, vertical: Spacing.sm),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.surfaceGlass,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.sm + 2,
              vertical: Spacing.xs,
            ),
            decoration: BoxDecoration(
              color: AppColors.success.withAlpha(20),
              borderRadius: BorderRadius.circular(RadiusConstants.full),
              border: Border.all(
                color: AppColors.success.withAlpha(51),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.shield_rounded,
                  color: AppColors.success,
                  size: 14,
                ),
                const SizedBox(width: 4),
                Text(
                  'Secure',
                  style: TextStyle(
                    color: AppColors.success,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Title Section ──
  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Import Replica Backup',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.02,
          ),
        ),
        const SizedBox(height: Spacing.xs),
        Text(
          'Restore your Digital Human in seconds',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  // ── Step Progress ──
  Widget _buildStepProgress(ImportStep currentStep) {
    final steps = [
      ImportStep.selectFile,
      ImportStep.preview,
      ImportStep.importing,
    ];
    final labels = ['Select File', 'Preview', 'Import'];
    final currentIndex = steps.indexOf(currentStep);

    return Row(
      children: List.generate(3, (index) {
        final isActive = index == currentIndex;
        final isCompleted = index < currentIndex;
        return Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: isActive || isCompleted
                          ? const LinearGradient(
                              colors: [Color(0xFF8A2EFF), Color(0xFF00D9FF)])
                          : null,
                      color:
                          isActive || isCompleted ? null : AppColors.surfaceElevated,
                      border: Border.all(
                        color: isActive
                            ? const Color(0xFF8A2EFF)
                            : isCompleted
                                ? const Color(0xFF8A2EFF).withAlpha(128)
                                : AppColors.glassBorder,
                        width: isActive ? 2 : 1.5,
                      ),
                      boxShadow: isActive
                          ? [
                              BoxShadow(
                                color: const Color(0xFF8A2EFF).withAlpha(77),
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ]
                          : [],
                    ),
                    child: Center(
                      child: isCompleted
                          ? const Icon(Icons.check_rounded,
                              color: Colors.white, size: 14)
                          : Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: isActive
                                    ? Colors.white
                                    : AppColors.textSecondary,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                  if (index < 2)
                    Expanded(
                      child: Container(
                        height: 2,
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          gradient: isCompleted
                              ? const LinearGradient(
                                  colors: [
                                    Color(0xFF8A2EFF),
                                    Color(0xFF00D9FF),
                                  ],
                                )
                              : null,
                          color: isCompleted ? null : AppColors.glassBorder,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                labels[index],
                style: TextStyle(
                  color: isActive ? Colors.white : AppColors.textTertiary,
                  fontSize: 10,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // ── Upload Area ──
  Widget _buildUploadArea() {
    return AnimatedBuilder(
      animation: _glowController,
      builder: (context, _) {
        return AnimatedBuilder(
          animation: _floatAnim,
          builder: (context, _) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: Spacing.massive,
                horizontal: Spacing.xxl,
              ),
              decoration: BoxDecoration(
                color: AppColors.surfaceGlass,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Color.lerp(
                    const Color(0xFF8A2EFF).withAlpha(77),
                    const Color(0xFF00D9FF).withAlpha(77),
                    _breathingGlow.value,
                  )!,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF8A2EFF).withAlpha(
                      (20 * _breathingGlow.value).round(),
                    ),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.translate(
                    offset: Offset(0, _floatAnim.value),
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF8A2EFF), Color(0xFF00D9FF)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF8A2EFF).withAlpha(51),
                            blurRadius: 16,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.cloud_upload_rounded,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacing.lg),
                  const Text(
                    'Drag & Drop your JSON backup here',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: Spacing.sm),
                  Text(
                    'or',
                    style: TextStyle(
                      color: AppColors.textTertiary,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: Spacing.lg),
                  GestureDetector(
                    onTap: _pickFile,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.xxl,
                        vertical: Spacing.md,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                          width: 1.5,
                          color: Color.lerp(
                            const Color(0xFF8A2EFF),
                            const Color(0xFF00D9FF),
                            _breathingGlow.value * 0.5,
                          )!,
                        ),
                        color: Colors.transparent,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.folder_open_rounded,
                            color: const Color(0xFF8A2EFF),
                            size: 20,
                          ),
                          const SizedBox(width: Spacing.sm),
                          const Text(
                            'Browse File',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacing.lg),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: AppColors.textTertiary,
                        size: 14,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Supports .json backup files from EternalMind AI',
                        style: TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // ── Selected File Card ──
  Widget _buildSelectedFileCard(ImportState state) {
    return GlassCard(
      borderRadius: 22,
      padding: const EdgeInsets.all(Spacing.lg),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8A2EFF), Color(0xFF00D9FF)],
                  ),
                ),
                child: const Icon(
                  Icons.description_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              Positioned(
                right: -2,
                bottom: -2,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.success,
                    border: Border.all(
                      color: const Color(0xFF070B16),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                    size: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.selectedFileName ?? 'Unknown file',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Backup file · ${_formatDate(DateTime.now())}',
                  style: TextStyle(
                    color: AppColors.textTertiary,
                    fontSize: 12,
                  ),
                ),
                if (state.backupData != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    'Size: ${state.backupData!.storageSize}',
                    style: TextStyle(
                      color: AppColors.textTertiary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              ref.read(importProvider.notifier).clearFile();
              _fadeController.reset();
            },
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.surfaceGlass,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: const Icon(
                Icons.delete_outline_rounded,
                color: Color(0xFFEF4444),
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Validation Error Card ──
  Widget _buildErrorCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: AppColors.error.withAlpha(13),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.error.withAlpha(51),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.error.withAlpha(26),
            ),
            child: const Icon(
              Icons.error_outline_rounded,
              color: AppColors.error,
              size: 18,
            ),
          ),
          const SizedBox(width: Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Invalid Backup File',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'The selected file is not a valid EternalMind AI backup. Please select a valid .json backup file or try creating a new replica.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Backup Preview Card ──
  Widget _buildBackupPreviewCard(BackupData data) {
    return GlassCard(
      borderRadius: 24,
      padding: const EdgeInsets.all(Spacing.lg),
      glowColor: const Color(0xFF8A2EFF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Backup Preview',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: Spacing.lg),

          // Profile section
          Row(
            children: [
              AnimatedBuilder(
                animation: _glowController,
                builder: (context, _) {
                  return Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xFF8A2EFF), Color(0xFF00D9FF)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF8A2EFF).withAlpha(
                            (51 * _breathingGlow.value).round(),
                          ),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF111827),
                        ),
                        child: Center(
                          child: Text(
                            data.fullName.isNotEmpty
                                ? data.fullName[0].toUpperCase()
                                : '?',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: Spacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.fullName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Digital Human Replica',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: Spacing.sm),
                    _buildInfoRow(
                      Icons.cake_outlined,
                      'Born: ${data.birthPlace}',
                    ),
                    const SizedBox(height: 2),
                    _buildInfoRow(
                      Icons.location_on_outlined,
                      'Location: ${data.currentCity}',
                    ),
                    const SizedBox(height: 2),
                    _buildInfoRow(
                      Icons.tag_outlined,
                      'ID: ${data.profileId}',
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: Spacing.lg),
          _buildStatsGrid(data),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.textTertiary, size: 13),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsGrid(BackupData data) {
    final stats = <_StatItem>[
      _StatItem('Profile', Icons.person_rounded, const Color(0xFF8A2EFF), 1),
      _StatItem('Family', Icons.family_restroom_rounded,
          const Color(0xFFEC4899), data.familyCount),
      _StatItem('Education', Icons.school_rounded, const Color(0xFF3B82F6),
          data.educationCount),
      _StatItem('Career', Icons.work_rounded, const Color(0xFF10B981),
          data.careerCount),
      _StatItem('Stories', Icons.auto_stories_rounded,
          const Color(0xFFF59E0B), data.storyCount),
      _StatItem('Timeline', Icons.timeline_rounded, const Color(0xFF8A2EFF),
          data.timelineCount),
      _StatItem('Journals', Icons.book_rounded, const Color(0xFFEC4899),
          data.journalCount),
      _StatItem('Memories', Icons.memory_rounded, const Color(0xFF3B82F6),
          data.memoryCount),
      _StatItem('Photos', Icons.photo_library_rounded,
          const Color(0xFF10B981), data.photoCount),
      _StatItem('Documents', Icons.description_rounded,
          const Color(0xFFF59E0B), data.documentCount),
      _StatItem('Voice', Icons.mic_rounded, const Color(0xFF8A2EFF),
          data.voiceCount),
      _StatItem('Legacy', Icons.forum_rounded, const Color(0xFFEC4899),
          data.legacyCount),
      _StatItem('AI Persona', Icons.psychology_rounded,
          const Color(0xFF3B82F6), 1),
      _StatItem('AI Providers', Icons.cloud_rounded, const Color(0xFF10B981),
          data.aiProviderCount),
      _StatItem('Total Size', Icons.storage_rounded,
          const Color(0xFFF59E0B), 0),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.0,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final stat = stats[index];
        final value = index == 0
            ? '1'
            : index == stats.length - 1
                ? data.storageSize
                : '${stat.count}';
        return _buildStatCard(stat.icon, stat.label, value, stat.color);
      },
    );
  }

  Widget _buildStatCard(
      IconData icon, String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard.withAlpha(180),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withAlpha(30),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: AppColors.textTertiary,
              fontSize: 9,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // ── Security Card ──
  Widget _buildSecurityCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surfaceGlass,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFF8A2EFF).withAlpha(30),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF8A2EFF).withAlpha(26),
            ),
            child: const Icon(
              Icons.shield_rounded,
              color: Color(0xFF8A2EFF),
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
                  'All data is stored locally on your device. Nothing is uploaded.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Bottom Action Buttons ──
  Widget _buildBottomButtons(ImportState state) {
    final hasData = state.backupData != null;
    final canImport = hasData && !state.importSuccess;

    return Container(
      padding: const EdgeInsets.fromLTRB(
        Spacing.lg,
        Spacing.sm,
        Spacing.lg,
        Spacing.lg,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.glassBorder),
        ),
      ),
      child: Row(
        children: [
          // Cancel button
          Expanded(
            child: GestureDetector(
              onTap: () {
                ref.read(importProvider.notifier).clearFile();
                _fadeController.reset();
              },
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.surfaceGlass,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: const Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: Spacing.md),
          // Import / Preview button
          Expanded(
            child: hasData
                ? GradientButton(
                    label: state.isImporting
                        ? 'Importing...'
                        : state.importSuccess
                            ? 'Imported!'
                            : 'Import Backup',
                    icon: state.isImporting || state.importSuccess
                        ? null
                        : const Icon(Icons.download_rounded, size: 18),
                    loading: state.isImporting,
                    onPressed: canImport
                        ? () => ref.read(importProvider.notifier).startImport()
                        : null,
                  )
                : GradientButton(
                    label: 'Try Again',
                    icon: const Icon(Icons.refresh_rounded, size: 18),
                    onPressed: _pickFile,
                  ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}

/// Data class for stat items in the grid.
class _StatItem {
  const _StatItem(this.label, this.icon, this.color, this.count);

  final String label;
  final IconData icon;
  final Color color;
  final int count;
}

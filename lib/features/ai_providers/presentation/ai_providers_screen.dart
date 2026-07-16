import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_selector/file_selector.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../core/constants/ui_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_gradients.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/inputs/gradient_button.dart';
import '../core/constants.dart';
import '../models/ai_provider_model.dart';
import '../providers/ai_providers_providers.dart';

class AIProvidersScreen extends ConsumerStatefulWidget {
  const AIProvidersScreen({super.key});

  @override
  ConsumerState<AIProvidersScreen> createState() => _AIProvidersScreenState();
}

class _AIProvidersScreenState extends ConsumerState<AIProvidersScreen> {
  String _searchQuery = '';
  String _filterType = 'all'; // all, connected, disconnected, active
  String _sortBy = 'newest'; // newest, oldest, alphabetical

  final Set<String> _testingIds = {}; // Track providers currently testing

  @override
  Widget build(BuildContext context) {
    final providers = ref.watch(aiProvidersProvider);
    final activeProvider = providers.firstWhere(
      (p) => p.isEnabled,
      orElse: () => providers.isNotEmpty
          ? providers.first
          : AIProviderModel(id: '', name: 'None', providerType: 'custom'),
    );

    // Apply search query, filter type, and sorting
    final filteredProviders = providers.where((p) {
      final matchesSearch = p.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.providerType.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.model.toLowerCase().contains(_searchQuery.toLowerCase());

      if (!matchesSearch) return false;

      switch (_filterType) {
        case 'connected':
          return p.isConnected;
        case 'disconnected':
          return !p.isConnected;
        case 'active':
          return p.isEnabled;
        default:
          return true;
      }
    }).toList();

    // Sort providers
    if (_sortBy == 'newest') {
      filteredProviders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    } else if (_sortBy == 'oldest') {
      filteredProviders.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    } else if (_sortBy == 'alphabetical') {
      filteredProviders.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    }

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text('AI Providers', style: AppTypography.heading3.copyWith(color: AppColors.textPrimary)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.download_rounded, color: AppColors.secondary, size: 22),
            tooltip: 'Export Config',
            onPressed: () => _exportConfig(context),
          ),
          IconButton(
            icon: const Icon(Icons.upload_rounded, color: AppColors.accent, size: 22),
            tooltip: 'Import Config',
            onPressed: () => _importConfig(context),
          ),
          const SizedBox(width: Spacing.sm),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddProviderSheet(context),
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add_rounded, color: Colors.white),
        label: Text('Add Provider', style: AppTypography.button.copyWith(color: Colors.white)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(RadiusConstants.xl)),
      ),
      body: Stack(
        children: [
          // Background subtle gradients (glow spheres)
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withAlpha(20),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondary.withAlpha(15),
              ),
            ),
          ),
          SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // Top section displays active provider
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.lg, vertical: Spacing.md),
                    child: _buildActiveProviderCard(activeProvider),
                  ),
                ),

                // Search & Filter header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.lg, vertical: Spacing.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSearchBar(),
                        const SizedBox(height: Spacing.md),
                        _buildFilterAndSortRow(),
                        const SizedBox(height: Spacing.md),
                        Text(
                          'Providers',
                          style: AppTypography.heading3.copyWith(color: AppColors.textPrimary, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),

                // Providers list
                if (filteredProviders.isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.psychology_outlined, size: 60, color: AppColors.textTertiary.withAlpha(128)),
                          const SizedBox(height: Spacing.md),
                          Text(
                            'No providers match criteria',
                            style: AppTypography.bodyLarge.copyWith(color: AppColors.textSecondary),
                          ),
                          const SizedBox(height: Spacing.xs),
                          Text(
                            'Try changing filters or add a new provider',
                            style: AppTypography.bodySmall.copyWith(color: AppColors.textTertiary),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.only(
                      left: Spacing.lg,
                      right: Spacing.lg,
                      bottom: 80, // Safe margin for FAB
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final provider = filteredProviders[index];
                          return Hero(
                            tag: 'provider_${provider.id}',
                            child: Material(
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: Spacing.md),
                                child: _buildProviderCard(provider),
                              ),
                            ),
                          );
                        },
                        childCount: filteredProviders.length,
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

  // ─── Header Active Provider Card ───────────────────────────────────────

  Widget _buildActiveProviderCard(AIProviderModel active) {
    final info = AppConstants.providerTypes[active.providerType] ?? AppConstants.providerTypes['custom']!;
    final name = active.id.isNotEmpty ? active.name : 'No Provider Active';
    final hasActive = active.id.isNotEmpty;

    return GlassCard(
      borderRadius: 28,
      variant: GlassCardVariant.hero,
      glowColor: hasActive && active.isConnected ? AppColors.success : AppColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Active Provider',
                style: AppTypography.caption.copyWith(color: AppColors.textSecondary, letterSpacing: 1.0, fontSize: 10, fontWeight: FontWeight.bold),
              ),
              if (hasActive)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.sm, vertical: 2),
                  decoration: BoxDecoration(
                    color: active.isConnected ? AppColors.success.withAlpha(26) : AppColors.error.withAlpha(26),
                    borderRadius: BorderRadius.circular(RadiusConstants.full),
                    border: Border.all(color: active.isConnected ? AppColors.success.withAlpha(77) : AppColors.error.withAlpha(77)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: active.isConnected ? AppColors.success : AppColors.error,
                        ),
                      ),
                      const SizedBox(width: Spacing.xs),
                      Text(
                        active.isConnected ? 'Connected' : 'Connection Failed',
                        style: AppTypography.caption.copyWith(
                          color: active.isConnected ? AppColors.success : AppColors.error,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: Spacing.md),
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withAlpha(26),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Center(
                  child: Text(
                    info.icon,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(width: Spacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTypography.heading2.copyWith(color: AppColors.textPrimary, fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      hasActive ? active.model : 'Configure an AI provider below',
                      style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (hasActive)
                const Icon(
                  Icons.bolt_rounded,
                  color: AppColors.secondary,
                  size: 26,
                ),
            ],
          ),
        ],
      ),
    );
  }

  // ─── Search & Filters ──────────────────────────────────────────────────

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceGlass,
        borderRadius: BorderRadius.circular(RadiusConstants.lg),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: TextField(
        style: AppTypography.body.copyWith(color: AppColors.textPrimary),
        onChanged: (v) => setState(() => _searchQuery = v),
        decoration: InputDecoration(
          hintText: 'Search by name, type, or model...',
          hintStyle: AppTypography.body.copyWith(color: AppColors.textTertiary),
          prefixIcon: const Icon(Icons.search_rounded, color: AppColors.textSecondary),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildFilterAndSortRow() {
    final filters = [
      {'label': 'All', 'value': 'all'},
      {'label': 'Connected', 'value': 'connected'},
      {'label': 'Disconnected', 'value': 'disconnected'},
      {'label': 'Active', 'value': 'active'},
    ];

    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: filters.map((f) {
                final isSelected = _filterType == f['value'];
                return Padding(
                  padding: const EdgeInsets.only(right: Spacing.sm),
                  child: ChoiceChip(
                    label: Text(f['label']!),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _filterType = f['value']!);
                      }
                    },
                    selectedColor: AppColors.primary,
                    backgroundColor: AppColors.surfaceElevated,
                    labelStyle: AppTypography.caption.copyWith(
                      color: isSelected ? Colors.white : AppColors.textSecondary,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(RadiusConstants.sm)),
                    side: BorderSide(color: isSelected ? Colors.transparent : AppColors.glassBorder),
                    showCheckmark: false,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(width: Spacing.sm),
        PopupMenuButton<String>(
          icon: const Icon(Icons.sort_rounded, color: AppColors.textSecondary),
          tooltip: 'Sort Providers',
          onSelected: (v) => setState(() => _sortBy = v),
          color: AppColors.surfaceElevated,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(RadiusConstants.md)),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'newest',
              child: Text('Newest First', style: AppTypography.body.copyWith(color: AppColors.textPrimary)),
            ),
            PopupMenuItem(
              value: 'oldest',
              child: Text('Oldest First', style: AppTypography.body.copyWith(color: AppColors.textPrimary)),
            ),
            PopupMenuItem(
              value: 'alphabetical',
              child: Text('Alphabetical', style: AppTypography.body.copyWith(color: AppColors.textPrimary)),
            ),
          ],
        ),
      ],
    );
  }

  // ─── Provider Card ─────────────────────────────────────────────────────

  Widget _buildProviderCard(AIProviderModel provider) {
    final info = AppConstants.providerTypes[provider.providerType] ?? AppConstants.providerTypes['custom']!;
    final isTesting = _testingIds.contains(provider.id);

    return GlassCard(
      borderRadius: 28,
      variant: provider.isEnabled ? GlassCardVariant.hero : GlassCardVariant.standard,
      glowColor: provider.isEnabled ? AppColors.primary : null,
      padding: const EdgeInsets.all(Spacing.md),
      onTap: () => _openEditPage(context, provider),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.surfaceGlass,
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Center(
                  child: Text(
                    info.icon,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(width: Spacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          provider.name,
                          style: AppTypography.heading3.copyWith(color: AppColors.textPrimary, fontSize: 15),
                        ),
                        if (provider.isEnabled) ...[
                          const SizedBox(width: Spacing.sm),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
                            decoration: BoxDecoration(
                              gradient: AppGradients.neonPurple,
                              borderRadius: BorderRadius.circular(RadiusConstants.xs),
                            ),
                            child: Text(
                              'Active',
                              style: AppTypography.caption.copyWith(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      provider.model,
                      style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textTertiary,
              ),
            ],
          ),
          const SizedBox(height: Spacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Connection Status Tag
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: provider.isConnected ? AppColors.success : AppColors.textDisabled,
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  Text(
                    provider.isConnected ? 'Connected' : 'Connection Failed',
                    style: AppTypography.caption.copyWith(
                      color: provider.isConnected ? AppColors.success : AppColors.textSecondary,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),

              // Action buttons (Test Connection, Duplicate, etc.)
              Row(
                children: [
                  // Test Connection button
                  SizedBox(
                    height: 28,
                    child: OutlinedButton(
                      onPressed: isTesting ? null : () => _runConnectionTest(provider),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
                        side: const BorderSide(color: AppColors.glassBorder),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(RadiusConstants.sm)),
                        backgroundColor: AppColors.surfaceGlass,
                      ),
                      child: isTesting
                          ? const SizedBox(
                              width: 12,
                              height: 12,
                              child: CircularProgressIndicator(strokeWidth: 1.5, color: AppColors.secondary),
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.flash_on_rounded, size: 12, color: AppColors.secondary),
                                const SizedBox(width: 4),
                                Text(
                                  'Test',
                                  style: AppTypography.caption.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  // Duplicate button
                  IconButton(
                    icon: const Icon(Icons.copy_rounded, size: 14, color: AppColors.textSecondary),
                    constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                    padding: EdgeInsets.zero,
                    tooltip: 'Duplicate Provider',
                    onPressed: () {
                      ref.read(aiProvidersProvider.notifier).duplicateProvider(provider);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${provider.name} duplicated successfully'),
                          backgroundColor: AppColors.primary,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─── Connection Testing ────────────────────────────────────────────────

  Future<void> _runConnectionTest(AIProviderModel provider) async {
    setState(() => _testingIds.add(provider.id));
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final success = await ref.read(aiProvidersProvider.notifier).testProvider(provider);

    setState(() => _testingIds.remove(provider.id));

    scaffoldMessenger.hideCurrentSnackBar();
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              success ? Icons.check_circle_rounded : Icons.error_rounded,
              color: Colors.white,
            ),
            const SizedBox(width: Spacing.sm),
            Expanded(
              child: Text(
                success
                    ? 'Connection to ${provider.name} successful! Models fetched.'
                    : 'Connection to ${provider.name} failed. Check your API key and URL.',
              ),
            ),
          ],
        ),
        backgroundColor: success ? AppColors.success : AppColors.error,
        action: success
            ? null
            : SnackBarAction(
                label: 'Retry',
                textColor: Colors.white,
                onPressed: () => _runConnectionTest(provider),
              ),
      ),
    );
  }

  // ─── Add Bottom Sheet ──────────────────────────────────────────────────

  void _showAddProviderSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _ProviderFormSheet(
        onSave: (provider) async {
          await ref.read(aiProvidersProvider.notifier).saveProvider(provider);
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${provider.name} added successfully'),
                backgroundColor: AppColors.success,
              ),
            );
          }
        },
      ),
    );
  }

  // ─── Navigation to Edit Page ──────────────────────────────────────────

  void _openEditPage(BuildContext context, AIProviderModel provider) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AIProviderEditScreen(provider: provider),
      ),
    );
  }

  // ─── Import / Export Config ────────────────────────────────────────────

  Future<void> _exportConfig(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      final jsonString = ref.read(aiProvidersProvider.notifier).exportToJson();

      // Write directly to local file system and copy to clipboard as backup
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/ai_providers_backup.json';
      final file = File(path);
      await file.writeAsString(jsonString);

      await Clipboard.setData(ClipboardData(text: jsonString));

      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text('Config exported and copied to clipboard! Saved to: ${file.path.split(Platform.pathSeparator).last}'),
          backgroundColor: AppColors.success,
        ),
      );
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Export failed: $e'), backgroundColor: AppColors.error),
      );
    }
  }

  Future<void> _importConfig(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      final XFile? file = await openFile(
        acceptedTypeGroups: const [
          XTypeGroup(label: 'JSON Files', extensions: ['json']),
        ],
      );

      if (file != null) {
        final jsonString = await file.readAsString();
        await ref.read(aiProvidersProvider.notifier).importFromJson(jsonString);
        scaffoldMessenger.showSnackBar(
          const SnackBar(content: Text('Config imported successfully!'), backgroundColor: AppColors.success),
        );
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Import failed: $e'), backgroundColor: AppColors.error),
      );
    }
  }
}

// ────────────────────────────────────────────────────────────────────────
// Add Provider Form Sheet
// ────────────────────────────────────────────────────────────────────────

class _ProviderFormSheet extends StatefulWidget {
  final Function(AIProviderModel) onSave;

  const _ProviderFormSheet({required this.onSave});

  @override
  State<_ProviderFormSheet> createState() => _ProviderFormSheetState();
}

class _ProviderFormSheetState extends State<_ProviderFormSheet> {
  final _formKey = GlobalKey<FormState>();

  String _providerType = 'openai';
  final _nameController = TextEditingController(text: 'OpenAI');
  final _apiKeyController = TextEditingController();
  final _modelController = TextEditingController(text: 'gpt-4.1-mini');
  final _baseUrlController = TextEditingController(text: 'https://api.openai.com/v1');
  double _temperature = 0.7;
  int _maxTokens = 2048;

  bool _obscureApiKey = true;

  @override
  void dispose() {
    _nameController.dispose();
    _apiKeyController.dispose();
    _modelController.dispose();
    _baseUrlController.dispose();
    super.dispose();
  }

  void _onProviderTypeChanged(String? type) {
    if (type == null) return;
    setState(() {
      _providerType = type;
      final defaults = AppConstants.providerTypes[type]!;
      _nameController.text = defaults.name;
      _modelController.text = defaults.defaultModel;
      _baseUrlController.text = defaults.defaultBaseUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.surfaceElevated,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          border: Border(top: BorderSide(color: AppColors.glassBorder)),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Spacing.xl),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.textTertiary.withAlpha(100),
                      borderRadius: BorderRadius.circular(RadiusConstants.full),
                    ),
                  ),
                ),
                const SizedBox(height: Spacing.lg),
                Text(
                  'Add Provider',
                  style: AppTypography.heading2.copyWith(color: AppColors.textPrimary),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Spacing.lg),

                // Provider Type Dropdown
                DropdownButtonFormField<String>(
                  initialValue: _providerType,
                  dropdownColor: AppColors.surfaceElevated,
                  decoration: _buildInputDecoration('Provider Type', Icons.layers_outlined),
                  style: AppTypography.body.copyWith(color: AppColors.textPrimary),
                  items: AppConstants.providerTypes.entries.map((e) {
                    return DropdownMenuItem(
                      value: e.key,
                      child: Text('${e.value.icon}  ${e.value.name}'),
                    );
                  }).toList(),
                  onChanged: _onProviderTypeChanged,
                ),
                const SizedBox(height: Spacing.md),

                // Provider Name
                TextFormField(
                  controller: _nameController,
                  style: AppTypography.body.copyWith(color: AppColors.textPrimary),
                  decoration: _buildInputDecoration('Provider Name', Icons.drive_file_rename_outline_rounded),
                  validator: (v) => v == null || v.trim().isEmpty ? 'Provider name is required' : null,
                ),
                const SizedBox(height: Spacing.md),

                // API Key
                TextFormField(
                  controller: _apiKeyController,
                  obscureText: _obscureApiKey,
                  style: AppTypography.body.copyWith(color: AppColors.textPrimary),
                  decoration: _buildInputDecoration('API Key', Icons.vpn_key_outlined).copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureApiKey ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                        color: AppColors.textSecondary,
                        size: 20,
                      ),
                      onPressed: () => setState(() => _obscureApiKey = !_obscureApiKey),
                    ),
                  ),
                  validator: (v) {
                    if (_providerType != 'ollama' && (v == null || v.trim().isEmpty)) {
                      return 'API Key is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: Spacing.md),

                // Model (Textfield since no models fetched yet for a new provider)
                TextFormField(
                  controller: _modelController,
                  style: AppTypography.body.copyWith(color: AppColors.textPrimary),
                  decoration: _buildInputDecoration('Model', Icons.psychology_outlined),
                  validator: (v) => v == null || v.trim().isEmpty ? 'Model name is required' : null,
                ),
                const SizedBox(height: Spacing.md),

                // Base URL
                TextFormField(
                  controller: _baseUrlController,
                  style: AppTypography.body.copyWith(color: AppColors.textPrimary),
                  decoration: _buildInputDecoration('Base URL', Icons.link_rounded),
                  validator: (v) {
                    if (_providerType == 'custom' && (v == null || v.trim().isEmpty)) {
                      return 'Base URL is required for custom providers';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: Spacing.lg),

                // Temperature Slider
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Temperature', style: AppTypography.body.copyWith(color: AppColors.textSecondary)),
                        Text(_temperature.toStringAsFixed(1), style: AppTypography.body.copyWith(color: AppColors.secondary, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Slider(
                      value: _temperature,
                      min: 0.0,
                      max: 2.0,
                      divisions: 20,
                      activeColor: AppColors.primary,
                      inactiveColor: AppColors.glassBorder,
                      onChanged: (v) => setState(() => _temperature = v),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.md),

                // Max Tokens
                TextFormField(
                  initialValue: _maxTokens.toString(),
                  style: AppTypography.body.copyWith(color: AppColors.textPrimary),
                  keyboardType: TextInputType.number,
                  decoration: _buildInputDecoration('Max Tokens', Icons.tag_rounded),
                  onChanged: (v) => _maxTokens = int.tryParse(v) ?? 2048,
                ),
                const SizedBox(height: Spacing.xl),

                // Save button
                GradientButton.primary(
                  label: 'Add Provider',
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    final model = AIProviderModel(
                      id: const Uuid().v4(),
                      name: _nameController.text.trim(),
                      providerType: _providerType,
                      apiKey: _apiKeyController.text.trim(),
                      model: _modelController.text.trim(),
                      baseUrl: _baseUrlController.text.trim(),
                      temperature: _temperature,
                      maxTokens: _maxTokens,
                      isEnabled: false,
                      isConnected: false,
                    );
                    widget.onSave(model);
                    if (mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                const SizedBox(height: Spacing.md),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: AppTypography.body.copyWith(color: AppColors.textSecondary),
      prefixIcon: Icon(icon, color: AppColors.textSecondary, size: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusConstants.md),
        borderSide: const BorderSide(color: AppColors.glassBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusConstants.md),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusConstants.md),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusConstants.md),
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
      filled: true,
      fillColor: AppColors.surfaceInput,
    );
  }
}

// ────────────────────────────────────────────────────────────────────────
// Edit Provider Screen
// ────────────────────────────────────────────────────────────────────────

class AIProviderEditScreen extends ConsumerStatefulWidget {
  final AIProviderModel provider;

  const AIProviderEditScreen({super.key, required this.provider});

  @override
  ConsumerState<AIProviderEditScreen> createState() => _AIProviderEditScreenState();
}

class _AIProviderEditScreenState extends ConsumerState<AIProviderEditScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _apiKeyController;
  late TextEditingController _modelController;
  late TextEditingController _baseUrlController;
  late double _temperature;
  late int _maxTokens;

  bool _obscureApiKey = true;
  bool _isTesting = false;
  bool _isFetchingModels = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.provider.name);
    _apiKeyController = TextEditingController(text: widget.provider.apiKey);
    _modelController = TextEditingController(text: widget.provider.model);
    _baseUrlController = TextEditingController(text: widget.provider.baseUrl);
    _temperature = widget.provider.temperature;
    _maxTokens = widget.provider.maxTokens;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _apiKeyController.dispose();
    _modelController.dispose();
    _baseUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Re-read current provider state (to access updated availableModels or connection status)
    final provider = ref.watch(aiProvidersProvider).firstWhere(
          (p) => p.id == widget.provider.id,
          orElse: () => widget.provider,
        );

    final showDropdown = provider.availableModels.isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text('Edit ${widget.provider.name}', style: AppTypography.heading3.copyWith(color: AppColors.textPrimary)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          // Background Glows
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withAlpha(20),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Spacing.xl),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Connection State Banner
                    _buildConnectionBanner(provider),
                    const SizedBox(height: Spacing.lg),

                    // Card Form Container
                    GlassCard(
                      borderRadius: 28,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Provider Type (Read-only badge)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Provider Type', style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary)),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withAlpha(26),
                                  borderRadius: BorderRadius.circular(RadiusConstants.sm),
                                  border: Border.all(color: AppColors.primary.withAlpha(77)),
                                ),
                                child: Text(
                                  provider.providerType.toUpperCase(),
                                  style: AppTypography.caption.copyWith(color: AppColors.textNeonPrimary, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const Divider(height: Spacing.xl),

                          // Name
                          TextFormField(
                            controller: _nameController,
                            style: AppTypography.body.copyWith(color: AppColors.textPrimary),
                            decoration: _buildInputDecoration('Provider Name', Icons.drive_file_rename_outline_rounded),
                            validator: (v) => v == null || v.trim().isEmpty ? 'Provider name is required' : null,
                          ),
                          const SizedBox(height: Spacing.md),

                          // API Key
                          TextFormField(
                            controller: _apiKeyController,
                            obscureText: _obscureApiKey,
                            style: AppTypography.body.copyWith(color: AppColors.textPrimary),
                            decoration: _buildInputDecoration('API Key', Icons.vpn_key_outlined).copyWith(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureApiKey ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                                  color: AppColors.textSecondary,
                                  size: 20,
                                ),
                                onPressed: () => setState(() => _obscureApiKey = !_obscureApiKey),
                              ),
                            ),
                            validator: (v) {
                              if (provider.providerType != 'ollama' && (v == null || v.trim().isEmpty)) {
                                return 'API Key is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: Spacing.md),

                          // Model (Dropdown or Input)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: showDropdown
                                    ? DropdownButtonFormField<String>(
                                        initialValue: provider.availableModels.contains(_modelController.text)
                                            ? _modelController.text
                                            : provider.availableModels.first,
                                        dropdownColor: AppColors.surfaceElevated,
                                        decoration: _buildInputDecoration('Model', Icons.psychology_outlined),
                                        style: AppTypography.body.copyWith(color: AppColors.textPrimary),
                                        items: provider.availableModels.map((m) {
                                          return DropdownMenuItem(value: m, child: Text(m));
                                        }).toList(),
                                        onChanged: (val) {
                                          if (val != null) {
                                            _modelController.text = val;
                                          }
                                        },
                                      )
                                    : TextFormField(
                                        controller: _modelController,
                                        style: AppTypography.body.copyWith(color: AppColors.textPrimary),
                                        decoration: _buildInputDecoration('Model', Icons.psychology_outlined),
                                        validator: (v) => v == null || v.trim().isEmpty ? 'Model name is required' : null,
                                      ),
                              ),
                              if (provider.providerType != 'custom') ...[
                                const SizedBox(width: Spacing.sm),
                                SizedBox(
                                  height: 52,
                                  child: OutlinedButton(
                                    onPressed: _isFetchingModels ? null : () => _fetchAvailableModels(provider),
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(color: AppColors.glassBorder),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(RadiusConstants.md)),
                                      backgroundColor: AppColors.surfaceGlass,
                                    ),
                                    child: _isFetchingModels
                                        ? const SizedBox(
                                            width: 18,
                                            height: 18,
                                            child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.secondary),
                                          )
                                        : const Icon(Icons.refresh_rounded, color: AppColors.secondary, size: 22),
                                  ),
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: Spacing.md),

                          // Base URL
                          TextFormField(
                            controller: _baseUrlController,
                            style: AppTypography.body.copyWith(color: AppColors.textPrimary),
                            decoration: _buildInputDecoration('Base URL', Icons.link_rounded),
                            validator: (v) {
                              if (provider.providerType == 'custom' && (v == null || v.trim().isEmpty)) {
                                return 'Base URL is required for custom providers';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: Spacing.lg),

                          // Temperature Slider
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Temperature', style: AppTypography.body.copyWith(color: AppColors.textSecondary)),
                                  Text(_temperature.toStringAsFixed(1), style: AppTypography.body.copyWith(color: AppColors.secondary, fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Slider(
                                value: _temperature,
                                min: 0.0,
                                max: 2.0,
                                divisions: 20,
                                activeColor: AppColors.primary,
                                inactiveColor: AppColors.glassBorder,
                                onChanged: (v) => setState(() => _temperature = v),
                              ),
                            ],
                          ),
                          const SizedBox(height: Spacing.md),

                          // Max Tokens
                          TextFormField(
                            initialValue: _maxTokens.toString(),
                            style: AppTypography.body.copyWith(color: AppColors.textPrimary),
                            keyboardType: TextInputType.number,
                            decoration: _buildInputDecoration('Max Tokens', Icons.tag_rounded),
                            onChanged: (v) => _maxTokens = int.tryParse(v) ?? 2048,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Spacing.lg),

                    // Actions
                    GradientButton.primary(
                      label: 'Save Changes',
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;
                        final updated = provider.copyWith(
                          name: _nameController.text.trim(),
                          apiKey: _apiKeyController.text.trim(),
                          model: _modelController.text.trim(),
                          baseUrl: _baseUrlController.text.trim(),
                          temperature: _temperature,
                          maxTokens: _maxTokens,
                        );
                        ref.read(aiProvidersProvider.notifier).saveProvider(updated);
                        if (mounted) {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${updated.name} updated successfully'), backgroundColor: AppColors.success),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: Spacing.md),

                    // Secondary Actions Box
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _isTesting ? null : () => _runConnectionTest(provider),
                            icon: _isTesting
                                ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 1.5, color: Colors.white))
                                : const Icon(Icons.flash_on_rounded, size: 16, color: AppColors.secondary),
                            label: Text(_isTesting ? 'Testing' : 'Test', style: AppTypography.button.copyWith(color: AppColors.textPrimary)),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: AppColors.glassBorder),
                              backgroundColor: AppColors.surfaceGlass,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(RadiusConstants.sm)),
                            ),
                          ),
                        ),
                        const SizedBox(width: Spacing.md),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              ref.read(aiProvidersProvider.notifier).duplicateProvider(provider);
                              if (mounted) {
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('${provider.name} duplicated'), backgroundColor: AppColors.primary),
                                );
                              }
                            },
                            icon: const Icon(Icons.copy_rounded, size: 16, color: AppColors.accent),
                            label: Text('Duplicate', style: AppTypography.button.copyWith(color: AppColors.textPrimary)),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: AppColors.glassBorder),
                              backgroundColor: AppColors.surfaceGlass,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(RadiusConstants.sm)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Spacing.md),

                    if (!provider.isEnabled)
                      GradientButton.secondary(
                        label: 'Activate Provider',
                        onPressed: () {
                          ref.read(aiProvidersProvider.notifier).toggleProvider(provider.id);
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${provider.name} activated'), backgroundColor: AppColors.success),
                            );
                          }
                        },
                      ),
                    const SizedBox(height: Spacing.lg),

                    const Divider(),
                    const SizedBox(height: Spacing.md),

                    // Delete Button
                    OutlinedButton.icon(
                      onPressed: () => _confirmDelete(context, provider),
                      icon: const Icon(Icons.delete_rounded, size: 18, color: AppColors.error),
                      label: Text('Delete Provider', style: AppTypography.button.copyWith(color: AppColors.error)),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.error),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(RadiusConstants.sm)),
                      ),
                    ),
                    const SizedBox(height: Spacing.xxl),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectionBanner(AIProviderModel provider) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: provider.isConnected ? AppColors.success.withAlpha(20) : AppColors.error.withAlpha(20),
        borderRadius: BorderRadius.circular(RadiusConstants.md),
        border: Border.all(color: provider.isConnected ? AppColors.success.withAlpha(77) : AppColors.error.withAlpha(77)),
      ),
      child: Row(
        children: [
          Icon(
            provider.isConnected ? Icons.check_circle_outline_rounded : Icons.error_outline_rounded,
            color: provider.isConnected ? AppColors.success : AppColors.error,
          ),
          const SizedBox(width: Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  provider.isConnected ? 'Connection Status: Connected' : 'Connection Status: Failed',
                  style: AppTypography.body.copyWith(
                    color: provider.isConnected ? AppColors.success : AppColors.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  provider.isConnected
                      ? 'Connection is operational. Available models loaded.'
                      : 'Please check your API key, Base URL or internet connection.',
                  style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: AppTypography.body.copyWith(color: AppColors.textSecondary),
      prefixIcon: Icon(icon, color: AppColors.textSecondary, size: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusConstants.md),
        borderSide: const BorderSide(color: AppColors.glassBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusConstants.md),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusConstants.md),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusConstants.md),
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
      filled: true,
      fillColor: AppColors.surfaceInput,
    );
  }

  Future<void> _runConnectionTest(AIProviderModel provider) async {
    setState(() => _isTesting = true);
    final success = await ref.read(aiProvidersProvider.notifier).testProvider(provider);
    if (mounted) setState(() => _isTesting = false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            success ? 'Connection Test Succeeded!' : 'Connection Test Failed.',
          ),
          backgroundColor: success ? AppColors.success : AppColors.error,
        ),
      );
    }
  }

  Future<void> _fetchAvailableModels(AIProviderModel provider) async {
    setState(() => _isFetchingModels = true);
    try {
      final models = await ref.read(aiProvidersProvider.notifier).fetchModelsForProvider(provider.id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Successfully loaded ${models.length} models!'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to fetch models: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isFetchingModels = false);
    }
  }

  void _confirmDelete(BuildContext context, AIProviderModel provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surfaceElevated,
        title: Text('Delete Provider?', style: AppTypography.heading3.copyWith(color: AppColors.textPrimary)),
        content: Text(
          'Are you sure you want to delete ${provider.name}? This action cannot be undone.',
          style: AppTypography.body.copyWith(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel', style: AppTypography.button.copyWith(color: AppColors.textSecondary)),
          ),
          FilledButton(
            onPressed: () {
              ref.read(aiProvidersProvider.notifier).deleteProvider(provider.id);
              Navigator.of(context).pop(); // close dialog
              Navigator.of(context).pop(); // close edit screen
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${provider.name} deleted'), backgroundColor: AppColors.error),
              );
            },
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            child: Text('Delete', style: AppTypography.button.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

typedef AiProvidersScreen = AIProvidersScreen;

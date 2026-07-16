/// Debug Screen — reads and displays ALL data from every database table.
///
/// Intended for development use only. Shows raw tables, row counts,
/// and column values in an expandable, scrollable view.
library;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/ui_constants.dart';
import '../../../../database/app_database.dart';
import '../../../../providers/database_providers.dart';

// ── Types ──

class _TableData {
  final String name;
  final List<Map<String, dynamic>> rows;

  const _TableData({required this.name, required this.rows});
  int get count => rows.length;
}

// ── Data Collection ──

Future<List<_TableData>> _collectAllData(AppDatabase db) async {
  final results = <_TableData>[];

  // Each call uses db.select(table).get() and then toJson() on each row.
  // Using a helper to keep it DRY.

  Future<void> collect(String tableName, Future<List> Function() query) async {
    try {
      final rows = await query();
      results.add(_TableData(
        name: tableName,
        rows: rows.map((r) => r.toJson() as Map<String, dynamic>).toList(),
      ));
    } catch (e) {
      results.add(_TableData(name: '$tableName (error)', rows: []));
    }
  }

  await collect('humans', () => db.select(db.humansTable).get());
  await collect('family_members', () => db.select(db.familyMembersTable).get());
  await collect('education', () => db.select(db.educationTable).get());
  await collect('career_history', () => db.select(db.careerHistoryTable).get());
  await collect('skills', () => db.select(db.skillsTable).get());
  await collect('languages', () => db.select(db.languagesTable).get());
  await collect('interests', () => db.select(db.interestsTable).get());
  await collect('goals', () => db.select(db.goalsTable).get());
  await collect('personality_traits', () => db.select(db.personalityTraitsTable).get());
  await collect('conversation_styles', () => db.select(db.conversationStylesTable).get());
  await collect('daily_habits', () => db.select(db.dailyHabitsTable).get());
  await collect('values_beliefs', () => db.select(db.valuesBeliefsTable).get());
  await collect('decision_profiles', () => db.select(db.decisionProfilesTable).get());
  await collect('life_stories', () => db.select(db.lifeStoriesTable).get());
  await collect('timeline', () => db.select(db.timelineTable).get());
  await collect('daily_journals', () => db.select(db.dailyJournalsTable).get());
  await collect('memories', () => db.select(db.memoriesTable).get());
  await collect('memory_tags', () => db.select(db.memoryTagsTable).get());
  await collect('memory_links', () => db.select(db.memoryLinksTable).get());
  await collect('photos', () => db.select(db.photosTable).get());
  await collect('photo_albums', () => db.select(db.photoAlbumsTable).get());
  await collect('documents', () => db.select(db.documentsTable).get());
  await collect('audio_files', () => db.select(db.audioFilesTable).get());
  await collect('voice_settings', () => db.select(db.voiceSettingsTable).get());
  await collect('legacy_messages', () => db.select(db.legacyMessagesTable).get());
  await collect('chat_history', () => db.select(db.chatHistoryTable).get());
  await collect('life_places', () => db.select(db.lifePlacesTable).get());
  await collect('favorite_quotes', () => db.select(db.favoriteQuotesTable).get());
  await collect('favorite_words', () => db.select(db.favoriteWordsTable).get());
  await collect('favorites', () => db.select(db.favoritesTable).get());
  await collect('ai_providers', () => db.select(db.aiProvidersTable).get());
  await collect('ai_settings', () => db.select(db.aiSettingsTable).get());
  await collect('avatars', () => db.select(db.avatarsTable).get());

  // Sort: rows>0 first
  results.sort((a, b) {
    if (a.count == 0 && b.count > 0) return 1;
    if (b.count == 0 && a.count > 0) return -1;
    return a.name.compareTo(b.name);
  });

  return results;
}

String _buildJson(List<_TableData> tables) {
  final map = <String, dynamic>{};
  for (final t in tables) {
    map[t.name] = t.rows;
  }
  const encoder = JsonEncoder.withIndent('  ');
  return encoder.convert(map);
}

String _fmt(dynamic v) {
  if (v == null) return 'NULL';
  if (v is DateTime) return v.toIso8601String();
  if (v is double) return v.toStringAsFixed(4);
  if (v is bool) return v ? 'true' : 'false';
  if (v is List) return '[${v.length} items]';
  return '$v';
}

Color _colFor(String key) {
  if (key == 'id' || key.endsWith('Id')) return const Color(0xFF3B82F6);
  if (key.contains('At')) return const Color(0xFFEC4899);
  if (key.contains('Date')) return const Color(0xFF10B981);
  if (key == 'fullName') return const Color(0xFF7C3AED);
  return const Color(0xFF94A3B8);
}

bool _isKey(String key) =>
    key == 'id' || key.endsWith('Id') || key.contains('At') || key.contains('Date');

// ── Screen ──

class DebugScreen extends ConsumerStatefulWidget {
  const DebugScreen({super.key});

  @override
  ConsumerState<DebugScreen> createState() => _DebugScreenState();
}

class _DebugScreenState extends ConsumerState<DebugScreen> {
  List<_TableData>? _tables;
  bool _isLoading = true;
  String? _error;
  final Set<String> _expanded = {};
  String _filter = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final data = await _collectAllData(ref.read(appDatabaseProvider));
      if (mounted) setState(() { _tables = data; _isLoading = false; });
    } catch (e) {
      if (mounted) setState(() { _error = '$e'; _isLoading = false; });
    }
  }

  void _copyJson() {
    if (_tables == null) return;
    Clipboard.setData(ClipboardData(text: _buildJson(_tables!)));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to clipboard'), duration: Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03050A),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildFilter(),
            _buildSummary(),
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Spacing.lg, Spacing.sm, Spacing.lg, 0),
      child: Row(
        children: [
          // Back
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 40, height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle, color: const Color(0xFF0F172A),
                border: Border.all(color: const Color(0xFF1E293B)),
              ),
              child: const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 20),
            ),
          ),
          const SizedBox(width: Spacing.md),
          // Title
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('DB Debug', style: GoogleFonts.jetBrainsMono(color: const Color(0xFF06B6D4), fontSize: 18, fontWeight: FontWeight.w700)),
              if (_tables != null)
                Text('${_tables!.length} tables · ${_tables!.fold(0, (s, t) => s + t.count)} rows',
                    style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 11)),
            ],
          ),
          const Spacer(),
          // Copy
          GestureDetector(
            onTap: _copyJson,
            child: Container(
              width: 40, height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle, color: const Color(0xFF0F172A),
                border: Border.all(color: const Color(0xFF1E293B)),
              ),
              child: const Icon(Icons.copy_rounded, color: Color(0xFF06B6D4), size: 18),
            ),
          ),
          const SizedBox(width: Spacing.sm),
          // Refresh
          GestureDetector(
            onTap: _load,
            child: Container(
              width: 40, height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle, color: const Color(0xFF0F172A),
                border: Border.all(color: const Color(0xFF1E293B)),
              ),
              child: const Icon(Icons.refresh_rounded, color: Color(0xFF7C3AED), size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilter() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Spacing.lg, Spacing.sm, Spacing.lg, 0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF090D1A), borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF1E293B)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TextField(
          onChanged: (v) => setState(() => _filter = v.toLowerCase()),
          style: GoogleFonts.jetBrainsMono(color: Colors.white, fontSize: 12),
          decoration: InputDecoration(
            hintText: 'Filter tables...',
            hintStyle: GoogleFonts.jetBrainsMono(color: const Color(0xFF64748B), fontSize: 12),
            icon: const Icon(Icons.search_rounded, color: Color(0xFF64748B), size: 18),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildSummary() {
    if (_tables == null) return const SizedBox.shrink();
    final filled = _tables!.where((t) => t.count > 0).length;
    return Padding(
      padding: const EdgeInsets.fromLTRB(Spacing.lg, Spacing.sm, Spacing.lg, 0),
      child: Row(
        children: [
          _chip(Icons.table_chart_outlined, '$filled / ${_tables!.length} tables'),
          const SizedBox(width: 8),
          _chip(Icons.storage_rounded, '${_tables!.fold(0, (s, t) => s + t.count)} rows'),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                if (_expanded.length == _tables!.length) {
                  _expanded.clear();
                } else {
                  _expanded.addAll(_tables!.map((t) => t.name));
                }
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF090D1A), borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF1E293B)),
              ),
              child: Text(
                _expanded.length == _tables!.length ? 'Collapse All' : 'Expand All',
                style: GoogleFonts.inter(color: const Color(0xFF06B6D4), fontSize: 10, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A), borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFF7C3AED), size: 12),
          const SizedBox(width: 4),
          Text(text, style: GoogleFonts.jetBrainsMono(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 32, height: 32, child: CircularProgressIndicator(color: Color(0xFF7C3AED), strokeWidth: 2)),
            SizedBox(height: 12),
            Text('Scanning all tables...', style: TextStyle(color: Color(0xFF64748B), fontSize: 13)),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline_rounded, color: Color(0xFFEC4899), size: 48),
            const SizedBox(height: 12),
            Text(_error!, style: GoogleFonts.jetBrainsMono(color: const Color(0xFFEC4899), fontSize: 11), textAlign: TextAlign.center),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: _load,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF7C3AED), Color(0xFF06B6D4)]),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text('Retry', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
              ),
            ),
          ],
        ),
      );
    }

    final filtered = _tables!.where((t) => _filter.isEmpty || t.name.contains(_filter)).toList();
    if (filtered.isEmpty) {
      return Center(child: Text('No tables match "$_filter"', style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 13)));
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(Spacing.lg, Spacing.sm, Spacing.lg, 120),
      itemCount: filtered.length,
      itemBuilder: (_, i) => _buildCard(filtered[i]),
    );
  }

  Widget _buildCard(_TableData t) {
    final isOpen = _expanded.contains(t.name);
    final color = t.count > 0 ? const Color(0xFF06B6D4) : const Color(0xFF64748B);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () => setState(() => isOpen ? _expanded.remove(t.name) : _expanded.add(t.name)),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF090D1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: t.count > 0 ? const Color(0xFF1E293B) : const Color(0xFF1E293B).withAlpha(80)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 36, height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, color: color.withAlpha(20),
                        border: Border.all(color: color.withAlpha(60)),
                      ),
                      child: Icon(isOpen ? Icons.table_chart_rounded : Icons.table_chart_outlined, color: color, size: 16),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(t.name, style: GoogleFonts.jetBrainsMono(color: t.count > 0 ? Colors.white : const Color(0xFF64748B), fontSize: 13, fontWeight: FontWeight.w600)),
                          Text('${t.count} row${t.count == 1 ? '' : 's'}', style: GoogleFonts.inter(color: color, fontSize: 10, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(color: color.withAlpha(20), borderRadius: BorderRadius.circular(6)),
                      child: Text('${t.count}', style: GoogleFonts.jetBrainsMono(color: color, fontSize: 12, fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(width: 8),
                    Icon(isOpen ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded, color: const Color(0xFF64748B), size: 20),
                  ],
                ),
              ),

              // Expanded rows
              if (isOpen) ...[
                if (t.count == 0)
                  const Padding(
                    padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: Text('(empty table)', style: TextStyle(color: Color(0xFF475569), fontSize: 11, fontStyle: FontStyle.italic)),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: Column(
                      children: t.rows.asMap().entries.map((e) => _buildRow(e.value, e.key, t.name)).toList(),
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(Map<String, dynamic> row, int index, String tableName) {
    final id = row['id'];
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF070B14),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF1E293B).withAlpha(80)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (id != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text('Row #$id', style: GoogleFonts.jetBrainsMono(color: const Color(0xFF7C3AED), fontSize: 10, fontWeight: FontWeight.w700)),
            ),
          ...row.entries.map((e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 130,
                  child: Text(e.key, style: GoogleFonts.jetBrainsMono(
                    color: _isKey(e.key) ? const Color(0xFF3B82F6) : const Color(0xFF64748B),
                    fontSize: 10,
                    fontWeight: _isKey(e.key) ? FontWeight.w600 : FontWeight.w400,
                  )),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _fmt(e.value),
                    style: GoogleFonts.jetBrainsMono(
                      color: e.value == null ? const Color(0xFF475569) : _colFor(e.key),
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

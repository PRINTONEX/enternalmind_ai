/// Models for Import Replica Backup.
///
/// Handles JSON backup file parsing, schema validation, and summary stats.
/// All field names use **snake_case** to match the real backup format
/// exported by the EternalMind AI web platform.
library;

import 'dart:convert';

/// Represents a parsed JSON backup file with all stats and raw data arrays
/// needed for database import.
class BackupData {
  BackupData({
    required this.rawData,
    this.profile,
    this.familyList,
    this.educationList,
    this.careerList,
    this.storyList,
    this.familyCount = 0,
    this.educationCount = 0,
    this.careerCount = 0,
    this.storyCount = 0,
    this.timelineCount = 0,
    this.journalCount = 0,
    this.memoryCount = 0,
    this.photoCount = 0,
    this.albumCount = 0,
    this.documentCount = 0,
    this.voiceCount = 0,
    this.legacyCount = 0,
    this.skillCount = 0,
    this.interestCount = 0,
    this.goalCount = 0,
    this.languageCount = 0,
    this.lifePlaceCount = 0,
    this.favoriteCount = 0,
    this.aiProviderCount = 0,
    this.avatarCount = 0,
    this.storageSize = '<1 KB',
  });

  /// Complete raw JSON data (all top-level keys preserved).
  final Map<String, dynamic> rawData;

  /// Raw profile map from JSON (snake_case keys).
  final Map<String, dynamic>? profile;

  /// Raw family members list from JSON.
  final List<dynamic>? familyList;

  /// Raw education records list from JSON.
  final List<dynamic>? educationList;

  /// Raw career records list from JSON.
  final List<dynamic>? careerList;

  /// Raw stories list from JSON.
  final List<dynamic>? storyList;

  final int familyCount;
  final int educationCount;
  final int careerCount;
  final int storyCount;
  final int timelineCount;
  final int journalCount;
  final int memoryCount;
  final int photoCount;
  final int albumCount;
  final int documentCount;
  final int voiceCount;
  final int legacyCount;
  final int skillCount;
  final int interestCount;
  final int goalCount;
  final int languageCount;
  final int lifePlaceCount;
  final int favoriteCount;
  final int aiProviderCount;
  final int avatarCount;
  final String storageSize;

  /// Total count of all data items (for display).
  int get totalCount =>
      familyCount +
      educationCount +
      careerCount +
      storyCount +
      timelineCount +
      journalCount +
      memoryCount +
      photoCount +
      albumCount +
      documentCount +
      voiceCount +
      legacyCount +
      skillCount +
      interestCount +
      goalCount +
      languageCount +
      lifePlaceCount +
      favoriteCount +
      aiProviderCount +
      avatarCount;

  // ── Convenience getters (use snake_case keys matching the real JSON) ──

  /// Profile full name from `profile.full_name`.
  String get fullName => profile?['full_name'] as String? ?? 'Unknown';

  /// Profile ID from `profile.id`.
  String get profileId => profile?['id']?.toString() ?? '—';

  /// Birth place from `profile.place_of_birth`.
  String get birthPlace => profile?['place_of_birth'] as String? ?? '—';

  /// Current city from `profile.current_city`.
  String get currentCity => profile?['current_city'] as String? ?? '—';
}

/// Result of validating a JSON backup file.
class ValidationResult {
  ValidationResult({
    required this.isValid,
    this.errorMessage,
  });

  final bool isValid;
  final String? errorMessage;
}

/// Parses and validates a JSON backup string.
///
/// Expected top-level keys (all optional except `profile`):
/// - profile, family, education, career, stories, timeline, journals,
///   memories, memory_links, memory_tags, photos, photo_albums,
///   documents, voice, legacy_messages, ai_settings, skills, interests,
///   goals, languages, life_places, favorite_quotes, favorite_words,
///   favorites, avatars
class BackupJsonParser {
  /// Minimum required top-level keys.
  static const _requiredKeys = [
    'profile',
    'family',
    'education',
    'career',
    'stories',
  ];

  /// Validates the raw JSON string against the backup schema.
  static ValidationResult validate(String jsonString) {
    try {
      final decoded = json.decode(jsonString);
      if (decoded is! Map) {
        return ValidationResult(
          isValid: false,
          errorMessage: 'Invalid JSON format. Expected a JSON object.',
        );
      }

      final data = decoded as Map<String, dynamic>;

      // Check required top-level sections
      for (final key in _requiredKeys) {
        if (!data.containsKey(key)) {
          return ValidationResult(
            isValid: false,
            errorMessage: 'Missing required section: "$key".',
          );
        }
      }

      // Validate profile object
      if (data['profile'] is! Map) {
        return ValidationResult(
          isValid: false,
          errorMessage: 'Invalid "profile" section. Expected an object.',
        );
      }

      final profile = data['profile'] as Map<String, dynamic>;

      // The real JSON uses snake_case: "full_name"
      if (profile['full_name'] == null ||
          profile['full_name'].toString().trim().isEmpty) {
        return ValidationResult(
          isValid: false,
          errorMessage:
              'Missing "full_name" in profile section. The backup file may be from an older version.',
        );
      }

      return ValidationResult(isValid: true);
    } on FormatException {
      return ValidationResult(
        isValid: false,
        errorMessage: 'Invalid JSON syntax. Please check the file format.',
      );
    } catch (e) {
      return ValidationResult(
        isValid: false,
        errorMessage:
            'Unexpected error: ${e.toString().replaceFirst("Exception: ", "")}',
      );
    }
  }

  /// Parses a validated JSON string into [BackupData].
  ///
  /// Counts every supported section so the preview card shows accurate stats.
  /// `voice` is an object (not a list) — its `audio_files` and
  /// `voice_settings` arrays are counted separately.
  /// `ai_settings` is an object containing nested arrays.
  static BackupData parse(String jsonString) {
    final data = json.decode(jsonString) as Map<String, dynamic>;

    final profile = data['profile'] as Map<String, dynamic>;

    // ── Collect raw lists for database import ──
    final family = _safeList(data['family']);
    final education = _safeList(data['education']);
    final career = _safeList(data['career']);
    final stories = _safeList(data['stories']);

    // ── Count additional sections for preview ──
    final timeline = _safeList(data['timeline']);
    final journals = _safeList(data['journals']);
    final memories = _safeList(data['memories']);
    final photos = _safeList(data['photos']);
    final albums = _safeList(data['photo_albums']);
    final documents = _safeList(data['documents']);
    final legacy = _safeList(data['legacy_messages']);
    final skills = _safeList(data['skills']);
    final interests = _safeList(data['interests']);
    final goals = _safeList(data['goals']);
    final languages = _safeList(data['languages']);
    final lifePlaces = _safeList(data['life_places']);
    final favorites = _safeList(data['favorites']);
    final avatars = _safeList(data['avatars']);

    // Voice is an object, not a list
    final voiceObj = data['voice'];
    final voiceAudioFiles = voiceObj is Map
        ? _safeList((voiceObj as Map<String, dynamic>)['audio_files'])
        : <dynamic>[];
    final voiceSettings = voiceObj is Map
        ? _safeList((voiceObj as Map<String, dynamic>)['voice_settings'])
        : <dynamic>[];

    // ai_settings is an object with nested arrays
    final aiObj = data['ai_settings'];
    final aiProviders = aiObj is Map
        ? _safeList((aiObj as Map<String, dynamic>)['providers'])
        : <dynamic>[];

    // Calculate estimated storage size (rough: 2 bytes per char)
    final bytes = jsonString.length * 2;
    final kb = bytes ~/ 1024;
    final storageSize =
        kb < 1 ? '<1 KB' : kb < 1024 ? '$kb KB' : '${kb ~/ 1024} MB';

    return BackupData(
      rawData: data,
      profile: profile,
      familyList: family,
      educationList: education,
      careerList: career,
      storyList: stories,
      familyCount: family.length,
      educationCount: education.length,
      careerCount: career.length,
      storyCount: stories.length,
      timelineCount: timeline.length,
      journalCount: journals.length,
      memoryCount: memories.length,
      photoCount: photos.length,
      albumCount: albums.length,
      documentCount: documents.length,
      voiceCount: voiceAudioFiles.length + voiceSettings.length,
      legacyCount: legacy.length,
      skillCount: skills.length,
      interestCount: interests.length,
      goalCount: goals.length,
      languageCount: languages.length,
      lifePlaceCount: lifePlaces.length,
      favoriteCount: favorites.length,
      aiProviderCount: aiProviders.length,
      avatarCount: avatars.length,
      storageSize: storageSize,
    );
  }

  /// Safely casts a dynamic value to a list, returning an empty list if null
  /// or not a list.
  static List<dynamic> _safeList(dynamic value) {
    if (value is List) return value;
    return <dynamic>[];
  }
}

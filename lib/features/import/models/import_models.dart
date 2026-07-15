/// Models for Import Replica Backup.
///
/// Handles JSON backup file parsing, schema validation, and summary stats.
library;

import 'dart:convert';

/// Represents a parsed JSON backup file with all stats.
class BackupData {
  BackupData({
    this.profile,
    this.familyCount = 0,
    this.educationCount = 0,
    this.careerCount = 0,
    this.storyCount = 0,
    this.timelineCount = 0,
    this.journalCount = 0,
    this.memoryCount = 0,
    this.photoCount = 0,
    this.documentCount = 0,
    this.voiceCount = 0,
    this.legacyCount = 0,
    this.aiProviderCount = 0,
    this.storageSize = '<1 KB',
  });

  final Map<String, dynamic>? profile;
  final int familyCount;
  final int educationCount;
  final int careerCount;
  final int storyCount;
  final int timelineCount;
  final int journalCount;
  final int memoryCount;
  final int photoCount;
  final int documentCount;
  final int voiceCount;
  final int legacyCount;
  final int aiProviderCount;
  final String storageSize;

  int get totalCount =>
      familyCount +
      educationCount +
      careerCount +
      storyCount +
      timelineCount +
      journalCount +
      memoryCount +
      photoCount +
      documentCount +
      voiceCount +
      legacyCount +
      aiProviderCount;

  String get fullName => profile?['fullName'] as String? ?? 'Unknown';
  String get profileId => profile?['id']?.toString() ?? '—';
  String get birthPlace => profile?['birthPlace'] as String? ?? '—';
  String get currentCity => profile?['currentCity'] as String? ?? '—';
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
class BackupJsonParser {
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
      for (final key in _requiredKeys) {
        if (!data.containsKey(key)) {
          return ValidationResult(
            isValid: false,
            errorMessage: 'Missing required section: "$key".',
          );
        }
      }

      if (data['profile'] is! Map) {
        return ValidationResult(
          isValid: false,
          errorMessage: 'Invalid "profile" section. Expected an object.',
        );
      }

      final profile = data['profile'] as Map<String, dynamic>;
      if (profile['fullName'] == null ||
          profile['fullName'].toString().trim().isEmpty) {
        return ValidationResult(
          isValid: false,
          errorMessage: 'Missing "fullName" in profile section.',
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
        errorMessage: 'Unexpected error: ${e.toString().replaceFirst('Exception: ', '')}',
      );
    }
  }

  /// Parses a validated JSON string into [BackupData].
  static BackupData parse(String jsonString) {
    final data = json.decode(jsonString) as Map<String, dynamic>;

    final profile = data['profile'] as Map<String, dynamic>;
    final family = data['family'] as List<dynamic>? ?? [];
    final education = data['education'] as List<dynamic>? ?? [];
    final career = data['career'] as List<dynamic>? ?? [];
    final stories = data['stories'] as List<dynamic>? ?? [];
    final timeline = data['timeline'] as List<dynamic>? ?? [];
    final journals = data['journals'] as List<dynamic>? ?? [];
    final memories = data['memories'] as List<dynamic>? ?? [];
    final photos = data['photos'] as List<dynamic>? ?? [];
    final documents = data['documents'] as List<dynamic>? ?? [];
    final voice = data['voice'] as List<dynamic>? ?? [];
    final legacy = data['legacyMessages'] as List<dynamic>? ?? [];
    final aiProviders = data['aiProviders'] as List<dynamic>? ?? [];

    // Calculate estimated storage size
    final bytes = jsonString.length * 2;
    final kb = bytes ~/ 1024;
    final storageSize = kb < 1 ? '<1 KB' : kb < 1024 ? '$kb KB' : '${kb ~/ 1024} MB';

    return BackupData(
      profile: profile,
      familyCount: family.length,
      educationCount: education.length,
      careerCount: career.length,
      storyCount: stories.length,
      timelineCount: timeline.length,
      journalCount: journals.length,
      memoryCount: memories.length,
      photoCount: photos.length,
      documentCount: documents.length,
      voiceCount: voice.length,
      legacyCount: legacy.length,
      aiProviderCount: aiProviders.length,
      storageSize: storageSize,
    );
  }
}

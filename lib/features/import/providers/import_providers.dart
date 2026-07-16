/// Riverpod providers for the Import Replica Backup screen.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';

import '../../../database/app_database.dart';
import '../../../database/daos/human_dao.dart';
import '../../../database/daos/family_dao.dart';
import '../../../database/daos/education_dao.dart';
import '../../../database/daos/career_dao.dart';
import '../../../database/daos/content_dao.dart';
import '../../../database/daos/profile_extras_dao.dart';
import '../../../database/daos/personality_dao.dart';
import '../../../database/daos/ai_dao.dart';
import '../../../providers/database_providers.dart';
import '../../wizard/providers/wizard_providers.dart';
import '../models/import_models.dart';

enum ImportStep { selectFile, preview, importing }

class ImportState {
  ImportState({
    this.currentStep = ImportStep.selectFile,
    this.selectedFilePath,
    this.selectedFileName,
    this.backupData,
    this.validationError,
    this.isLoading = false,
    this.isImporting = false,
    this.importSuccess = false,
    this.importError,
  });

  final ImportStep currentStep;
  final String? selectedFilePath;
  final String? selectedFileName;
  final BackupData? backupData;
  final String? validationError;
  final bool isLoading;
  final bool isImporting;
  final bool importSuccess;
  final String? importError;

  ImportState copyWith({
    ImportStep? currentStep,
    String? selectedFilePath,
    String? selectedFileName,
    BackupData? backupData,
    String? validationError,
    bool? isLoading,
    bool? isImporting,
    bool? importSuccess,
    bool clearImportError = false,
    String? importError,
  }) {
    return ImportState(
      currentStep: currentStep ?? this.currentStep,
      selectedFilePath: selectedFilePath ?? this.selectedFilePath,
      selectedFileName: selectedFileName ?? this.selectedFileName,
      backupData: backupData ?? this.backupData,
      validationError: validationError ?? this.validationError,
      isLoading: isLoading ?? this.isLoading,
      isImporting: isImporting ?? this.isImporting,
      importSuccess: importSuccess ?? this.importSuccess,
      importError: clearImportError ? null : (importError ?? this.importError),
    );
  }
}

class ImportNotifier extends StateNotifier<ImportState> {
  ImportNotifier(this._ref) : super(ImportState());

  final Ref _ref;

  HumanDao get _humanDao => _ref.read(humanDaoProvider);
  FamilyDao get _familyDao => _ref.read(familyDaoProvider);
  EducationDao get _educationDao => _ref.read(educationDaoProvider);
  CareerDao get _careerDao => _ref.read(careerDaoProvider);
  LifeStoriesDao get _lifeStoriesDao => _ref.read(lifeStoriesDaoProvider);
  TimelineDao get _timelineDao => _ref.read(timelineDaoProvider);
  DailyJournalsDao get _dailyJournalsDao => _ref.read(dailyJournalsDaoProvider);
  MemoriesDao get _memoriesDao => _ref.read(memoriesDaoProvider);
  PhotosDao get _photosDao => _ref.read(photosDaoProvider);
  PhotoAlbumsDao get _photoAlbumsDao => _ref.read(photoAlbumsDaoProvider);
  DocumentsDao get _documentsDao => _ref.read(documentsDaoProvider);
  AudioFilesDao get _audioFilesDao => _ref.read(audioFilesDaoProvider);
  VoiceSettingsDao get _voiceSettingsDao => _ref.read(voiceSettingsDaoProvider);
  LegacyMessagesDao get _legacyMessagesDao => _ref.read(legacyMessagesDaoProvider);
  SkillsDao get _skillsDao => _ref.read(skillsDaoProvider);
  LanguagesDao get _languagesDao => _ref.read(languagesDaoProvider);
  InterestsDao get _interestsDao => _ref.read(interestsDaoProvider);
  GoalsDao get _goalsDao => _ref.read(goalsDaoProvider);
  LifePlacesDao get _lifePlacesDao => _ref.read(lifePlacesDaoProvider);
  FavoritesDao get _favoritesDao => _ref.read(favoritesDaoProvider);
  FavoriteWordsDao get _favoriteWordsDao => _ref.read(favoriteWordsDaoProvider);
  FavoriteQuotesDao get _favoriteQuotesDao => _ref.read(favoriteQuotesDaoProvider);
  PersonalityTraitsDao get _personalityTraitsDao => _ref.read(personalityTraitsDaoProvider);
  ConversationStylesDao get _conversationStylesDao => _ref.read(conversationStylesDaoProvider);
  DailyHabitsDao get _dailyHabitsDao => _ref.read(dailyHabitsDaoProvider);
  ValuesBeliefsDao get _valuesBeliefsDao => _ref.read(valuesBeliefsDaoProvider);
  DecisionProfilesDao get _decisionProfilesDao => _ref.read(decisionProfilesDaoProvider);
  AiProvidersDao get _aiProvidersDao => _ref.read(aiProvidersDaoProvider);
  AvatarsDao get _avatarsDao => _ref.read(avatarsDaoProvider);

  /// Shortcut to access raw JSON data map from backupData.
  Map<String, dynamic> get _raw => state.backupData!.rawData;

  void setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  Future<void> selectFile(String filePath, String fileName, String contents) async {
    state = state.copyWith(
      isLoading: true,
      selectedFilePath: filePath,
      selectedFileName: fileName,
      validationError: null,
      backupData: null,
    );

    final result = BackupJsonParser.validate(contents);
    if (!result.isValid) {
      state = state.copyWith(isLoading: false, validationError: result.errorMessage);
      return;
    }

    try {
      final data = BackupJsonParser.parse(contents);
      state = state.copyWith(
        isLoading: false,
        backupData: data,
        currentStep: ImportStep.preview,
        validationError: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        validationError: 'Failed to parse backup data: ${e.toString().replaceFirst("Exception: ", "")}',
      );
    }
  }

  void clearFile() => state = ImportState();
  void dismissError() => state = state.copyWith(validationError: null);

  Future<void> startImport() async {
    final backupData = state.backupData;
    if (backupData == null) return;

    state = state.copyWith(currentStep: ImportStep.importing, isImporting: true, importError: null);

    try {
      final profile = backupData.profile;
      if (profile == null) throw Exception('Profile data is missing.');
      final now = DateTime.now();

      // ── 1. Insert profile ──
      final profileCompanion = HumansTableCompanion.insert(
        fullName: _grab(profile['full_name'], 'Imported'),
        photoPath: Value(_grab(profile['photo_path'])),
        nickname: Value(_grab(profile['nickname'])),
        birthDate: Value(_parseDate(profile['birth_date'])),
        birthPlace: Value(_grab(profile['place_of_birth'])),
        currentCity: Value(_grab(profile['current_city'])),
        nationality: Value(_grab(profile['nationality'])),
        religion: Value(_grab(profile['religion'])),
        gender: Value(_grab(profile['gender'])),
        maritalStatus: Value(_grab(profile['marital_status'])),
        occupation: Value(_grab(profile['occupation'])),
        about: Value(_grab(profile['about'])),
        favoriteQuotes: Value(_grab(profile['favorite_quotes'])),
        lifePhilosophy: Value(_grab(profile['life_philosophy'])),
        hobbies: Value(_grab(profile['hobbies'])),
        languages: Value(_grab(profile['language'])),
        createdAt: _parseDateTime(profile['created_at']) ?? now,
        updatedAt: _parseDateTime(profile['updated_at']) ?? now,
      );
      final humanId = await _humanDao.insertHuman(profileCompanion);

      // ── 2. Family members ──
      for (final m in _safeListList(_raw['family'])) {
        await _familyDao.insertFamilyMember(FamilyMembersTableCompanion.insert(
          humanId: humanId,
          name: _grab(m['name'], 'Family'),
          relationship: Value(_grab(m['relationship'])),
          birthYear: Value(_parseInt(m['birth_year'])),
          description: Value(_grab(m['description'])),
          photoPath: Value(_grab(m['photo_path'])),
          closeness: Value(_parseInt(m['closeness'])),
          createdAt: _parseDateTime(m['created_at']) ?? now,
          updatedAt: now,
        ));
      }

      // ── 3. Education ──
      for (final e in _safeListList(_raw['education'])) {
        await _educationDao.insertEducation(EducationTableCompanion.insert(
          humanId: humanId,
          type: Value(_grab(e['type'])),
          course: Value(_grab(e['course'])),
          degree: Value(_grab(e['degree'])),
          school: Value(_grab(e['school'])),
          startYear: Value(_parseInt(e['start_year'])),
          endYear: Value(_parseInt(e['end_year'])),
          achievements: Value(_grab(e['achievements'])),
          createdAt: _parseDateTime(e['created_at']) ?? now,
          updatedAt: now,
        ));
      }

      // ── 4. Career ──
      for (final j in _safeListList(_raw['career'])) {
        await _careerDao.insertCareer(CareerHistoryTableCompanion.insert(
          humanId: humanId,
          company: Value(_grab(j['company'])),
          position: Value(_grab(j['position'])),
          startDate: Value(_grab(j['start_date'])),
          endDate: Value(_grab(j['end_date'])),
          location: Value(_grab(j['location'])),
          responsibilities: Value(_grab(j['responsibilities'])),
          achievements: Value(_grab(j['achievements'])),
          createdAt: _parseDateTime(j['created_at']) ?? now,
          updatedAt: now,
        ));
      }

      // ── 5. Life Stories ──
      for (final s in _safeListList(_raw['stories'])) {
        await _lifeStoriesDao.insert(LifeStoriesTableCompanion.insert(
          humanId: humanId,
          sectionKey: Value(_grab(s['section_key'])),
          title: Value(_grab(s['title'])),
          content: Value(_grab(s['content'])),
          tags: Value(_grab(s['tags'])),
          emotion: Value(_grab(s['emotion'])),
          importance: Value(_parseInt(s['importance'])),
          createdAt: _parseDateTime(s['created_at']) ?? now,
        ));
      }

      // ── 6. Timeline ──
      for (final t in _safeListList(_raw['timeline'])) {
        await _timelineDao.insert(TimelineTableCompanion.insert(
          humanId: humanId,
          title: Value(_grab(t['title'])),
          description: Value(_grab(t['description'])),
          date: Value(_grab(t['date'])),
          year: Value(_parseInt(t['year'])),
          location: Value(_grab(t['location'])),
          emotion: Value(_grab(t['emotion'])),
          importance: Value(_grab(t['importance'])),
          createdAt: _parseDateTime(t['created_at']) ?? now,
        ));
      }

      // ── 7. Daily Journals ──
      for (final j in _safeListList(_raw['journals'])) {
        await _dailyJournalsDao.insert(DailyJournalsTableCompanion.insert(
          humanId: humanId,
          date: Value(_grab(j['date'])),
          mood: Value(_grab(j['mood'])),
          weather: Value(_grab(j['weather'])),
          location: Value(_grab(j['location'])),
          journalText: Value(_grab(j['journal_text'])),
          voicePath: Value(_grab(j['voice_path'])),
          tags: Value(_grab(j['tags'])),
          favoriteMoment: Value(_grab(j['favorite_moment'])),
          lessonsLearned: Value(_grab(j['lessons_learned'])),
          createdAt: _parseDateTime(j['created_at']) ?? now,
        ));
      }

      // ── 8. Memories ──
      for (final m in _safeListList(_raw['memories'])) {
        await _memoriesDao.insert(MemoriesTableCompanion.insert(
          humanId: humanId,
          title: _grab(m['title'], 'Memory'),
          description: Value(_grab(m['description'])),
          category: Value(_grab(m['category'])),
          date: Value(_grab(m['date'])),
          emotion: Value(_grab(m['emotion'])),
          location: Value(_grab(m['location'])),
          importance: Value(_parseInt(m['importance'])),
          privacy: Value(_grab(m['privacy'])),
          tags: Value(_grab(m['tags'])),
          createdAt: _parseDateTime(m['created_at']) ?? now,
        ));
      }

      // ── 9. Photos & Albums ──
      for (final a in _safeListList(_raw['photo_albums'])) {
        await _photoAlbumsDao.insert(PhotoAlbumsTableCompanion.insert(
          humanId: humanId,
          name: _grab(a['name'], 'Album'),
          createdAt: _parseDateTime(a['created_at']) ?? now,
        ));
      }
      for (final p in _safeListList(_raw['photos'])) {
        await _photosDao.insert(PhotosTableCompanion.insert(
          humanId: humanId,
          albumId: Value(_parseInt(p['album_id'])),
          filePath: _grab(p['file_path']),
          caption: Value(_grab(p['caption'])),
          createdAt: _parseDateTime(p['created_at']) ?? now,
        ));
      }

      // ── 10. Documents ──
      for (final d in _safeListList(_raw['documents'])) {
        await _documentsDao.insert(DocumentsTableCompanion.insert(
          humanId: humanId,
          title: _grab(d['title'], 'Document'),
          category: Value(_grab(d['category'])),
          description: Value(_grab(d['description'])),
          filePath: Value(_grab(d['file_path'])),
          tags: Value(_grab(d['tags'])),
          createdAt: _parseDateTime(d['created_at']) ?? now,
        ));
      }

      // ── 11. Skills ──
      for (final s in _safeListList(_raw['skills'])) {
        await _skillsDao.insert(SkillsTableCompanion.insert(
          humanId: humanId,
          name: _grab(s['name'], 'Skill'),
          createdAt: _parseDateTime(s['created_at']) ?? now,
        ));
      }

      // ── 12. Languages ──
      for (final l in _safeListList(_raw['languages'])) {
        await _languagesDao.insert(LanguagesTableCompanion.insert(
          humanId: humanId,
          language: _grab(l['language'], 'Language'),
          readingRating: Value(_parseInt(l['reading_rating'])),
          writingRating: Value(_parseInt(l['writing_rating'])),
          speakingRating: Value(_parseInt(l['speaking_rating'])),
          createdAt: _parseDateTime(l['created_at']) ?? now,
        ));
      }

      // ── 13. Interests ──
      for (final i in _safeListList(_raw['interests'])) {
        await _interestsDao.insert(InterestsTableCompanion.insert(
          humanId: humanId,
          name: _grab(i['name'], 'Interest'),
          createdAt: _parseDateTime(i['created_at']) ?? now,
        ));
      }

      // ── 14. Goals ──
      for (final g in _safeListList(_raw['goals'])) {
        await _goalsDao.insert(GoalsTableCompanion.insert(
          humanId: humanId,
          type: Value(_grab(g['type'])),
          description: Value(_grab(g['description'])),
          createdAt: _parseDateTime(g['created_at']) ?? now,
        ));
      }

      // ── 15. Life Places ──
      for (final lp in _safeListList(_raw['life_places'])) {
        await _lifePlacesDao.insert(LifePlacesTableCompanion.insert(
          humanId: humanId,
          type: Value(_grab(lp['type'])),
          placeName: Value(_grab(lp['place_name'])),
          latitude: Value(_grab(lp['latitude'])),
          longitude: Value(_grab(lp['longitude'])),
          description: Value(_grab(lp['description'])),
          createdAt: _parseDateTime(lp['created_at']) ?? now,
        ));
      }

      // ── 16. Favorites ──
      for (final f in _safeListList(_raw['favorites'])) {
        await _favoritesDao.insert(FavoritesTableCompanion.insert(
          humanId: humanId,
          type: _grab(f['type'], 'Favorite'),
          value: _grab(f['value']),
          createdAt: _parseDateTime(f['created_at']) ?? now,
        ));
      }

      // ── 17. Favorite Words ──
      for (final fw in _safeListList(_raw['favorite_words'])) {
        await _favoriteWordsDao.insert(FavoriteWordsTableCompanion.insert(
          humanId: humanId,
          word: _grab(fw['word']),
          createdAt: _parseDateTime(fw['created_at']) ?? now,
        ));
      }

      // ── 18. Favorite Quotes ──
      for (final fq in _safeListList(_raw['favorite_quotes'])) {
        await _favoriteQuotesDao.insert(FavoriteQuotesTableCompanion.insert(
          humanId: humanId,
          quote: _grab(fq['quote'], ''),
          createdAt: _parseDateTime(fq['created_at']) ?? now,
        ));
      }

      // ── 19. Memory Tags ──
      final memoriesList = _safeListList(_raw['memories']);
      final memoryTags = _safeListList(_raw['memory_tags']);
      if (memoryTags.isNotEmpty && memoriesList.isNotEmpty) {
        // Build a mapping of original memory index → inserted memory ID
        // by matching on memory title
        final insertedMemories = await _memoriesDao.getForHuman(humanId);
        for (final mt in memoryTags) {
          final tagMemoryTitle = _grab(mt['memory_title']);
          if (tagMemoryTitle.isEmpty) continue;
          final matchingMem = insertedMemories.where(
            (m) => m.title == tagMemoryTitle,
          );
          if (matchingMem.isNotEmpty) {
            await _db.into(_db.memoryTagsTable).insert(
              MemoryTagsTableCompanion.insert(
                memoryId: matchingMem.first.id,
                tag: _grab(mt['tag']),
              ),
            );
          }
        }
      }

      // ── 20. Legacy Messages ──
      for (final lm in _safeListList(_raw['legacy_messages'])) {
        await _legacyMessagesDao.insert(LegacyMessagesTableCompanion.insert(
          humanId: humanId,
          category: Value(_grab(lm['category'])),
          message: Value(_grab(lm['text_message'])),
          audioPath: Value(_grab(lm['audio_path'])),
          videoPath: Value(_grab(lm['video_path'])),
          createdAt: _parseDateTime(lm['created_at']) ?? now,
        ));
      }

      // ── 21. Voice Settings ──
      final voiceObj = _raw['voice'];
      if (voiceObj is Map) {
        final voiceMap = voiceObj;
        for (final vs in _safeListList(voiceMap['voice_settings'])) {
          await _voiceSettingsDao.insert(VoiceSettingsTableCompanion.insert(
            humanId: humanId,
            providerStt: Value(_grab(vs['provider_stt'])),
            providerTts: Value(_grab(vs['provider_tts'])),
            voiceModel: Value(_grab(vs['voice'])),
            accent: Value(_grab(vs['accent'])),
            pitch: Value(_grab(vs['pitch'])),
            speed: Value((vs['speed'] as num?)?.toDouble()),
            volume: Value((vs['volume'] as num?)?.toDouble()),
            emotion: Value(_grab(vs['emotion'])),
            pauseDuration: Value((vs['pause_duration'] as num?)?.toDouble()),
            speakingStyle: Value(_grab(vs['speaking_style'])),
            silenceTimeout: Value(_parseInt(vs['silence_timeout'])),
            noiseSuppression: Value(_parseInt(vs['noise_suppression'])),
            echoCancellation: Value(_parseInt(vs['echo_cancellation'])),
            autoGainControl: Value(_parseInt(vs['auto_gain_control'])),
            voiceSensitivity: Value((vs['voice_sensitivity'] as num?)?.toDouble()),
            updatedAt: _parseDateTime(vs['updated_at']) ?? now,
          ));
        }
        for (final af in _safeListList(voiceMap['audio_files'])) {
          await _audioFilesDao.insert(AudioFilesTableCompanion.insert(
            humanId: humanId,
            filePath: _grab(af['file_path']),
            transcript: Value(_grab(af['transcript'])),
            duration: Value((af['duration'] as num?)?.toDouble()),
            createdAt: _parseDateTime(af['created_at']) ?? now,
          ));
        }
      }

      // ── 22. AI Settings & Personality ──
      final aiObj = _raw['ai_settings'];
      Map<String, dynamic> aiMap = {};
      if (aiObj is Map) {
        aiMap = aiObj as Map<String, dynamic>;

        // AI providers
        var aiProvidersList = _safeListList(_raw['ai_providers']);
        if (aiProvidersList.isEmpty) aiProvidersList = _safeListList(aiMap['providers']);
        for (final p in aiProvidersList) {
          await _aiProvidersDao.insert(AiProvidersTableCompanion.insert(
            humanId: Value(humanId),
            name: _grab(p['name'], 'AI Provider'),
            providerType: Value(_grab(p['provider_type'])),
            apiKey: Value(_grab(p['api_key'])),
            baseUrl: Value(_grab(p['base_url'])),
            model: Value(_grab(p['model'])),
            temperature: Value(_grab(p['temperature'])),
            maxTokens: Value(_parseInt(p['max_tokens'])),
            timeout: Value(_parseInt(p['timeout'])),
            retryCount: Value(_parseInt(p['retry_count'])),
            priority: Value(_parseInt(p['priority'])),
            isBackup: Value(_parseInt(p['is_backup'])),
            status: Value(_grab(p['status'])),
            latency: Value(_parseInt(p['latency'])),
            totalRequests: Value(_parseInt(p['total_requests'])),
            totalTokens: Value(_parseInt(p['total_tokens'])),
            totalCost: Value(_grab(p['total_cost'])),
            failures: Value(_parseInt(p['failures'])),
            createdAt: _parseDateTime(p['created_at']) ?? now,
            updatedAt: _parseDateTime(p['updated_at']) ?? now,
          ));
        }
      }

      // ── 23. Personality (flat list from JSON root or nested) ──
      var ptList = _safeListList(_raw['personality_traits']);
      if (ptList.isEmpty) ptList = _safeListList(aiMap['personality_traits']);
      for (final pt in ptList) {
        await _personalityTraitsDao.insert(PersonalityTraitsTableCompanion.insert(
          humanId: humanId,
          kindness: Value(_parseInt(pt['kindness'])),
          patience: Value(_parseInt(pt['patience'])),
          leadership: Value(_parseInt(pt['leadership'])),
          confidence: Value(_parseInt(pt['confidence'])),
          humor: Value(_parseInt(pt['humor'])),
          creativity: Value(_parseInt(pt['creativity'])),
          optimism: Value(_parseInt(pt['optimism'])),
          discipline: Value(_parseInt(pt['discipline'])),
          curiosity: Value(_parseInt(pt['curiosity'])),
          emotional: Value(_parseInt(pt['emotional'])),
          speakingStyle: Value(_grab(pt['speaking_style'])),
          createdAt: _parseDateTime(pt['created_at']) ?? now,
        ));
      }

      // ── 24. Conversation Styles ──
      var csList = _safeListList(_raw['conversation_styles']);
      if (csList.isEmpty) csList = _safeListList(aiMap['conversation_styles']);
      for (final cs in csList) {
        await _conversationStylesDao.insert(ConversationStylesTableCompanion.insert(
          humanId: humanId,
          tone: Value(_grab(cs['tone'])),
          storyTeller: Value(_parseInt(cs['story_teller'])),
          teacherMode: Value(_parseInt(cs['teacher_mode'])),
          motivational: Value(_parseInt(cs['motivational'])),
          replyLength: Value(_grab(cs['reply_length'])),
          emojiUsage: Value(_grab(cs['emoji_usage'])),
          localLanguage: Value(_grab(cs['local_language'])),
          proverbs: Value(_grab(cs['proverbs'])),
          quotes: Value(_grab(cs['quotes'])),
          religiousExpressions: Value(_grab(cs['religious_expressions'])),
          favoriteGreetings: Value(_grab(cs['favorite_greetings'])),
          signatureClosing: Value(_grab(cs['signature_closing'])),
          createdAt: _parseDateTime(cs['created_at']) ?? now,
        ));
      }

      // ── 25. Decision Profiles ──
      var dpList = _safeListList(_raw['decision_profiles']);
      if (dpList.isEmpty) dpList = _safeListList(aiMap['decision_profiles']);
      for (final dp in dpList) {
        await _decisionProfilesDao.insert(DecisionProfilesTableCompanion.insert(
          humanId: humanId,
          logicLevel: Value(_parseInt(dp['logic_level'])),
          emotionLevel: Value(_parseInt(dp['emotion_level'])),
          faithLevel: Value(_parseInt(dp['faith_level'])),
          researchLevel: Value(_parseInt(dp['research_level'])),
          experienceLevel: Value(_parseInt(dp['experience_level'])),
          friendsInfluence: Value(_parseInt(dp['friends_influence'])),
          familyInfluence: Value(_parseInt(dp['family_influence'])),
          riskLevel: Value(_grab(dp['risk_level'])),
          financialStyle: Value(_grab(dp['financial_style'])),
          leadershipStyle: Value(_grab(dp['leadership_style'])),
          conflictHandling: Value(_grab(dp['conflict_handling'])),
          createdAt: _parseDateTime(dp['created_at']) ?? now,
        ));
      }

      // ── 26. Daily Habits ──
      var dhList = _safeListList(_raw['daily_habits']);
      if (dhList.isEmpty) dhList = _safeListList(aiMap['daily_habits']);
      for (final dh in dhList) {
        await _dailyHabitsDao.insert(DailyHabitsTableCompanion.insert(
          humanId: humanId,
          wakeTime: Value(_grab(dh['wake_time'])),
          sleepTime: Value(_grab(dh['sleep_time'])),
          prayer: Value(_grab(dh['prayer'])),
          exercise: Value(_grab(dh['exercise'])),
          reading: Value(_grab(dh['reading'])),
          coding: Value(_grab(dh['coding'])),
          teaCoffee: Value(_grab(dh['tea_coffee'])),
          smokingAlcohol: Value(_grab(dh['smoking_alcohol'])),
          meditationWalking: Value(_grab(dh['meditation_walking'])),
          customHabits: Value(_grab(dh['custom_habits'])),
          createdAt: _parseDateTime(dh['created_at']) ?? now,
        ));
      }

      // ── 27. Values & Beliefs ──
      var vbList = _safeListList(_raw['values_beliefs']);
      if (vbList.isEmpty) vbList = _safeListList(aiMap['values_beliefs']);
      for (final vb in vbList) {
        await _valuesBeliefsDao.insert(ValuesBeliefsTableCompanion.insert(
          humanId: humanId,
          religion: Value(_grab(vb['religion'])),
          coreValues: Value(_grab(vb['core_values'])),
          lifePrinciples: Value(_grab(vb['life_principles'])),
          ethics: Value(_grab(vb['ethics'])),
          thingsNeverDo: Value(_grab(vb['things_never_do'])),
          thingsAlwaysDo: Value(_grab(vb['things_always_do'])),
          politicalPreference: Value(_grab(vb['political_preference'])),
          createdAt: _parseDateTime(vb['created_at']) ?? now,
        ));
      }

      // ── 28. Avatars ──
      for (final av in _safeListList(_raw['avatars'])) {
        await _avatarsDao.insert(AvatarsTableCompanion.insert(
          humanId: humanId,
          filePath: Value(_grab(av['file_path'])),
          style: Value(_grab(av['style'])),
          expression: Value(_grab(av['expression'])),
          isDefault: Value(_parseInt(av['is_default'])),
          createdAt: _parseDateTime(av['created_at']) ?? now,
        ));
      }

      // ── Set active profile ──
      _ref.read(activeProfileIdProvider.notifier).state = humanId;

      state = state.copyWith(
        isImporting: false,
        importSuccess: true,
        currentStep: ImportStep.preview,
      );
    } catch (e) {
      state = state.copyWith(
        isImporting: false,
        importError: 'Import failed: ${e.toString().replaceFirst("Exception: ", "")}',
      );
    }
  }

  // ── Helpers ──

  /// Get database reference for direct table access.
  AppDatabase get _db => _ref.read(appDatabaseProvider);

  /// Safely cast a dynamic value to a list.
  static List<dynamic> _safeListList(dynamic value) {
    if (value is List) return value;
    return <dynamic>[];
  }

  static String _grab(dynamic value, [String fallback = '']) {
    if (value == null) return fallback;
    final s = value.toString().trim();
    return s.isEmpty ? fallback : s;
  }

  static int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    return int.tryParse(value.toString().trim());
  }

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    final s = value.toString().trim();
    return s.isEmpty ? null : DateTime.tryParse(s);
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    final s = value.toString().trim();
    if (s.isEmpty) return null;
    final normalized = s.replaceFirst(' ', 'T');
    return DateTime.tryParse(normalized) ?? DateTime.tryParse(s);
  }
}

final importProvider = StateNotifierProvider<ImportNotifier, ImportState>((ref) {
  return ImportNotifier(ref);
});

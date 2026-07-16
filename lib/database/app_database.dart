import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/humans_table.dart';
import 'tables/family_members_table.dart';
import 'tables/education_table.dart';
import 'tables/career_history_table.dart';
import 'tables/skills_table.dart';
import 'tables/languages_table.dart';
import 'tables/interests_table.dart';
import 'tables/goals_table.dart';
import 'tables/personality_traits_table.dart';
import 'tables/conversation_styles_table.dart';
import 'tables/daily_habits_table.dart';
import 'tables/values_beliefs_table.dart';
import 'tables/decision_profiles_table.dart';
import 'tables/life_stories_table.dart';
import 'tables/timeline_table.dart';
import 'tables/daily_journals_table.dart';
import 'tables/memories_table.dart';
import 'tables/memory_tags_table.dart';
import 'tables/memory_links_table.dart';
import 'tables/photos_table.dart';
import 'tables/photo_albums_table.dart';
import 'tables/documents_table.dart';
import 'tables/audio_files_table.dart';
import 'tables/voice_settings_table.dart';
import 'tables/legacy_messages_table.dart';
import 'tables/ai_providers_table.dart';
import 'tables/ai_settings_table.dart';
import 'tables/avatars_table.dart';
import 'tables/chat_history_table.dart';
import 'tables/life_places_table.dart';
import 'tables/favorite_quotes_table.dart';
import 'tables/favorite_words_table.dart';
import 'tables/favorites_table.dart';

part 'app_database.g.dart';

/// EternalMind AI Drift database definition.
///
/// Complete schema matching the master schema in SCHEMA.md.
/// Version 2 adds all secondary tables for stories, timeline,
/// journals, memories, photos, documents, voice, legacy, AI,
/// personality, skills, goals, favorites, avatars, and more.
@DriftDatabase(
  tables: [
    HumansTable,
    FamilyMembersTable,
    EducationTable,
    CareerHistoryTable,
    SkillsTable,
    LanguagesTable,
    InterestsTable,
    GoalsTable,
    PersonalityTraitsTable,
    ConversationStylesTable,
    DailyHabitsTable,
    ValuesBeliefsTable,
    DecisionProfilesTable,
    LifeStoriesTable,
    TimelineTable,
    DailyJournalsTable,
    MemoriesTable,
    MemoryTagsTable,
    MemoryLinksTable,
    PhotosTable,
    PhotoAlbumsTable,
    DocumentsTable,
    AudioFilesTable,
    VoiceSettingsTable,
    LegacyMessagesTable,
    AiProvidersTable,
    AiSettingsTable,
    AvatarsTable,
    ChatHistoryTable,
    LifePlacesTable,
    FavoriteQuotesTable,
    FavoriteWordsTable,
    FavoritesTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? _createExecutor());

  static QueryExecutor _createExecutor() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'enternalmind.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from == 1) {
            // v1 → v2: create all new tables for stories, timeline,
            // journals, memories, photos, documents, voice, legacy,
            // AI, personality, skills, goals, favorites, avatars, etc.
            await m.createTable(skillsTable);
            await m.createTable(languagesTable);
            await m.createTable(interestsTable);
            await m.createTable(goalsTable);
            await m.createTable(personalityTraitsTable);
            await m.createTable(conversationStylesTable);
            await m.createTable(dailyHabitsTable);
            await m.createTable(valuesBeliefsTable);
            await m.createTable(decisionProfilesTable);
            await m.createTable(lifeStoriesTable);
            await m.createTable(timelineTable);
            await m.createTable(dailyJournalsTable);
            await m.createTable(memoriesTable);
            await m.createTable(memoryTagsTable);
            await m.createTable(memoryLinksTable);
            await m.createTable(photosTable);
            await m.createTable(photoAlbumsTable);
            await m.createTable(documentsTable);
            await m.createTable(audioFilesTable);
            await m.createTable(voiceSettingsTable);
            await m.createTable(legacyMessagesTable);
            await m.createTable(aiProvidersTable);
            await m.createTable(aiSettingsTable);
            await m.createTable(avatarsTable);
            await m.createTable(chatHistoryTable);
            await m.createTable(lifePlacesTable);
            await m.createTable(favoriteQuotesTable);
            await m.createTable(favoriteWordsTable);
            await m.createTable(favoritesTable);
          }
        },
      );
}

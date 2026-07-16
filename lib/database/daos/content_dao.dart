import '../app_database.dart';

/// DAO for Life Stories section.
class LifeStoriesDao {
  LifeStoriesDao(this._db);
  final AppDatabase _db;

  Future<int> insert(LifeStoriesTableCompanion entry) =>
      _db.into(_db.lifeStoriesTable).insert(entry);

  Future<List<LifeStoriesTableData>> getForHuman(int humanId) =>
      (_db.select(_db.lifeStoriesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.lifeStoriesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();

  Stream<List<LifeStoriesTableData>> watch(int humanId) =>
      (_db.select(_db.lifeStoriesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch();

  Stream<int> watchCount(int humanId) =>
      watch(humanId).map((l) => l.length);
}

/// DAO for Timeline section.
class TimelineDao {
  TimelineDao(this._db);
  final AppDatabase _db;

  Future<int> insert(TimelineTableCompanion entry) =>
      _db.into(_db.timelineTable).insert(entry);

  Future<List<TimelineTableData>> getForHuman(int humanId) =>
      (_db.select(_db.timelineTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.timelineTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();

  Stream<List<TimelineTableData>> watch(int humanId) =>
      (_db.select(_db.timelineTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch();

  Stream<int> watchCount(int humanId) =>
      watch(humanId).map((l) => l.length);
}

/// DAO for Daily Journals section.
class DailyJournalsDao {
  DailyJournalsDao(this._db);
  final AppDatabase _db;

  Future<int> insert(DailyJournalsTableCompanion entry) =>
      _db.into(_db.dailyJournalsTable).insert(entry);

  Future<List<DailyJournalsTableData>> getForHuman(int humanId) =>
      (_db.select(_db.dailyJournalsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.dailyJournalsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();

  Stream<List<DailyJournalsTableData>> watch(int humanId) =>
      (_db.select(_db.dailyJournalsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch();

  Stream<int> watchCount(int humanId) =>
      watch(humanId).map((l) => l.length);
}

/// DAO for Memories section.
class MemoriesDao {
  MemoriesDao(this._db);
  final AppDatabase _db;

  Future<int> insert(MemoriesTableCompanion entry) =>
      _db.into(_db.memoriesTable).insert(entry);

  Future<List<MemoriesTableData>> getForHuman(int humanId) =>
      (_db.select(_db.memoriesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.memoriesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();

  Stream<List<MemoriesTableData>> watch(int humanId) =>
      (_db.select(_db.memoriesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch();

  Stream<int> watchCount(int humanId) =>
      watch(humanId).map((l) => l.length);
}

/// DAO for Photos section.
class PhotosDao {
  PhotosDao(this._db);
  final AppDatabase _db;

  Future<int> insert(PhotosTableCompanion entry) =>
      _db.into(_db.photosTable).insert(entry);

  Future<List<PhotosTableData>> getForHuman(int humanId) =>
      (_db.select(_db.photosTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Stream<List<PhotosTableData>> watch(int humanId) =>
      (_db.select(_db.photosTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch();

  Stream<int> watchCount(int humanId) =>
      watch(humanId).map((l) => l.length);
}

/// DAO for Photo Albums section.
class PhotoAlbumsDao {
  PhotoAlbumsDao(this._db);
  final AppDatabase _db;

  Future<int> insert(PhotoAlbumsTableCompanion entry) =>
      _db.into(_db.photoAlbumsTable).insert(entry);

  Future<List<PhotoAlbumsTableData>> getForHuman(int humanId) =>
      (_db.select(_db.photoAlbumsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Stream<int> watchCount(int humanId) =>
      (_db.select(_db.photoAlbumsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch()
          .map((l) => l.length);
}

/// DAO for Documents section.
class DocumentsDao {
  DocumentsDao(this._db);
  final AppDatabase _db;

  Future<int> insert(DocumentsTableCompanion entry) =>
      _db.into(_db.documentsTable).insert(entry);

  Future<List<DocumentsTableData>> getForHuman(int humanId) =>
      (_db.select(_db.documentsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.documentsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();

  Stream<int> watchCount(int humanId) =>
      (_db.select(_db.documentsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch()
          .map((l) => l.length);
}

/// DAO for Audio Files (voice vault) section.
class AudioFilesDao {
  AudioFilesDao(this._db);
  final AppDatabase _db;

  Future<int> insert(AudioFilesTableCompanion entry) =>
      _db.into(_db.audioFilesTable).insert(entry);

  Stream<int> watchCount(int humanId) =>
      (_db.select(_db.audioFilesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch()
          .map((l) => l.length);
}

/// DAO for Voice Settings section.
class VoiceSettingsDao {
  VoiceSettingsDao(this._db);
  final AppDatabase _db;

  Future<int> insert(VoiceSettingsTableCompanion entry) =>
      _db.into(_db.voiceSettingsTable).insert(entry);

  Future<List<VoiceSettingsTableData>> getForHuman(int humanId) =>
      (_db.select(_db.voiceSettingsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.voiceSettingsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();
}

/// DAO for Legacy Messages section.
class LegacyMessagesDao {
  LegacyMessagesDao(this._db);
  final AppDatabase _db;

  Future<int> insert(LegacyMessagesTableCompanion entry) =>
      _db.into(_db.legacyMessagesTable).insert(entry);

  Future<List<LegacyMessagesTableData>> getForHuman(int humanId) =>
      (_db.select(_db.legacyMessagesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.legacyMessagesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();

  Stream<int> watchCount(int humanId) =>
      (_db.select(_db.legacyMessagesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch()
          .map((l) => l.length);
}

/// DAO for Memory Tags section.
class MemoryTagsDao {
  MemoryTagsDao(this._db);
  final AppDatabase _db;

  Future<int> insert(MemoryTagsTableCompanion entry) =>
      _db.into(_db.memoryTagsTable).insert(entry);

  Future<List<MemoryTagsTableData>> getForHuman(int humanId) async {
    // Join through memories table
    final memories = await (_db.select(_db.memoriesTable)
          ..where((t) => t.humanId.equals(humanId)))
        .get();
    final memoryIds = memories.map((m) => m.id).toList();
    if (memoryIds.isEmpty) return [];
    return (_db.select(_db.memoryTagsTable)
          ..where((t) => t.memoryId.isIn(memoryIds)))
        .get();
  }

  Future<void> deleteAllForHuman(int humanId) async {
    final memories = await (_db.select(_db.memoriesTable)
          ..where((t) => t.humanId.equals(humanId)))
        .get();
    for (final m in memories) {
      (_db.delete(_db.memoryTagsTable)
            ..where((t) => t.memoryId.equals(m.id)))
          .go();
    }
  }

  Stream<int> watchCount(int humanId) =>
      (_db.select(_db.memoryTagsTable)).watch().map((l) => l.length);
}

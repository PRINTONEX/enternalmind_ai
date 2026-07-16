import '../app_database.dart';

/// DAO for AI Providers section.
class AiProvidersDao {
  AiProvidersDao(this._db);
  final AppDatabase _db;

  Future<int> insert(AiProvidersTableCompanion entry) =>
      _db.into(_db.aiProvidersTable).insert(entry);

  Future<List<AiProvidersTableData>> getForHuman(int humanId) =>
      (_db.select(_db.aiProvidersTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.aiProvidersTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();

  Stream<int> watchCount(int humanId) =>
      (_db.select(_db.aiProvidersTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch()
          .map((l) => l.length);
}

/// DAO for AI Settings section.
class AiSettingsDao {
  AiSettingsDao(this._db);
  final AppDatabase _db;

  Future<int> insert(AiSettingsTableCompanion entry) =>
      _db.into(_db.aiSettingsTable).insert(entry);

  Future<List<AiSettingsTableData>> getForHuman(int humanId) =>
      (_db.select(_db.aiSettingsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.aiSettingsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();
}

/// DAO for Avatars section.
class AvatarsDao {
  AvatarsDao(this._db);
  final AppDatabase _db;

  Future<int> insert(AvatarsTableCompanion entry) =>
      _db.into(_db.avatarsTable).insert(entry);

  Future<List<AvatarsTableData>> getForHuman(int humanId) =>
      (_db.select(_db.avatarsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.avatarsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();

  Stream<int> watchCount(int humanId) =>
      (_db.select(_db.avatarsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch()
          .map((l) => l.length);
}

/// DAO for Chat History section.
class ChatHistoryDao {
  ChatHistoryDao(this._db);
  final AppDatabase _db;

  Future<int> insert(ChatHistoryTableCompanion entry) =>
      _db.into(_db.chatHistoryTable).insert(entry);

  Future<List<ChatHistoryTableData>> getForHuman(int humanId) =>
      (_db.select(_db.chatHistoryTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.chatHistoryTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();
}

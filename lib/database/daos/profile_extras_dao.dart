import '../app_database.dart';

/// DAO for Skills section.
class SkillsDao {
  SkillsDao(this._db);
  final AppDatabase _db;

  Future<int> insert(SkillsTableCompanion entry) =>
      _db.into(_db.skillsTable).insert(entry);

  Future<List<SkillsTableData>> getForHuman(int humanId) =>
      (_db.select(_db.skillsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.skillsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();

  Stream<int> watchCount(int humanId) =>
      (_db.select(_db.skillsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch()
          .map((l) => l.length);
}

/// DAO for Languages section.
class LanguagesDao {
  LanguagesDao(this._db);
  final AppDatabase _db;

  Future<int> insert(LanguagesTableCompanion entry) =>
      _db.into(_db.languagesTable).insert(entry);

  Future<List<LanguagesTableData>> getForHuman(int humanId) =>
      (_db.select(_db.languagesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.languagesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();

  Stream<int> watchCount(int humanId) =>
      (_db.select(_db.languagesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch()
          .map((l) => l.length);
}

/// DAO for Interests section.
class InterestsDao {
  InterestsDao(this._db);
  final AppDatabase _db;

  Future<int> insert(InterestsTableCompanion entry) =>
      _db.into(_db.interestsTable).insert(entry);

  Future<List<InterestsTableData>> getForHuman(int humanId) =>
      (_db.select(_db.interestsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.interestsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();

  Stream<int> watchCount(int humanId) =>
      (_db.select(_db.interestsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch()
          .map((l) => l.length);
}

/// DAO for Goals section.
class GoalsDao {
  GoalsDao(this._db);
  final AppDatabase _db;

  Future<int> insert(GoalsTableCompanion entry) =>
      _db.into(_db.goalsTable).insert(entry);

  Future<List<GoalsTableData>> getForHuman(int humanId) =>
      (_db.select(_db.goalsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.goalsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();

  Stream<int> watchCount(int humanId) =>
      (_db.select(_db.goalsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch()
          .map((l) => l.length);
}

/// DAO for Life Places section.
class LifePlacesDao {
  LifePlacesDao(this._db);
  final AppDatabase _db;

  Future<int> insert(LifePlacesTableCompanion entry) =>
      _db.into(_db.lifePlacesTable).insert(entry);

  Future<List<LifePlacesTableData>> getForHuman(int humanId) =>
      (_db.select(_db.lifePlacesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.lifePlacesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();

  Stream<int> watchCount(int humanId) =>
      (_db.select(_db.lifePlacesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch()
          .map((l) => l.length);
}

/// DAO for Favorites section.
class FavoritesDao {
  FavoritesDao(this._db);
  final AppDatabase _db;

  Future<int> insert(FavoritesTableCompanion entry) =>
      _db.into(_db.favoritesTable).insert(entry);

  Future<List<FavoritesTableData>> getForHuman(int humanId) =>
      (_db.select(_db.favoritesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.favoritesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();

  Stream<int> watchCount(int humanId) =>
      (_db.select(_db.favoritesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch()
          .map((l) => l.length);
}

/// DAO for Favorite Quotes section.
class FavoriteQuotesDao {
  FavoriteQuotesDao(this._db);
  final AppDatabase _db;

  Future<int> insert(FavoriteQuotesTableCompanion entry) =>
      _db.into(_db.favoriteQuotesTable).insert(entry);

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.favoriteQuotesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();
}

/// DAO for Favorite Words section.
class FavoriteWordsDao {
  FavoriteWordsDao(this._db);
  final AppDatabase _db;

  Future<int> insert(FavoriteWordsTableCompanion entry) =>
      _db.into(_db.favoriteWordsTable).insert(entry);

  Future<List<FavoriteWordsTableData>> getForHuman(int humanId) =>
      (_db.select(_db.favoriteWordsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.favoriteWordsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();
}

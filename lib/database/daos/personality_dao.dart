import '../app_database.dart';

/// DAO for Personality Traits section.
class PersonalityTraitsDao {
  PersonalityTraitsDao(this._db);
  final AppDatabase _db;

  Future<int> insert(PersonalityTraitsTableCompanion entry) =>
      _db.into(_db.personalityTraitsTable).insert(entry);

  Future<PersonalityTraitsTableData?> getForHuman(int humanId) =>
      (_db.select(_db.personalityTraitsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .getSingleOrNull();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.personalityTraitsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();
}

/// DAO for Conversation Styles section.
class ConversationStylesDao {
  ConversationStylesDao(this._db);
  final AppDatabase _db;

  Future<int> insert(ConversationStylesTableCompanion entry) =>
      _db.into(_db.conversationStylesTable).insert(entry);

  Future<ConversationStylesTableData?> getForHuman(int humanId) =>
      (_db.select(_db.conversationStylesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .getSingleOrNull();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.conversationStylesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();
}

/// DAO for Daily Habits section.
class DailyHabitsDao {
  DailyHabitsDao(this._db);
  final AppDatabase _db;

  Future<int> insert(DailyHabitsTableCompanion entry) =>
      _db.into(_db.dailyHabitsTable).insert(entry);

  Future<DailyHabitsTableData?> getForHuman(int humanId) =>
      (_db.select(_db.dailyHabitsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .getSingleOrNull();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.dailyHabitsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();
}

/// DAO for Values & Beliefs section.
class ValuesBeliefsDao {
  ValuesBeliefsDao(this._db);
  final AppDatabase _db;

  Future<int> insert(ValuesBeliefsTableCompanion entry) =>
      _db.into(_db.valuesBeliefsTable).insert(entry);

  Future<ValuesBeliefsTableData?> getForHuman(int humanId) =>
      (_db.select(_db.valuesBeliefsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .getSingleOrNull();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.valuesBeliefsTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();
}

/// DAO for Decision Profiles section.
class DecisionProfilesDao {
  DecisionProfilesDao(this._db);
  final AppDatabase _db;

  Future<int> insert(DecisionProfilesTableCompanion entry) =>
      _db.into(_db.decisionProfilesTable).insert(entry);

  Future<DecisionProfilesTableData?> getForHuman(int humanId) =>
      (_db.select(_db.decisionProfilesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .getSingleOrNull();

  Future<void> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.decisionProfilesTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();
}

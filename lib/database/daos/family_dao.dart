import '../app_database.dart';

/// Data Access Object for the `family_members` table.
class FamilyDao {
  FamilyDao(this._db);

  final AppDatabase _db;

  /// Insert a family member. Returns the row ID.
  Future<int> insertFamilyMember(FamilyMembersTableCompanion entry) =>
      _db.into(_db.familyMembersTable).insert(entry);

  /// Get all family members for a human.
  Future<List<FamilyMembersTableData>> getFamilyMembers(int humanId) =>
      (_db.select(_db.familyMembersTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  /// Get a single family member by ID.
  Future<FamilyMembersTableData?> getFamilyMember(int id) =>
      (_db.select(_db.familyMembersTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  /// Update a family member. Returns number of rows updated.
  Future<int> updateFamilyMember(
          int id, FamilyMembersTableCompanion entry) =>
      (_db.update(_db.familyMembersTable)..where((t) => t.id.equals(id)))
          .write(entry);

  /// Delete a family member. Returns number of rows deleted.
  Future<int> deleteFamilyMember(int id) =>
      (_db.delete(_db.familyMembersTable)..where((t) => t.id.equals(id))).go();

  /// Delete all family members for a human. Returns number of rows deleted.
  Future<int> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.familyMembersTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();

  /// Watch family members for a human in realtime.
  Stream<List<FamilyMembersTableData>> watchFamilyMembers(int humanId) =>
      (_db.select(_db.familyMembersTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch();

  /// Watch the count of family members for a human in realtime.
  Stream<int> watchFamilyCount(int humanId) =>
      watchFamilyMembers(humanId).map((list) => list.length);
}

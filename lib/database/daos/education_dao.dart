import '../app_database.dart';

/// Data Access Object for the `education` table.
class EducationDao {
  EducationDao(this._db);

  final AppDatabase _db;

  /// Insert an education record. Returns the row ID.
  Future<int> insertEducation(EducationTableCompanion entry) =>
      _db.into(_db.educationTable).insert(entry);

  /// Get all education records for a human.
  Future<List<EducationTableData>> getEducation(int humanId) =>
      (_db.select(_db.educationTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  /// Get a single education record by ID.
  Future<EducationTableData?> getEducationById(int id) =>
      (_db.select(_db.educationTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  /// Update an education record. Returns number of rows updated.
  Future<int> updateEducation(int id, EducationTableCompanion entry) =>
      (_db.update(_db.educationTable)..where((t) => t.id.equals(id)))
          .write(entry);

  /// Delete an education record. Returns number of rows deleted.
  Future<int> deleteEducation(int id) =>
      (_db.delete(_db.educationTable)..where((t) => t.id.equals(id))).go();

  /// Delete all education records for a human. Returns number of rows deleted.
  Future<int> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.educationTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();
}

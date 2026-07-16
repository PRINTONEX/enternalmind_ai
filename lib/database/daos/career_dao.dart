import '../app_database.dart';

/// Data Access Object for the `career_history` table.
class CareerDao {
  CareerDao(this._db);

  final AppDatabase _db;

  /// Insert a career record. Returns the row ID.
  Future<int> insertCareer(CareerHistoryTableCompanion entry) =>
      _db.into(_db.careerHistoryTable).insert(entry);

  /// Get all career records for a human.
  Future<List<CareerHistoryTableData>> getCareer(int humanId) =>
      (_db.select(_db.careerHistoryTable)
            ..where((t) => t.humanId.equals(humanId)))
          .get();

  /// Get a single career record by ID.
  Future<CareerHistoryTableData?> getCareerById(int id) =>
      (_db.select(_db.careerHistoryTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  /// Update a career record. Returns number of rows updated.
  Future<int> updateCareer(int id, CareerHistoryTableCompanion entry) =>
      (_db.update(_db.careerHistoryTable)..where((t) => t.id.equals(id)))
          .write(entry);

  /// Delete a career record. Returns number of rows deleted.
  Future<int> deleteCareer(int id) =>
      (_db.delete(_db.careerHistoryTable)..where((t) => t.id.equals(id))).go();

  /// Delete all career records for a human. Returns number of rows deleted.
  Future<int> deleteAllForHuman(int humanId) =>
      (_db.delete(_db.careerHistoryTable)
            ..where((t) => t.humanId.equals(humanId)))
          .go();

  /// Watch career records for a human in realtime.
  Stream<List<CareerHistoryTableData>> watchCareer(int humanId) =>
      (_db.select(_db.careerHistoryTable)
            ..where((t) => t.humanId.equals(humanId)))
          .watch();

  /// Watch the count of career records for a human in realtime.
  Stream<int> watchCareerCount(int humanId) =>
      watchCareer(humanId).map((list) => list.length);
}

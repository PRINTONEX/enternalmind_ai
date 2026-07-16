import 'package:drift/drift.dart';

import '../app_database.dart';

/// Data Access Object for the `humans` table.
class HumanDao {
  HumanDao(this._db);

  final AppDatabase _db;

  /// Insert a new human profile. Returns the row ID.
  Future<int> insertHuman(HumansTableCompanion entry) =>
      _db.into(_db.humansTable).insert(entry);

  /// Get a human by ID.
  Future<HumansTableData?> getHuman(int id) =>
      (_db.select(_db.humansTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  /// Get all humans.
  Future<List<HumansTableData>> getAllHumans() =>
      _db.select(_db.humansTable).get();

  /// Update a human profile. Returns number of rows updated.
  Future<int> updateHuman(int id, HumansTableCompanion entry) =>
      (_db.update(_db.humansTable)..where((t) => t.id.equals(id)))
          .write(entry);

  /// Delete a human. Returns number of rows deleted.
  Future<int> deleteHuman(int id) =>
      (_db.delete(_db.humansTable)..where((t) => t.id.equals(id))).go();

  /// Get the last updated human (for resume).
  Future<HumansTableData?> getLastActive() async {
    final query = _db.select(_db.humansTable)
      ..orderBy([
        (t) => OrderingTerm(
              expression: t.updatedAt,
              mode: OrderingMode.desc,
            ),
      ])
      ..limit(1);
    return query.getSingleOrNull();
  }

  /// Watch the last active profile — emits a new value whenever
  /// the humans table changes.
  Stream<HumansTableData?> watchLastActive() {
    return (_db.select(_db.humansTable)
          ..orderBy([
            (t) => OrderingTerm(
                  expression: t.updatedAt,
                  mode: OrderingMode.desc,
                ),
          ])
          ..limit(1))
        .watch()
        .map((rows) => rows.isEmpty ? null : rows.first);
  }

  /// Watch a single human by ID.
  Stream<HumansTableData?> watchHuman(int id) {
    return (_db.select(_db.humansTable)..where((t) => t.id.equals(id)))
        .watch()
        .map((rows) => rows.isEmpty ? null : rows.first);
  }
}

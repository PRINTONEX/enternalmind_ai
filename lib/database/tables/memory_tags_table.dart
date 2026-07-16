import 'package:drift/drift.dart';

/// Drift table definition for the `memory_tags` table.
class MemoryTagsTable extends Table {
  @override
  String get tableName => 'memory_tags';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get memoryId => integer()
      .customConstraint('NOT NULL REFERENCES memories(id) ON DELETE CASCADE')();
  TextColumn get tag => text()();

  @override
  List<Set<Column>> get uniqueKeys => [];
}

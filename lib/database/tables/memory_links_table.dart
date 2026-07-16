import 'package:drift/drift.dart';

/// Drift table definition for the `memory_links` table.
class MemoryLinksTable extends Table {
  @override
  String get tableName => 'memory_links';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get memoryId => integer()
      .customConstraint('NOT NULL REFERENCES memories(id) ON DELETE CASCADE')();
  TextColumn get entityType => text().nullable()();
  IntColumn get entityId => integer().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [];
}

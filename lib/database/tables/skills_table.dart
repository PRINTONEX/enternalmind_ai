import 'package:drift/drift.dart';

/// Drift table definition for the `skills` table.
class SkillsTable extends Table {
  @override
  String get tableName => 'skills';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [];
}

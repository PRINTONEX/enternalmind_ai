import 'package:drift/drift.dart';

/// Drift table definition for the `education` table.
///
/// Matches the Education schema in SCHEMA.md exactly.
/// Cascading deletes when the parent human is removed.
class EducationTable extends Table {
  @override
  String get tableName => 'education';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get type => text().nullable()();
  TextColumn get course => text().nullable()();
  TextColumn get degree => text().nullable()();
  TextColumn get school => text().nullable()();
  IntColumn get startYear => integer().nullable()();
  IntColumn get endYear => integer().nullable()();
  TextColumn get achievements => text().nullable()();
  TextColumn get certificatePath => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [];
}

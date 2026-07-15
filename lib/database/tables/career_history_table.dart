import 'package:drift/drift.dart';

/// Drift table definition for the `career_history` table.
///
/// Matches the Career schema in SCHEMA.md exactly.
/// Cascading deletes when the parent human is removed.
class CareerHistoryTable extends Table {
  @override
  String get tableName => 'career_history';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get company => text().nullable()();
  TextColumn get position => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get startDate => text().nullable()();
  TextColumn get endDate => text().nullable()();
  TextColumn get responsibilities => text().nullable()();
  TextColumn get achievements => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [];
}

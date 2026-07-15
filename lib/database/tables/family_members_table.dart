import 'package:drift/drift.dart';

/// Drift table definition for the `family_members` table.
///
/// Matches the Family schema in SCHEMA.md exactly.
/// Cascading deletes when the parent human is removed.
class FamilyMembersTable extends Table {
  @override
  String get tableName => 'family_members';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get name => text()();
  TextColumn get relationship => text().nullable()();
  IntColumn get birthYear => integer().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get photoPath => text().nullable()();
  TextColumn get gender => text().nullable()();
  IntColumn get closeness => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [];
}

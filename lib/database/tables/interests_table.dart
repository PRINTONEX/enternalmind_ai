import 'package:drift/drift.dart';

/// Drift table definition for the `interests` table.
class InterestsTable extends Table {
  @override
  String get tableName => 'interests';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [];
}

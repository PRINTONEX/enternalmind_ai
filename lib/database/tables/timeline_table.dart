import 'package:drift/drift.dart';

/// Drift table definition for the `timeline` table.
class TimelineTable extends Table {
  @override
  String get tableName => 'timeline';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get title => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get date => text().nullable()();
  IntColumn get year => integer().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get emotion => text().nullable()();
  TextColumn get importance => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [];
}

import 'package:drift/drift.dart';

/// Drift table definition for the `memories` table.
class MemoriesTable extends Table {
  @override
  String get tableName => 'memories';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get category => text().nullable()();
  TextColumn get date => text().nullable()();
  TextColumn get emotion => text().nullable()();
  TextColumn get location => text().nullable()();
  IntColumn get importance => integer().nullable()();
  TextColumn get privacy => text().nullable()();
  TextColumn get tags => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [];
}

import 'package:drift/drift.dart';

/// Drift table definition for the `life_stories` table.
class LifeStoriesTable extends Table {
  @override
  String get tableName => 'life_stories';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get sectionKey => text().nullable()();
  TextColumn get title => text().nullable()();
  TextColumn get content => text().nullable()();
  TextColumn get tags => text().nullable()();
  TextColumn get emotion => text().nullable()();
  IntColumn get importance => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [];
}

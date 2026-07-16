import 'package:drift/drift.dart';

/// Drift table definition for the `languages` table.
class LanguagesTable extends Table {
  @override
  String get tableName => 'languages';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get language => text()();
  IntColumn get readingRating => integer().nullable()();
  IntColumn get writingRating => integer().nullable()();
  IntColumn get speakingRating => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [];
}

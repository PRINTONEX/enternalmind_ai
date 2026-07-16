import 'package:drift/drift.dart';

/// Drift table definition for the `daily_journals` table.
class DailyJournalsTable extends Table {
  @override
  String get tableName => 'daily_journals';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get date => text().nullable()();
  TextColumn get mood => text().nullable()();
  TextColumn get weather => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get journalText => text().nullable()();
  TextColumn get voicePath => text().nullable()();
  TextColumn get tags => text().nullable()();
  TextColumn get favoriteMoment => text().nullable()();
  TextColumn get lessonsLearned => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [];
}

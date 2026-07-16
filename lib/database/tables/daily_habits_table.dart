import 'package:drift/drift.dart';

class DailyHabitsTable extends Table {
  @override
  String get tableName => 'daily_habits';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get wakeTime => text().nullable()();
  TextColumn get sleepTime => text().nullable()();
  TextColumn get prayer => text().nullable()();
  TextColumn get exercise => text().nullable()();
  TextColumn get reading => text().nullable()();
  TextColumn get coding => text().nullable()();
  TextColumn get teaCoffee => text().nullable()();
  TextColumn get smokingAlcohol => text().nullable()();
  TextColumn get meditationWalking => text().nullable()();
  TextColumn get customHabits => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}

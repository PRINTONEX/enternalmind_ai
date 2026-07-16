import 'package:drift/drift.dart';

class DecisionProfilesTable extends Table {
  @override
  String get tableName => 'decision_profiles';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  IntColumn get logicLevel => integer().nullable()();
  IntColumn get emotionLevel => integer().nullable()();
  IntColumn get faithLevel => integer().nullable()();
  IntColumn get researchLevel => integer().nullable()();
  IntColumn get experienceLevel => integer().nullable()();
  IntColumn get friendsInfluence => integer().nullable()();
  IntColumn get familyInfluence => integer().nullable()();
  TextColumn get riskLevel => text().nullable()();
  TextColumn get financialStyle => text().nullable()();
  TextColumn get leadershipStyle => text().nullable()();
  TextColumn get conflictHandling => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}

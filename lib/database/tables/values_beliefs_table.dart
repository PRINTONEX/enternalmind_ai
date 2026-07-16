import 'package:drift/drift.dart';

class ValuesBeliefsTable extends Table {
  @override
  String get tableName => 'values_beliefs';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get religion => text().nullable()();
  TextColumn get coreValues => text().nullable()();
  TextColumn get lifePrinciples => text().nullable()();
  TextColumn get ethics => text().nullable()();
  TextColumn get thingsNeverDo => text().nullable()();
  TextColumn get thingsAlwaysDo => text().nullable()();
  TextColumn get politicalPreference => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}

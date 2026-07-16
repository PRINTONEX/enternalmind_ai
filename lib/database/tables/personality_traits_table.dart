import 'package:drift/drift.dart';

class PersonalityTraitsTable extends Table {
  @override
  String get tableName => 'personality_traits';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  IntColumn get kindness => integer().nullable()();
  IntColumn get patience => integer().nullable()();
  IntColumn get leadership => integer().nullable()();
  IntColumn get confidence => integer().nullable()();
  IntColumn get humor => integer().nullable()();
  IntColumn get creativity => integer().nullable()();
  IntColumn get optimism => integer().nullable()();
  IntColumn get discipline => integer().nullable()();
  IntColumn get curiosity => integer().nullable()();
  IntColumn get emotional => integer().nullable()();
  TextColumn get speakingStyle => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}

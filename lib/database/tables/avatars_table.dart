import 'package:drift/drift.dart';

class AvatarsTable extends Table {
  @override
  String get tableName => 'avatars';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get filePath => text().nullable()();
  TextColumn get style => text().nullable()();
  TextColumn get expression => text().nullable()();
  IntColumn get isDefault => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}

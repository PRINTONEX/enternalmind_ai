import 'package:drift/drift.dart';

class LegacyMessagesTable extends Table {
  @override
  String get tableName => 'legacy_messages';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get category => text().nullable()();
  TextColumn get recipient => text().nullable()();
  TextColumn get relationship => text().nullable()();
  TextColumn get message => text().nullable()();
  TextColumn get audioPath => text().nullable()();
  TextColumn get videoPath => text().nullable()();
  TextColumn get trigger => text().nullable()();
  TextColumn get deliveryRule => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [];
}

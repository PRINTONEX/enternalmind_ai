import 'package:drift/drift.dart';

class ChatHistoryTable extends Table {
  @override
  String get tableName => 'chat_history';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get role => text()();
  TextColumn get message => text()();
  TextColumn get attachments => text().nullable()();
  TextColumn get sources => text().nullable()();
  TextColumn get provider => text().nullable()();
  TextColumn get model => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}

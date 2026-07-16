import 'package:drift/drift.dart';

class ConversationStylesTable extends Table {
  @override
  String get tableName => 'conversation_styles';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get tone => text().nullable()();
  IntColumn get storyTeller => integer().nullable()();
  IntColumn get teacherMode => integer().nullable()();
  IntColumn get motivational => integer().nullable()();
  TextColumn get replyLength => text().nullable()();
  TextColumn get emojiUsage => text().nullable()();
  TextColumn get localLanguage => text().nullable()();
  TextColumn get proverbs => text().nullable()();
  TextColumn get quotes => text().nullable()();
  TextColumn get religiousExpressions => text().nullable()();
  TextColumn get favoriteGreetings => text().nullable()();
  TextColumn get signatureClosing => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}

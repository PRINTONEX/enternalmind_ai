import 'package:drift/drift.dart';

class FavoriteWordsTable extends Table {
  @override
  String get tableName => 'favorite_words';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get word => text()();
  DateTimeColumn get createdAt => dateTime()();
}

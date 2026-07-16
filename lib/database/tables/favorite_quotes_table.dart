import 'package:drift/drift.dart';

class FavoriteQuotesTable extends Table {
  @override
  String get tableName => 'favorite_quotes';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get quote => text()();
  DateTimeColumn get createdAt => dateTime()();
}

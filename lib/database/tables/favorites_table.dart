import 'package:drift/drift.dart';

class FavoritesTable extends Table {
  @override
  String get tableName => 'favorites';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get type => text()();
  TextColumn get value => text()();
  DateTimeColumn get createdAt => dateTime()();
}

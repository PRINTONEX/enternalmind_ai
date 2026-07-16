import 'package:drift/drift.dart';

class DocumentsTable extends Table {
  @override
  String get tableName => 'documents';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get title => text()();
  TextColumn get category => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get filePath => text().nullable()();
  TextColumn get tags => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [];
}

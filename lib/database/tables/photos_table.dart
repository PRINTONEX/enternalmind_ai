import 'package:drift/drift.dart';

class PhotosTable extends Table {
  @override
  String get tableName => 'photos';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  IntColumn get albumId => integer().nullable()();
  TextColumn get filePath => text()();
  TextColumn get caption => text().nullable()();
  TextColumn get takenDate => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get tags => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [];
}

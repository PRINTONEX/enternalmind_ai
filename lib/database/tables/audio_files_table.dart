import 'package:drift/drift.dart';

class AudioFilesTable extends Table {
  @override
  String get tableName => 'audio_files';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get filePath => text()();
  TextColumn get transcript => text().nullable()();
  RealColumn get duration => real().nullable()();
  TextColumn get emotion => text().nullable()();
  TextColumn get language => text().nullable()();
  TextColumn get provider => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [];
}

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/humans_table.dart';
import 'tables/family_members_table.dart';
import 'tables/education_table.dart';
import 'tables/career_history_table.dart';

part 'app_database.g.dart';

/// EternalMind AI Drift database definition.
@DriftDatabase(
  tables: [
    HumansTable,
    FamilyMembersTable,
    EducationTable,
    CareerHistoryTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? _createExecutor());

  static QueryExecutor _createExecutor() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'enternalmind.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {},
      );
}

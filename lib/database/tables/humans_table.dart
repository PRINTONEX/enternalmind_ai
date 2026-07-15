import 'package:drift/drift.dart';

/// Drift table definition for the `humans` (profile) table.
///
/// Matches the Profile schema in SCHEMA.md exactly.
class HumansTable extends Table {
  @override
  String get tableName => 'humans';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get photoPath => text().nullable()();
  TextColumn get fullName => text()();
  TextColumn get nickname => text().nullable()();
  DateTimeColumn get birthDate => dateTime().nullable()();
  TextColumn get birthPlace => text().nullable()();
  TextColumn get currentCity => text().nullable()();
  TextColumn get nationality => text().nullable()();
  TextColumn get religion => text().nullable()();
  TextColumn get gender => text().nullable()();
  TextColumn get maritalStatus => text().nullable()();
  TextColumn get occupation => text().nullable()();
  TextColumn get about => text().nullable()();
  TextColumn get favoriteQuotes => text().nullable()();
  TextColumn get lifePhilosophy => text().nullable()();
  TextColumn get hobbies => text().nullable()();
  TextColumn get languages => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

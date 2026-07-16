import 'package:drift/drift.dart';

class AiProvidersTable extends Table {
  @override
  String get tableName => 'ai_providers';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer().nullable()();
  TextColumn get name => text()();
  TextColumn get providerType => text().nullable()();
  TextColumn get apiKey => text().nullable()();
  TextColumn get baseUrl => text().nullable()();
  TextColumn get model => text().nullable()();
  TextColumn get temperature => text().nullable()();
  IntColumn get maxTokens => integer().nullable()();
  IntColumn get timeout => integer().nullable()();
  IntColumn get retryCount => integer().nullable()();
  IntColumn get priority => integer().nullable()();
  IntColumn get isBackup => integer().nullable()();
  TextColumn get status => text().nullable()();
  IntColumn get latency => integer().nullable()();
  IntColumn get totalRequests => integer().nullable()();
  IntColumn get totalTokens => integer().nullable()();
  TextColumn get totalCost => text().nullable()();
  IntColumn get failures => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

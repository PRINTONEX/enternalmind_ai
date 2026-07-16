import 'package:drift/drift.dart';

class VoiceSettingsTable extends Table {
  @override
  String get tableName => 'voice_settings';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get humanId => integer()
      .customConstraint('NOT NULL REFERENCES humans(id) ON DELETE CASCADE')();
  TextColumn get providerStt => text().nullable()();
  TextColumn get providerTts => text().nullable()();
  TextColumn get voiceModel => text().nullable()();
  TextColumn get accent => text().nullable()();
  TextColumn get pitch => text().nullable()();
  RealColumn get speed => real().nullable()();
  RealColumn get volume => real().nullable()();
  TextColumn get emotion => text().nullable()();
  RealColumn get pauseDuration => real().nullable()();
  TextColumn get speakingStyle => text().nullable()();
  IntColumn get silenceTimeout => integer().nullable()();
  IntColumn get noiseSuppression => integer().nullable()();
  IntColumn get echoCancellation => integer().nullable()();
  IntColumn get autoGainControl => integer().nullable()();
  RealColumn get voiceSensitivity => real().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
}

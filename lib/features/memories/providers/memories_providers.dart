import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import '../../../database/app_database.dart';
import '../../../providers/database_providers.dart';
import '../../wizard/providers/wizard_providers.dart';

class VaultStorageStats {
  final int memoriesCount;
  final int photosCount;
  final int documentsCount;
  final int audioCount;

  VaultStorageStats({
    required this.memoriesCount,
    required this.photosCount,
    required this.documentsCount,
    required this.audioCount,
  });

  double get estimatedBytes {
    final double textMemoryBytes = memoriesCount * 2 * 1024.0;
    final double photoBytes = photosCount * 1.5 * 1024.0 * 1024.0;
    final double documentBytes = documentsCount * 500 * 1024.0;
    final double audioBytes = audioCount * 1.2 * 1024.0 * 1024.0;
    return textMemoryBytes + photoBytes + documentBytes + audioBytes;
  }

  String get formattedUsage {
    final bytes = estimatedBytes;
    final totalBytes = bytes + (120.45 * 1024.0 * 1024.0); // 120.45 MB baseline for indices and profile avatar
    
    if (totalBytes >= 1024.0 * 1024.0 * 1024.0) {
      return '${(totalBytes / (1024.0 * 1024.0 * 1024.0)).toStringAsFixed(2)} GB';
    } else {
      return '${(totalBytes / (1024.0 * 1024.0)).toStringAsFixed(2)} MB';
    }
  }

  double get percentOfLimit {
    const double limitBytes = 20.0 * 1024.0 * 1024.0 * 1024.0; // 20 GB limit
    final totalBytes = estimatedBytes + (120.45 * 1024.0 * 1024.0);
    return (totalBytes / limitBytes).clamp(0.0, 1.0);
  }
}

// Counts Streams

final memoriesCountProvider = StreamProvider<int>((ref) {
  final activeId = ref.watch(activeProfileIdProvider);
  if (activeId == null) return Stream.value(0);
  return ref.watch(memoriesDaoProvider).watchCount(activeId);
});

final photosCountProvider = StreamProvider<int>((ref) {
  final activeId = ref.watch(activeProfileIdProvider);
  if (activeId == null) return Stream.value(0);
  return ref.watch(photosDaoProvider).watchCount(activeId);
});

final documentsCountProvider = StreamProvider<int>((ref) {
  final activeId = ref.watch(activeProfileIdProvider);
  if (activeId == null) return Stream.value(0);
  return ref.watch(documentsDaoProvider).watchCount(activeId);
});

final audioCountProvider = StreamProvider<int>((ref) {
  final activeId = ref.watch(activeProfileIdProvider);
  if (activeId == null) return Stream.value(0);
  return ref.watch(audioFilesDaoProvider).watchCount(activeId);
});

// Vault Statistics Provider

final vaultStorageStatsProvider = Provider<VaultStorageStats>((ref) {
  final memoriesCount = ref.watch(memoriesCountProvider).value ?? 0;
  final photosCount = ref.watch(photosCountProvider).value ?? 0;
  final documentsCount = ref.watch(documentsCountProvider).value ?? 0;
  final audioCount = ref.watch(audioCountProvider).value ?? 0;

  return VaultStorageStats(
    memoriesCount: memoriesCount,
    photosCount: photosCount,
    documentsCount: documentsCount,
    audioCount: audioCount,
  );
});

// Recent Memories Provider

final recentMemoriesProvider = StreamProvider<List<MemoriesTableData>>((ref) {
  final activeId = ref.watch(activeProfileIdProvider);
  if (activeId == null) return Stream.value([]);
  final db = ref.watch(appDatabaseProvider);
  return (db.select(db.memoriesTable)
        ..where((t) => t.humanId.equals(activeId))
        ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
        ..limit(4))
      .watch();
});

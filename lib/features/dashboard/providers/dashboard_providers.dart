/// {@template dashboard_providers}
/// Realtime Riverpod providers for the Dashboard.
///
/// Each provider streams live data from the Drift database so the UI
/// automatically reflects changes made elsewhere (e.g. after importing
/// a JSON backup or finishing the wizard).
///
/// Uses the shared [activeProfileIdProvider] from
/// [database_providers] so the ID set during splash / import
/// flows through to these dashboard streams.
/// {@endtemplate}
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/database_providers.dart';
import '../../wizard/models/wizard_models.dart';
import '../../wizard/providers/wizard_providers.dart';

// ── Profile ──

/// Streams the active [ProfileModel] in realtime.
///
/// Returns `null` while loading or when no profile exists.
final dashProfileProvider = StreamProvider<ProfileModel?>((ref) {
  final dao = ref.watch(humanDaoProvider);
  return dao.watchLastActive().map((data) {
    if (data == null) return null;
    // Sync the shared active-profile ID so count providers below can use it.
    ref.read(activeProfileIdProvider.notifier).state = data.id;
    return ProfileModel.fromDrift(data);
  });
});

// ── Family Count ──

/// Streams the count of family members for the active profile in realtime.
final dashFamilyCountProvider = StreamProvider<int>((ref) {
  final dao = ref.watch(familyDaoProvider);
  final activeId = ref.watch(activeProfileIdProvider);
  if (activeId == null) return Stream.value(0);
  return dao.watchFamilyCount(activeId);
});

// ── Education Count ──

/// Streams the count of education records for the active profile in realtime.
final dashEducationCountProvider = StreamProvider<int>((ref) {
  final dao = ref.watch(educationDaoProvider);
  final activeId = ref.watch(activeProfileIdProvider);
  if (activeId == null) return Stream.value(0);
  return dao.watchEducationCount(activeId);
});

// ── Career Count ──

/// Streams the count of career records for the active profile in realtime.
final dashCareerCountProvider = StreamProvider<int>((ref) {
  final dao = ref.watch(careerDaoProvider);
  final activeId = ref.watch(activeProfileIdProvider);
  if (activeId == null) return Stream.value(0);
  return dao.watchCareerCount(activeId);
});

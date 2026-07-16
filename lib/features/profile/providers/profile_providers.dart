/// Realtime Riverpod providers for the Profile screen sections.
///
/// Each provider fetches data from its corresponding table for the
/// active Digital Human profile (using [activeProfileIdProvider]).
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../database/app_database.dart';
import '../../../providers/database_providers.dart';
import '../../wizard/providers/wizard_providers.dart';

// ── Family Members ──

final profileFamilyMembersProvider = FutureProvider.autoDispose<List<FamilyMembersTableData>>((ref) async {
  final dao = ref.watch(familyDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getFamilyMembers(id);
});

// ── Education ──

final profileEducationProvider = FutureProvider.autoDispose<List<EducationTableData>>((ref) async {
  final dao = ref.watch(educationDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getEducation(id);
});

// ── Career ──

final profileCareerProvider = FutureProvider.autoDispose<List<CareerHistoryTableData>>((ref) async {
  final dao = ref.watch(careerDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getCareer(id);
});

// ── Life Stories ──

final profileLifeStoriesProvider = FutureProvider.autoDispose<List<LifeStoriesTableData>>((ref) async {
  final dao = ref.watch(lifeStoriesDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getForHuman(id);
});

// ── Life Places ──

final profileLifePlacesProvider = FutureProvider.autoDispose<List<LifePlacesTableData>>((ref) async {
  final dao = ref.watch(lifePlacesDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getForHuman(id);
});

// ── Daily Journals ──

final profileDailyJournalsProvider = FutureProvider.autoDispose<List<DailyJournalsTableData>>((ref) async {
  final dao = ref.watch(dailyJournalsDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getForHuman(id);
});

// ── Memories ──

final profileMemoriesProvider = FutureProvider.autoDispose<List<MemoriesTableData>>((ref) async {
  final dao = ref.watch(memoriesDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getForHuman(id);
});

// ── Photo Albums ──

final profilePhotoAlbumsProvider = FutureProvider.autoDispose<List<PhotoAlbumsTableData>>((ref) async {
  final dao = ref.watch(photoAlbumsDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getForHuman(id);
});

// ── Photos ──

final profilePhotosProvider = FutureProvider.autoDispose<List<PhotosTableData>>((ref) async {
  final dao = ref.watch(photosDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getForHuman(id);
});

// ── Voice Settings ──

final profileVoiceSettingsProvider = FutureProvider.autoDispose<List<VoiceSettingsTableData>>((ref) async {
  final dao = ref.watch(voiceSettingsDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getForHuman(id);
});

// ── Documents ──

final profileDocumentsProvider = FutureProvider.autoDispose<List<DocumentsTableData>>((ref) async {
  final dao = ref.watch(documentsDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getForHuman(id);
});

// ── Legacy Messages ──

final profileLegacyMessagesProvider = FutureProvider.autoDispose<List<LegacyMessagesTableData>>((ref) async {
  final dao = ref.watch(legacyMessagesDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getForHuman(id);
});

// ── Skills ──

final profileSkillsProvider = FutureProvider.autoDispose<List<SkillsTableData>>((ref) async {
  final dao = ref.watch(skillsDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getForHuman(id);
});

// ── Interests ──

final profileInterestsProvider = FutureProvider.autoDispose<List<InterestsTableData>>((ref) async {
  final dao = ref.watch(interestsDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getForHuman(id);
});

// ── Goals ──

final profileGoalsProvider = FutureProvider.autoDispose<List<GoalsTableData>>((ref) async {
  final dao = ref.watch(goalsDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getForHuman(id);
});

// ── Personality Traits ──

final profilePersonalityTraitsProvider = FutureProvider.autoDispose<PersonalityTraitsTableData?>((ref) async {
  final dao = ref.watch(personalityTraitsDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return null;
  return dao.getForHuman(id);
});

// ── Conversation Styles ──

final profileConversationStylesProvider = FutureProvider.autoDispose<ConversationStylesTableData?>((ref) async {
  final dao = ref.watch(conversationStylesDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return null;
  return dao.getForHuman(id);
});

// ── Favorites ──

final profileFavoritesProvider = FutureProvider.autoDispose<List<FavoritesTableData>>((ref) async {
  final dao = ref.watch(favoritesDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getForHuman(id);
});

// ── Languages ──

final profileLanguagesProvider = FutureProvider.autoDispose<List<LanguagesTableData>>((ref) async {
  final dao = ref.watch(languagesDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getForHuman(id);
});

// ── Timeline ──

final profileTimelineProvider = FutureProvider.autoDispose<List<TimelineTableData>>((ref) async {
  final dao = ref.watch(timelineDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getForHuman(id);
});

// ── Daily Habits ──

final profileDailyHabitsProvider = FutureProvider.autoDispose<DailyHabitsTableData?>((ref) async {
  final dao = ref.watch(dailyHabitsDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return null;
  return dao.getForHuman(id);
});

// ── Values & Beliefs ──

final profileValuesBeliefsProvider = FutureProvider.autoDispose<ValuesBeliefsTableData?>((ref) async {
  final dao = ref.watch(valuesBeliefsDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return null;
  return dao.getForHuman(id);
});

// ── Decision Profiles ──

final profileDecisionProfilesProvider = FutureProvider.autoDispose<DecisionProfilesTableData?>((ref) async {
  final dao = ref.watch(decisionProfilesDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return null;
  return dao.getForHuman(id);
});

// ── Favorite Words ──

final profileFavoriteWordsProvider = FutureProvider.autoDispose<List<FavoriteWordsTableData>>((ref) async {
  final dao = ref.watch(favoriteWordsDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getForHuman(id);
});

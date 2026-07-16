/// Riverpod providers for the Profile Wizard.
///
/// Manages database access, wizard step state, auto-save, and resume logic.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../database/daos/human_dao.dart';
import '../../../database/daos/family_dao.dart';
import '../../../database/daos/education_dao.dart';
import '../../../database/daos/career_dao.dart';
import '../../../database/daos/content_dao.dart';
import '../../../database/daos/profile_extras_dao.dart';
import '../../../database/daos/personality_dao.dart';
import '../../../database/daos/ai_dao.dart';
import '../../../providers/database_providers.dart';
import '../models/wizard_models.dart';

// ── Database Providers ──

final humanDaoProvider = Provider<HumanDao>((ref) {
  return HumanDao(ref.watch(appDatabaseProvider));
});

final familyDaoProvider = Provider<FamilyDao>((ref) {
  return FamilyDao(ref.watch(appDatabaseProvider));
});

final educationDaoProvider = Provider<EducationDao>((ref) {
  return EducationDao(ref.watch(appDatabaseProvider));
});

final careerDaoProvider = Provider<CareerDao>((ref) {
  return CareerDao(ref.watch(appDatabaseProvider));
});

// ── Content DAO Providers ──

final lifeStoriesDaoProvider = Provider<LifeStoriesDao>((ref) {
  return LifeStoriesDao(ref.watch(appDatabaseProvider));
});

final timelineDaoProvider = Provider<TimelineDao>((ref) {
  return TimelineDao(ref.watch(appDatabaseProvider));
});

final dailyJournalsDaoProvider = Provider<DailyJournalsDao>((ref) {
  return DailyJournalsDao(ref.watch(appDatabaseProvider));
});

final memoriesDaoProvider = Provider<MemoriesDao>((ref) {
  return MemoriesDao(ref.watch(appDatabaseProvider));
});

final photosDaoProvider = Provider<PhotosDao>((ref) {
  return PhotosDao(ref.watch(appDatabaseProvider));
});

final photoAlbumsDaoProvider = Provider<PhotoAlbumsDao>((ref) {
  return PhotoAlbumsDao(ref.watch(appDatabaseProvider));
});

final documentsDaoProvider = Provider<DocumentsDao>((ref) {
  return DocumentsDao(ref.watch(appDatabaseProvider));
});

final audioFilesDaoProvider = Provider<AudioFilesDao>((ref) {
  return AudioFilesDao(ref.watch(appDatabaseProvider));
});

final voiceSettingsDaoProvider = Provider<VoiceSettingsDao>((ref) {
  return VoiceSettingsDao(ref.watch(appDatabaseProvider));
});

final legacyMessagesDaoProvider = Provider<LegacyMessagesDao>((ref) {
  return LegacyMessagesDao(ref.watch(appDatabaseProvider));
});

final memoryTagsDaoProvider = Provider<MemoryTagsDao>((ref) {
  return MemoryTagsDao(ref.watch(appDatabaseProvider));
});

// ── Profile Extras DAO Providers ──

final skillsDaoProvider = Provider<SkillsDao>((ref) {
  return SkillsDao(ref.watch(appDatabaseProvider));
});

final languagesDaoProvider = Provider<LanguagesDao>((ref) {
  return LanguagesDao(ref.watch(appDatabaseProvider));
});

final interestsDaoProvider = Provider<InterestsDao>((ref) {
  return InterestsDao(ref.watch(appDatabaseProvider));
});

final goalsDaoProvider = Provider<GoalsDao>((ref) {
  return GoalsDao(ref.watch(appDatabaseProvider));
});

final lifePlacesDaoProvider = Provider<LifePlacesDao>((ref) {
  return LifePlacesDao(ref.watch(appDatabaseProvider));
});

final favoritesDaoProvider = Provider<FavoritesDao>((ref) {
  return FavoritesDao(ref.watch(appDatabaseProvider));
});

final favoriteQuotesDaoProvider = Provider<FavoriteQuotesDao>((ref) {
  return FavoriteQuotesDao(ref.watch(appDatabaseProvider));
});

final favoriteWordsDaoProvider = Provider<FavoriteWordsDao>((ref) {
  return FavoriteWordsDao(ref.watch(appDatabaseProvider));
});

// ── Personality DAO Providers ──

final personalityTraitsDaoProvider = Provider<PersonalityTraitsDao>((ref) {
  return PersonalityTraitsDao(ref.watch(appDatabaseProvider));
});

final conversationStylesDaoProvider = Provider<ConversationStylesDao>((ref) {
  return ConversationStylesDao(ref.watch(appDatabaseProvider));
});

final dailyHabitsDaoProvider = Provider<DailyHabitsDao>((ref) {
  return DailyHabitsDao(ref.watch(appDatabaseProvider));
});

final valuesBeliefsDaoProvider = Provider<ValuesBeliefsDao>((ref) {
  return ValuesBeliefsDao(ref.watch(appDatabaseProvider));
});

final decisionProfilesDaoProvider = Provider<DecisionProfilesDao>((ref) {
  return DecisionProfilesDao(ref.watch(appDatabaseProvider));
});

// ── AI DAO Providers ──

final aiProvidersDaoProvider = Provider<AiProvidersDao>((ref) {
  return AiProvidersDao(ref.watch(appDatabaseProvider));
});

final aiSettingsDaoProvider = Provider<AiSettingsDao>((ref) {
  return AiSettingsDao(ref.watch(appDatabaseProvider));
});

final avatarsDaoProvider = Provider<AvatarsDao>((ref) {
  return AvatarsDao(ref.watch(appDatabaseProvider));
});

final chatHistoryDaoProvider = Provider<ChatHistoryDao>((ref) {
  return ChatHistoryDao(ref.watch(appDatabaseProvider));
});

// ── Wizard State ──

enum WizardStep {
  identity,
  biography,
  family,
  education,
  review,
}

class WizardState {
  WizardState({
    this.currentStep = WizardStep.identity,
    this.activeProfileId,
    ProfileModel? profile,
    List<FamilyMemberModel>? familyMembers,
    List<EducationModel>? education,
    this.isSaving = false,
    this.lastSaved,
    Set<WizardStep>? completedSteps,
  })  : profile = profile ?? ProfileModel(fullName: ''),
        familyMembers = familyMembers ?? <FamilyMemberModel>[],
        education = education ?? <EducationModel>[],
        completedSteps = completedSteps ?? <WizardStep>{};

  final WizardStep currentStep;
  final int? activeProfileId;
  final ProfileModel profile;
  final List<FamilyMemberModel> familyMembers;
  final List<EducationModel> education;
  final bool isSaving;
  final DateTime? lastSaved;
  final Set<WizardStep> completedSteps;

  WizardState copyWith({
    WizardStep? currentStep,
    int? activeProfileId,
    ProfileModel? profile,
    List<FamilyMemberModel>? familyMembers,
    List<EducationModel>? education,
    bool? isSaving,
    DateTime? lastSaved,
    bool clearActiveProfileId = false,
    Set<WizardStep>? completedSteps,
  }) {
    return WizardState(
      currentStep: currentStep ?? this.currentStep,
      activeProfileId:
          clearActiveProfileId ? null : (activeProfileId ?? this.activeProfileId),
      profile: profile ?? this.profile,
      familyMembers: familyMembers ?? this.familyMembers,
      education: education ?? this.education,
      isSaving: isSaving ?? this.isSaving,
      lastSaved: lastSaved ?? this.lastSaved,
      completedSteps: completedSteps ?? this.completedSteps,
    );
  }
}

class WizardNotifier extends StateNotifier<WizardState> {
  WizardNotifier(this._ref) : super(WizardState());

  final Ref _ref;

  HumanDao get _humanDao => _ref.read(humanDaoProvider);
  FamilyDao get _familyDao => _ref.read(familyDaoProvider);
  EducationDao get _educationDao => _ref.read(educationDaoProvider);

  Future<void> tryResume() async {
    final lastActive = await _humanDao.getLastActive();
    if (lastActive == null) return;

    final profile = ProfileModel.fromDrift(lastActive);
    final family = (await _familyDao.getFamilyMembers(lastActive.id))
        .map(FamilyMemberModel.fromDrift)
        .toList();
    final education = (await _educationDao.getEducation(lastActive.id))
        .map(EducationModel.fromDrift)
        .toList();

    state = state.copyWith(
      activeProfileId: lastActive.id,
      profile: profile,
      familyMembers: family,
      education: education,
    );
  }

  void updateProfile(ProfileModel updated) {
    state = state.copyWith(profile: updated);
    _autoSaveProfile();
  }

  void addFamilyMember(FamilyMemberModel member) {
    state = state.copyWith(
      familyMembers: [...state.familyMembers, member],
    );
    _autoSaveFamily();
  }

  void updateFamilyMember(int index, FamilyMemberModel updated) {
    final members = [...state.familyMembers];
    if (index < members.length) {
      members[index] = updated;
      state = state.copyWith(familyMembers: members);
      _autoSaveFamily();
    }
  }

  void removeFamilyMember(int index) {
    final members = [...state.familyMembers];
    if (index < members.length) {
      members.removeAt(index);
      state = state.copyWith(familyMembers: members);
      _autoSaveFamily();
    }
  }

  void addEducation(EducationModel edu) {
    state = state.copyWith(
      education: [...state.education, edu],
    );
    _autoSaveEducation();
  }

  void updateEducation(int index, EducationModel updated) {
    final list = [...state.education];
    if (index < list.length) {
      list[index] = updated;
      state = state.copyWith(education: list);
      _autoSaveEducation();
    }
  }

  void removeEducation(int index) {
    final list = [...state.education];
    if (index < list.length) {
      list.removeAt(index);
      state = state.copyWith(education: list);
      _autoSaveEducation();
    }
  }

  Future<void> nextStep() async {
    final steps = WizardStep.values;
    final currentIndex = steps.indexOf(state.currentStep);
    if (currentIndex < steps.length - 1) {
      await _saveCurrentStep();
      state = state.copyWith(
        currentStep: steps[currentIndex + 1],
        completedSteps: {...state.completedSteps, state.currentStep},
      );
    }
  }

  void previousStep() {
    final steps = WizardStep.values;
    final currentIndex = steps.indexOf(state.currentStep);
    if (currentIndex > 0) {
      state = state.copyWith(currentStep: steps[currentIndex - 1]);
    }
  }

  Future<void> completeWizard() async {
    await _saveCurrentStep();
    final activeId = state.activeProfileId;
    if (activeId != null) {
      _ref.read(activeProfileIdProvider.notifier).state = activeId;
    }
    state = state.copyWith(
      completedSteps: {...state.completedSteps, WizardStep.review},
    );
  }

  Future<void> _saveCurrentStep() async {
    await _saveProfile();
    await _saveFamily();
    await _saveEducation();
  }

  Future<void> _autoSaveProfile() async {
    if (state.isSaving) return;
    state = state.copyWith(isSaving: true);
    try {
      await _saveProfile();
      state = state.copyWith(isSaving: false, lastSaved: DateTime.now());
    } catch (_) {
      state = state.copyWith(isSaving: false);
    }
  }

  Future<void> _autoSaveFamily() async {
    if (state.isSaving) return;
    state = state.copyWith(isSaving: true);
    try {
      await _saveFamily();
      state = state.copyWith(isSaving: false, lastSaved: DateTime.now());
    } catch (_) {
      state = state.copyWith(isSaving: false);
    }
  }

  Future<void> _autoSaveEducation() async {
    if (state.isSaving) return;
    state = state.copyWith(isSaving: true);
    try {
      await _saveEducation();
      state = state.copyWith(isSaving: false, lastSaved: DateTime.now());
    } catch (_) {
      state = state.copyWith(isSaving: false);
    }
  }

  Future<void> _saveProfile() async {
    final p = state.profile;
    if (state.activeProfileId != null) {
      await _humanDao.updateHuman(
        state.activeProfileId!,
        p.toUpdateCompanion(),
      );
    } else {
      final id = await _humanDao.insertHuman(p.toCompanion());
      state = state.copyWith(activeProfileId: id);
    }
  }

  Future<void> _saveFamily() async {
    if (state.activeProfileId == null) return;
    final humanId = state.activeProfileId!;
    await _familyDao.deleteAllForHuman(humanId);
    for (final member in state.familyMembers) {
      await _familyDao.insertFamilyMember(
        member.copyWith(humanId: humanId).toCompanion(),
      );
    }
  }

  Future<void> _saveEducation() async {
    if (state.activeProfileId == null) return;
    final humanId = state.activeProfileId!;
    await _educationDao.deleteAllForHuman(humanId);
    for (final edu in state.education) {
      await _educationDao.insertEducation(
        edu.copyWith(humanId: humanId).toCompanion(),
      );
    }
  }
}

final wizardProvider = StateNotifierProvider<WizardNotifier, WizardState>((ref) {
  final notifier = WizardNotifier(ref);
  notifier.tryResume();
  return notifier;
});

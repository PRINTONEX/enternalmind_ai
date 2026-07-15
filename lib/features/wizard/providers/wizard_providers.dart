/// Riverpod providers for the Profile Wizard.
///
/// Manages database access, wizard step state, auto-save, and resume logic.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../database/daos/human_dao.dart';
import '../../../database/daos/family_dao.dart';
import '../../../database/daos/education_dao.dart';
import '../../../providers/database_providers.dart';
import '../models/wizard_models.dart';

// ── Database Providers ──

/// Provider for HumanDao.
final humanDaoProvider = Provider<HumanDao>((ref) {
  return HumanDao(ref.watch(appDatabaseProvider));
});

/// Provider for FamilyDao.
final familyDaoProvider = Provider<FamilyDao>((ref) {
  return FamilyDao(ref.watch(appDatabaseProvider));
});

/// Provider for EducationDao.
final educationDaoProvider = Provider<EducationDao>((ref) {
  return EducationDao(ref.watch(appDatabaseProvider));
});

// ── Wizard State ──

/// The five steps of the wizard.
enum WizardStep {
  identity,
  biography,
  family,
  education,
  review,
}

/// Complete wizard form state.
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

/// The wizard state notifier with auto-save and resume logic.
class WizardNotifier extends StateNotifier<WizardState> {
  WizardNotifier(this._ref) : super(WizardState());

  final Ref _ref;

  HumanDao get _humanDao => _ref.read(humanDaoProvider);
  FamilyDao get _familyDao => _ref.read(familyDaoProvider);
  EducationDao get _educationDao => _ref.read(educationDaoProvider);

  // ── Initialization & Resume ──

  /// Attempts to resume a partially-completed wizard from the last active profile.
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

  // ── Profile (Steps 1 & 2) ──

  /// Updates the profile model with new data.
  void updateProfile(ProfileModel updated) {
    state = state.copyWith(profile: updated);
    _autoSaveProfile();
  }

  // ── Family (Step 3) ──

  /// Adds a new family member.
  void addFamilyMember(FamilyMemberModel member) {
    state = state.copyWith(
      familyMembers: [...state.familyMembers, member],
    );
    _autoSaveFamily();
  }

  /// Updates an existing family member.
  void updateFamilyMember(int index, FamilyMemberModel updated) {
    final members = [...state.familyMembers];
    if (index < members.length) {
      members[index] = updated;
      state = state.copyWith(familyMembers: members);
      _autoSaveFamily();
    }
  }

  /// Removes a family member.
  void removeFamilyMember(int index) {
    final members = [...state.familyMembers];
    if (index < members.length) {
      members.removeAt(index);
      state = state.copyWith(familyMembers: members);
      _autoSaveFamily();
    }
  }

  // ── Education (Step 4) ──

  /// Adds a new education record.
  void addEducation(EducationModel edu) {
    state = state.copyWith(
      education: [...state.education, edu],
    );
    _autoSaveEducation();
  }

  /// Updates an existing education record.
  void updateEducation(int index, EducationModel updated) {
    final list = [...state.education];
    if (index < list.length) {
      list[index] = updated;
      state = state.copyWith(education: list);
      _autoSaveEducation();
    }
  }

  /// Removes an education record.
  void removeEducation(int index) {
    final list = [...state.education];
    if (index < list.length) {
      list.removeAt(index);
      state = state.copyWith(education: list);
      _autoSaveEducation();
    }
  }

  // ── Navigation ──

  /// Advances to the next step, saving the current step's data.
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

  /// Goes back to the previous step.
  void previousStep() {
    final steps = WizardStep.values;
    final currentIndex = steps.indexOf(state.currentStep);
    if (currentIndex > 0) {
      state = state.copyWith(currentStep: steps[currentIndex - 1]);
    }
  }

  /// Completes the wizard — final save and activation.
  Future<void> completeWizard() async {
    await _saveCurrentStep();
    state = state.copyWith(
      completedSteps: {...state.completedSteps, WizardStep.review},
    );
  }

  // ── Auto-Save Logic ──

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

/// Provider for the wizard state notifier.
final wizardProvider = StateNotifierProvider<WizardNotifier, WizardState>((ref) {
  final notifier = WizardNotifier(ref);
  notifier.tryResume();
  return notifier;
});

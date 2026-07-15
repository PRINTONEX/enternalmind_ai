/// Riverpod providers for the Import Replica Backup screen.
///
/// Manages file selection, validation, parsing, and import state.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/import_models.dart';

/// The state of the import process.
enum ImportStep {
  selectFile,
  preview,
  importing,
}

/// Complete import state.
class ImportState {
  ImportState({
    this.currentStep = ImportStep.selectFile,
    this.selectedFilePath,
    this.selectedFileName,
    this.backupData,
    this.validationError,
    this.isLoading = false,
    this.isImporting = false,
    this.importSuccess = false,
  });

  final ImportStep currentStep;
  final String? selectedFilePath;
  final String? selectedFileName;
  final BackupData? backupData;
  final String? validationError;
  final bool isLoading;
  final bool isImporting;
  final bool importSuccess;

  ImportState copyWith({
    ImportStep? currentStep,
    String? selectedFilePath,
    String? selectedFileName,
    BackupData? backupData,
    String? validationError,
    bool? isLoading,
    bool? isImporting,
    bool? importSuccess,
  }) {
    return ImportState(
      currentStep: currentStep ?? this.currentStep,
      selectedFilePath: selectedFilePath ?? this.selectedFilePath,
      selectedFileName: selectedFileName ?? this.selectedFileName,
      backupData: backupData ?? this.backupData,
      validationError: validationError ?? this.validationError,
      isLoading: isLoading ?? this.isLoading,
      isImporting: isImporting ?? this.isImporting,
      importSuccess: importSuccess ?? this.importSuccess,
    );
  }
}

/// Notifier for the Import Replica Backup screen.
class ImportNotifier extends StateNotifier<ImportState> {
  ImportNotifier() : super(ImportState());

  /// Sets the loading state for async operations like file reading.
  void setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  /// Sets the selected file and validates it.
  Future<void> selectFile(String filePath, String fileName, String contents) async {
    state = state.copyWith(
      isLoading: true,
      selectedFilePath: filePath,
      selectedFileName: fileName,
      validationError: null,
      backupData: null,
    );

    // Validate JSON
    final result = BackupJsonParser.validate(contents);
    if (!result.isValid) {
      state = state.copyWith(
        isLoading: false,
        validationError: result.errorMessage,
      );
      return;
    }

    // Parse and compute preview
    try {
      final data = BackupJsonParser.parse(contents);
      state = state.copyWith(
        isLoading: false,
        backupData: data,
        currentStep: ImportStep.preview,
        validationError: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        validationError:
            'Failed to parse backup data: ${e.toString().replaceFirst('Exception: ', '')}',
      );
    }
  }

  /// Clears the selected file and resets state.
  void clearFile() {
    state = ImportState();
  }

  /// Dismisses the validation error.
  void dismissError() {
    state = state.copyWith(validationError: null);
  }

  /// Starts the import process.
  Future<void> startImport() async {
    state = state.copyWith(
      currentStep: ImportStep.importing,
      isImporting: true,
    );
    // In Phase 2, this would write parsed data to Drift.
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(
      isImporting: false,
      importSuccess: true,
    );
  }
}

/// Provider for the import state notifier.
final importProvider = StateNotifierProvider<ImportNotifier, ImportState>((ref) {
  return ImportNotifier();
});

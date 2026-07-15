# EternalMind AI — Coding Standards

> **Version:** 2.0  
> **Language:** Dart 3.x  
> **Framework:** Flutter 3.x  
> **See also:** [PROJECT_RULES.md](./PROJECT_RULES.md), [ARCHITECTURE.md](./ARCHITECTURE.md)

---

## Dart Conventions

### Naming

| Element | Convention | Example |
|---|---|---|
| Files | `snake_case` | `profile_repository.dart` |
| Folders | `snake_case` | `family_tree_canvas.dart` |
| Classes | `PascalCase` | `class ProfileRepository` |
| Methods | `camelCase` | `getActiveProfile()` |
| Variables | `camelCase` | `final activeProfileId` |
| Constants | `camelCase` (prefer `const`) | `const maxRetries = 3` |
| Private members | Prefix `_` | `_cacheDuration` |
| Enums | `PascalCase` values `camelCase` | `enum ProviderStatus { active, inactive }` |
| Extensions | `PascalCase` on Type | `extension ContextExtensions on BuildContext` |
| Type aliases | `PascalCase` | `typedef JsonMap = Map<String, dynamic>` |

### Imports

Order (separated by blank lines):

```dart
// 1. Dart SDK
import 'dart:async';
import 'dart:io';

// 2. Flutter SDK
import 'package:flutter/material.dart';

// 3. Third-party packages (alphabetical)
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 4. Project imports (alphabetical by feature/module)
import 'package:enternalmind_ai/core/constants/app_constants.dart';
import 'package:enternalmind_ai/features/profile/domain/models/profile_model.dart';
import 'package:enternalmind_ai/features/profile/domain/providers/profile_providers.dart';

// 5. Relative imports (only for same-feature references)
import 'widgets/profile_card.dart';
```

- Prefer package imports over relative imports for cross-feature references.
- Relative imports only within the same feature directory.
- Never use `package:enternalmind_ai/...` for same-feature files.

### Formatting

- Use `dart format` with default settings (2-space indent, 80-char lines).
- All code must pass `flutter analyze --no-fatal-infos` without errors.
- Use trailing commas for all function/method parameters, constructor parameters, and collection literals.
- Use `??` and `?.` operators over explicit null checks.

### Types

- Prefer `final` over `var`.
- Prefer `const` over `final` where possible.
- Use `late final` for non-nullable fields initialized in `initState`.
- Use `Object?` or `dynamic` only when type truly cannot be known.
- Avoid `as` casting — prefer pattern matching or `is` checks.
- Use `sealed class` for union types (e.g., result types).

```dart
// Good
final result = await repository.getProfile();
if (result case Ok(value: final profile)) {
  // use profile
}

// Avoid
final result = await repository.getProfile();
final profile = result as ProfileModel; // unsafe
```

### Functions

- Keep functions small — ideally under 20 lines.
- A function should do one thing.
- Extract complex expressions into named variables.
- Prefer expression-body functions for simple getters and single-expression methods.

```dart
// Good
String get displayName => '$fullName ($nickname)';

// Good
Future<ProfileModel> getActiveProfile() async {
  final localProfile = await _localSource.getActiveProfile();
  if (localProfile == null) throw ProfileNotFoundException();
  return localProfile.toDomain();
}
```

---

## Flutter Conventions

### Widget Organization

Each widget file follows this structure:

```dart
// 1. Imports

// 2. Public widget class
class ProfileCard extends ConsumerWidget {
  const ProfileCard({super.key, required this.profile});

  final ProfileModel profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return // ... widget tree
  }
}

// 3. Private helper widgets (if needed, as separate classes, NOT nested functions)
class _ProfileAvatar extends StatelessWidget {
  // ...
}

// 4. Private extensions (file-specific only)
extension on ProfileCard {
  // ...
}
```

### Widget Rules

- Use `ConsumerWidget` or `ConsumerStatefulWidget` over `StatelessWidget`/`StatefulWidget` when using Riverpod.
- Always use `const` constructors for widgets.
- Extract widgets at logical boundaries — a file with a single giant `build()` method is a code smell.
- Layout widgets (`Row`, `Column`, `Stack`) should not contain business logic.
- Business logic lives in providers and use cases, never in widgets.

### Build Method Guidelines

```dart
@override
Widget build(BuildContext context, WidgetRef ref) {
  // 1. Watch providers at the top
  final profileAsync = ref.watch(activeProfileProvider);

  // 2. Handle loading/error states explicitly
  return profileAsync.when(
    loading: () => const ShimmerLoader(),
    error: (error, stack) => ErrorView(error: error),
    data: (profile) => _buildContent(profile),
  );
}

Widget _buildContent(ProfileModel profile) {
  // Keep build methods shallow
  return GlassCard(
    child: Column(
      children: [
        _buildHeader(profile),
        _buildStats(profile),
        _buildActions(profile),
      ],
    ),
  );
}
```

---

## File Organization Standards

### Maximum File Sizes

| File Type | Max Lines | Action if Exceeded |
|---|---|---|
| Widget file | 300 | Extract sub-widgets |
| Repository | 200 | Split into multiple repositories |
| Service | 300 | Split into multiple services |
| DAO | 200 | Split query methods into separate DAOs |
| Provider file | 150 | Split into multiple provider files |
| Model file | 100 | Keep focused; one class per file |

### One Class Per File

- With these exceptions:
  - Private helper widgets (same file as parent)
  - Small extension classes
  - Related enums (e.g., provider status enum in the same file as the model)

---

## State Management Standards

### Provider Organization

```dart
// GOOD: One provider per responsibility
final activeProfileProvider = FutureProvider<ProfileModel?>((ref) {
  return ref.watch(profileRepositoryProvider).getActiveProfile();
});

final profileListProvider = FutureProvider<List<ProfileModel>>((ref) {
  return ref.watch(profileRepositoryProvider).getAll();
});

final profileFormProvider = StateNotifierProvider<ProfileFormNotifier, ProfileFormState>((ref) {
  return ProfileFormNotifier(ref.watch(profileRepositoryProvider));
});
```

### Provider Naming

| Pattern | Example |
|---|---|
| Data provider | `activeProfileProvider` |
| List provider | `familyMembersProvider` |
| Form state provider | `profileFormProvider` |
| Action provider | `sendMessageProvider` |
| Service provider | `memoryRetrievalServiceProvider` |

### State Notifier Pattern

```dart
class ProfileFormNotifier extends StateNotifier<ProfileFormState> {
  ProfileFormNotifier(this._repository) : super(ProfileFormState.initial());

  final ProfileRepository _repository;

  Future<void> updateName(String name) async {
    state = state.copyWith(name: name, isDirty: true);
  }

  Future<void> save() async {
    state = state.copyWith(isSaving: true);
    try {
      await _repository.save(state.toModel());
      state = state.copyWith(isSaving: false, isSaved: true);
    } catch (e) {
      state = state.copyWith(isSaving: false, error: e.toString());
    }
  }
}
```

---

## Error Handling Standards

### App Exception Hierarchy

```dart
sealed class AppException implements Exception {
  final String message;
  final String? code;
  AppException(this.message, {this.code});
}

class DatabaseException extends AppException {
  DatabaseException(super.message, {super.code});
}

class NetworkException extends AppException {
  final int? statusCode;
  NetworkException(super.message, {this.statusCode, super.code});
}

class ProviderException extends AppException {
  final String providerName;
  ProviderException(super.message, this.providerName, {super.code});
}

class ValidationException extends AppException {
  final Map<String, String> fieldErrors;
  ValidationException(super.message, this.fieldErrors, {super.code});
}
```

### Error Handling Pattern

```dart
// In repositories
Future<ProfileModel> getProfile(int id) async {
  try {
    final daoResult = await _dao.getProfile(id);
    if (daoResult == null) {
      throw DatabaseException('Profile not found', code: 'PROFILE_NOT_FOUND');
    }
    return daoResult.toDomain();
  } on DatabaseException {
    rethrow;
  } catch (e, stack) {
    logger.error('Unexpected error fetching profile', error: e, stack: stack);
    throw DatabaseException('Failed to load profile: ${e.toString()}');
  }
}
```

---

## Logging Standards

### Logger API

```dart
class AppLogger {
  void debug(String message, {Object? error, StackTrace? stack, Map<String, dynamic>? extra});
  void info(String message, {Object? error, StackTrace? stack, Map<String, dynamic>? extra});
  void warning(String message, {Object? error, StackTrace? stack, Map<String, dynamic>? extra});
  void error(String message, {Object? error, StackTrace? stack, Map<String, dynamic>? extra});
}
```

### Logging Rules

- Use `logger.info` for significant state changes (profile created, provider switched).
- Use `logger.debug` during development only — strip before release build.
- Use `logger.warning` for recoverable errors (retry attempts, provider latency).
- Use `logger.error` for unrecoverable errors (database corruption, API failures).
- Never log API keys, tokens, or personal user data.
- Include `humanId` in log context when available.

### Log Levels

| Level | Usage | Example |
|---|---|---|
| `debug` | Development only | `'Memory search returned $count results'` |
| `info` | Normal operations | `'Provider switched from Groq to Gemini'` |
| `warning` | Recoverable issues | `'Provider Groq timeout on attempt 2, retrying'` |
| `error` | Unrecoverable | `'Database migration failed: $error'` |

---

## Performance Guidelines

### Database Performance

- Always use DAO methods with specific queries — never `SELECT *` unless all fields are needed.
- Use `LIMIT` and `OFFSET` for pagination.
- Prefer `watch()` (reactive) over `get()` (one-shot) only when UI needs live updates.
- Use batch operations for bulk inserts.
- Add database indexes for all `WHERE`, `ORDER BY`, and `JOIN` columns.

### UI Performance

- Use `ListView.builder` (not `ListView(children: ...)`) for dynamic lists.
- Use `const` constructors wherever possible.
- Use `RepaintBoundary` for complex animated widgets.
- Avoid `Opacity` widgets in animated stacks — use `AnimatedOpacity`.
- Avoid rebuilding entire widget trees — use `select()` on providers.

```dart
// GOOD: Only rebuilds when fullName changes
final name = ref.watch(activeProfileProvider.select((p) => p?.fullName));
```

### Image Performance

- Cache images locally with `cached_network_image` (future).
- Generate thumbnails for photos (max 200×200 for list views).
- Use `ImageCache` with a reasonable limit (default 1000px, 100 entries).
- Prefer `Image.file` for local images over `Image.asset` for user content.

### Compute-Intensive Operations

- Run heavy computations in isolates:
  - Embedding generation
  - Image processing
  - Voice file processing
  - Large JSON import/export parsing
- Use `Isolate.run()` or `compute()` utility.
- Never block the main isolate for more than 16ms.

---

## Documentation Standards

### Code Documentation

```dart
/// Active profile for the current session.
///
/// Returns `null` when no profile exists.
/// Automatically switches when user changes active profile.
///
/// See [ProfileRepository] for persistence details.
final activeProfileProvider = FutureProvider<ProfileModel?>((ref) {
  // ...
});
```

### Documentation Rules

- All public API (classes, methods, providers, top-level functions) must have doc comments.
- Doc comments explain **why**, not **what**.
- Use `///` (triple slash) for Dart doc comments — not `/* */`.
- Include `See [OtherClass]` references for related APIs.
- Include code examples in doc comments for non-obvious usage.
- Document all constructor parameters with `[paramName]` references.
- Use `{@template}` and `{@endtemplate}` for reusable documentation snippets.

### File Headers

Optional — not required for every file, but useful for complex files:

```dart
/// {@template profile_repository}
/// Repository for managing [ProfileModel] persistence.
///
/// Coordinates between [ProfileLocalSource] (Drift) and secure storage.
/// Returns domain models, never raw DAO objects.
/// {@endtemplate}
```

---

## Testing Standards

### Test Organization

```
test/
├── features/
│   ├── profile/
│   │   ├── data/
│   │   │   └── repositories/
│   │   │       └── profile_repository_test.dart
│   │   ├── domain/
│   │   │   ├── models/
│   │   │   │   └── profile_model_test.dart
│   │   │   └── usecases/
│   │   │       └── create_profile_test.dart
│   │   └── presentation/
│   │       └── profile_wizard_test.dart
│   ├── chat/
│   ├── memory/
│   └── ...
├── core/
│   ├── theme/
│   └── widgets/
└── database/
    └── daos/
```

### Naming

- Test files mirror source files with `_test.dart` suffix.
- Test descriptions use present tense: `'returns null when no profile exists'`.
- Test groups use the class/method name: `group('ProfileRepository.getActiveProfile', ...)`.

### Coverage

| Layer | Coverage Target |
|---|---|
| Domain models | 100% |
| Use cases | 100% |
| Repositories | 100% (with mocked datasources) |
| Providers | 100% |
| Services | 100% |
| Widgets | 80% (integration tests for complex widgets) |
| DAOs | 100% (with in-memory Drift) |
| Screens | Integration tests only |

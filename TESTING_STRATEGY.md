# EternalMind AI — Testing Strategy

> **Version:** 1.0  
> **Stack:** Flutter 3.x, Dart 3.x, Riverpod, Drift (SQLite), Hive, flutter_secure_storage  
> **Architecture:** Clean Architecture + Feature-First Organization  
> **See also:** [CODING_STANDARDS.md](./CODING_STANDARDS.md), [ARCHITECTURE.md](./ARCHITECTURE.md), [PROJECT_RULES.md](./PROJECT_RULES.md)

---

## Table of Contents

1. [Testing Philosophy](#1-testing-philosophy)
2. [Test Pyramid](#2-test-pyramid)
3. [Dependencies & Setup](#3-dependencies--setup)
4. [Unit Testing](#4-unit-testing)
5. [DAO Testing with In-Memory Drift](#5-dao-testing-with-in-memory-drift)
6. [Riverpod Provider Testing](#6-riverpod-provider-testing)
7. [Repository & Use Case Testing](#7-repository--use-case-testing)
8. [Widget Testing](#8-widget-testing)
9. [Integration Testing](#9-integration-testing)
10. [Mocking Strategy](#10-mocking-strategy)
11. [Test Organization](#11-test-organization)
12. [Test Coverage Targets](#12-test-coverage-targets)
13. [CI Pipeline Recommendations](#13-ci-pipeline-recommendations)
14. [Flaky Test Prevention](#14-flaky-test-prevention)
15. [Appendix: Cheat Sheets](#15-appendix-cheat-sheets)

---

## 1. Testing Philosophy

### Core Principles

| Principle | Description |
|---|---|
| **Test behavior, not implementation** | Assert on outputs and side effects, not internal calls. Refactoring should not break tests. |
| **Isolate by layer** | Unit tests for domain logic, in-memory DAOs for data layer, mocked providers for widgets. |
| **One assertion story per test** | Each test verifies one logical fact. Use multiple `expect` calls only when they test the same behavior. |
| **Realistic data** | Use factory constructors and fakes that mirror real data shapes, not generic mocks. |
| **Deterministic** | Tests must produce the same result every run — no randomness, no wall-clock dependencies. |
| **Fast** | Unit tests < 10ms each. Provider tests < 50ms. Widget tests < 200ms. DAO tests < 100ms. |

### What to Test vs. What Not to Test

| ✅ Test | ❌ Don't Test |
|---|---|
| Domain models (equality, serialization, validation) | Generated code (`.g.dart` files) |
| Use cases (orchestration logic, error handling) | Flutter framework internals    |
| Repository methods (with mocked datasources) | Third-party package internals |
| Riverpod providers (state changes, invalidations) | Plain data classes with no logic |
| DAOs (CRUD, queries, filtering) with in-memory DB | Simple getters / setters |
| Widget rendering (structural tests) | Trivial const constructors |
| Error paths (exceptions, nulls, edge cases) | Code path that is "obviously correct" |
| Service orchestration (composing multiple repos) | UI pixel-perfect matching (use golden tests sparingly) |

---

## 2. Test Pyramid

```
        ╱╲
       ╱  ╲          Integration / E2E
      ╱    ╲         (smoke tests, full flows)
     ╱━━━━━━╲
    ╱        ╲       Widget Tests
   ╱          ╲      (presentation layer, screen composition)
  ╱━━━━━━━━━━━━╲
 ╱              ╲    Provider + Service + Repository Tests
╱                ╲   (state management, business logic orchestration)
╱━━━━━━━━━━━━━━━━━━╲
╱                    ╲  Unit Tests + DAO Tests
╱                      ╲ (models, use cases, validators, in-memory DAO)
```

| Layer | Count (Target) | Speed | Dependencies |
|---|---|---|---|
| Unit + DAO | 70% | < 10ms each | None (or in-memory DB) |
| Provider + Service + Repository | 20% | < 100ms each | Mocked datasources |
| Widget | 8% | < 500ms each | Mocked providers |
| Integration / E2E | 2% | < 30s each | Full app scaffold |

---

## 3. Dependencies & Setup

### Required `pubspec.yaml` Dev Dependencies

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter

  # ── Mocking ──
  mocktail: ^1.0.4                # Lightweight mocking (no code gen)
  # OR: mockito: ^5.4.4 + build_runner (if you prefer annotations)

  # ── Testing Utilities ──
  riverpod: ^2.6.1                # For ProviderContainer in tests
  flutter_riverpod: ^2.6.1

  # ── Drift Testing ──
  drift: ^2.23.0                  # Needed for NativeDatabase.memory()
  sqlite3: ^2.4.6                 # Required by drift for in-memory DB
  sqlite3_flutter_libs: ^0.5.0    # Platform-specific SQLite binaries (test config)

  # ── Code Quality ──
  flutter_lints: ^6.0.0

  # ── Coverage ──
  # Run: flutter test --coverage
  # View: genhtml coverage/lcov.info -o coverage/html

  # ── Optional but Recommended ──
  # golden_toolkit: ^0.15.0       # Golden image testing (for design system)
  # integration_test:              # Flutter SDK — for full E2E tests
  #   sdk: flutter
```

### Installation Command

```bash
flutter pub add --dev mocktail drift sqlite3
# Note: riverpod and flutter_riverpod are likely already in main deps
# If not: flutter pub add flutter_riverpod riverpod
```

### Test File Template

Create a helper file at `test/helpers/test_setup.dart`:

```dart
/// Centralized test helpers for EternalMind AI.
///
/// Usage:
/// ```dart
/// import 'package:enternalmind_ai/test/helpers/test_setup.dart';
/// ```
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ── Re-exports ──
export 'package:flutter_test/flutter_test.dart';
export 'package:mocktail/mocktail.dart';

// ── Mock Generators ──
// Add mock class definitions here or use a dedicated mocks file
```

---

## 4. Unit Testing

### 4.1 Domain Models

Domain models are pure Dart — no framework dependencies. They are the easiest and most important things to test.

```dart
// test/features/profile/domain/models/profile_model_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:enternalmind_ai/features/profile/domain/models/profile_model.dart';

void main() {
  group('ProfileModel', () {
    final tProfile = ProfileModel(
      id: 1,
      fullName: 'John Doe',
      nickname: 'Johnny',
      birthDate: DateTime(1990, 1, 1),
      // ... other fields
    );

    group('constructor', () {
      test('creates instance with required fields', () {
        expect(tProfile.id, 1);
        expect(tProfile.fullName, 'John Doe');
        expect(tProfile.nickname, 'Johnny');
      });

      test('sets createdAt and updatedAt to now when not provided', () {
        final profile = ProfileModel(fullName: 'Test');
        expect(profile.createdAt, isNotNull);
        expect(profile.updatedAt, isNotNull);
      });
    });

    group('copyWith', () {
      test('returns same instance when no arguments are given', () {
        expect(tProfile.copyWith(), tProfile);
      });

      test('updates only the provided fields', () {
        final updated = tProfile.copyWith(fullName: 'Jane Doe');
        expect(updated.fullName, 'Jane Doe');
        expect(updated.nickname, 'Johnny'); // unchanged
        expect(updated.id, 1);               // unchanged
      });
    });

    group('equality', () {
      test('two identical profiles are equal', () {
        final a = ProfileModel(id: 1, fullName: 'A');
        final b = ProfileModel(id: 1, fullName: 'A');
        expect(a, equals(b));
      });

      test('profiles with different IDs are not equal', () {
        final a = ProfileModel(id: 1, fullName: 'A');
        final b = ProfileModel(id: 2, fullName: 'A');
        expect(a, isNot(equals(b)));
      });
    });
  });
}
```

### 4.2 Use Cases

Use cases have a single `call()` method and depend on repository abstractions. Test them by mocking the repository.

```dart
// test/features/profile/domain/usecases/create_profile_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:enternalmind_ai/features/profile/domain/models/profile_model.dart';
import 'package:enternalmind_ai/features/profile/domain/usecases/create_profile.dart';
import 'package:enternalmind_ai/features/profile/data/repositories/profile_repository.dart';

// ── Mock ──
class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  late CreateProfile useCase;
  late MockProfileRepository mockRepository;

  setUp(() {
    mockRepository = MockProfileRepository();
    useCase = CreateProfile(mockRepository);
  });

  final tProfile = ProfileModel(fullName: 'Test User');

  group('CreateProfile', () {
    test('should call repository.save and return the profile', () async {
      // Arrange
      when(() => mockRepository.save(any()))
          .thenAnswer((_) async => tProfile.copyWith(id: 1));

      // Act
      final result = await useCase(tProfile);

      // Assert
      expect(result.id, isNotNull);
      verify(() => mockRepository.save(any())).called(1);
    });

    test('should throw when repository throws', () async {
      // Arrange
      when(() => mockRepository.save(any()))
          .thenThrow(Exception('DB error'));

      // Act & Assert
      expect(() => useCase(tProfile), throwsA(isA<Exception>()));
    });

    test('should propagate the exact error message', () async {
      // Arrange
      when(() => mockRepository.save(any()))
          .thenThrow(Exception('DB error'));

      // Act & Assert
      expect(
        () => useCase(tProfile),
        throwsA(predicate<Exception>((e) => e.toString().contains('DB error'))),
      );
    });
  });
}
```

### 4.3 Validators & Pure Functions

```dart
// test/core/utils/validators_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:enternalmind_ai/core/utils/validators.dart';

void main() {
  group('Validators', () {
    group('validateEmail', () {
      test('returns null for valid email', () {
        expect(Validators.email('user@example.com'), isNull);
        expect(Validators.email('test+label@domain.co'), isNull);
      });

      test('returns error message for invalid email', () {
        expect(Validators.email(''), isNotNull);
        expect(Validators.email('not-an-email'), isNotNull);
        expect(Validators.email('@domain.com'), isNotNull);
      });
    });

    group('validateNotEmpty', () {
      test('returns null for non-empty string', () {
        expect(Validators.notEmpty('hello'), isNull);
      });

      test('returns error for empty string', () {
        expect(Validators.notEmpty(''), isNotNull);
        expect(Validators.notEmpty('   '), isNotNull);
      });

      test('returns error for null', () {
        expect(Validators.notEmpty(null), isNotNull);
      });
    });
  });
}
```

---

## 5. DAO Testing with In-Memory Drift

This is the most critical testing pattern for this project. Drift supports in-memory SQLite databases, allowing DAOs to be tested without platform dependencies or file I/O.

### 5.1 In-Memory Database Setup

```dart
// test/helpers/database_test_helper.dart

import 'package:drift/drift.dart';
import 'package:enternalmind_ai/database/app_database.dart';
import 'package:enternalmind_ai/database/tables/humans_table.dart' as tables;

/// Creates an in-memory [AppDatabase] for testing.
///
/// Each call returns a fresh database. Call `.close()` in `tearDown`.
Future<AppDatabase> createTestDatabase() async {
  final database = AppDatabase(
    QueryExecutor.memory(),
    // If AppDatabase uses LazyDatabase, you may need to adjust the
    // constructor to accept a QueryExecutor for testability.
    //
    // Recommended approach: make AppDatabase accept an optional
    // QueryExecutor parameter, defaulting to LazyDatabase in production.
  );
  return database;
}
```

### 5.2 Making `AppDatabase` Testable

The production `AppDatabase` likely uses `LazyDatabase`. To make it testable, add an optional `QueryExecutor` parameter:

```dart
// lib/database/app_database.dart (modification)

class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? _createExecutor());

  static QueryExecutor _createExecutor() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'enternalmind.sqlite'));
      return NativeDatabase(file);
    });
  }
}
```

### 5.3 DAO Test Example

```dart
// test/database/daos/human_dao_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:drift/drift.dart';
import 'package:enternalmind_ai/database/app_database.dart';
import 'package:enternalmind_ai/database/daos/human_dao.dart';

void main() {
  late AppDatabase database;
  late HumanDao dao;

  setUp(() async {
    database = AppDatabase(QueryExecutor.memory());
    dao = HumanDao(database);
  });

  tearDown(() async {
    await database.close();
  });

  group('HumanDao', () {
    final tHuman = HumansCompanion(
      fullName: Value('John Doe'),
      nickname: Value('Johnny'),
      birthDate: Value(DateTime(1990, 1, 1)),
      // ... other required fields with Value() wrappers
    );

    group('insert', () {
      test('returns the inserted id', () async {
        final id = await dao.insertHuman(tHuman);
        expect(id, isPositive);
      });

      test('persists the data correctly', () async {
        final id = await dao.insertHuman(tHuman);
        final fetched = await dao.getHuman(id);
        expect(fetched, isNotNull);
        expect(fetched!.fullName, 'John Doe');
        expect(fetched.nickname, 'Johnny');
      });

      test('auto-generates createdAt and updatedAt', () async {
        final id = await dao.insertHuman(tHuman);
        final fetched = await dao.getHuman(id);
        expect(fetched!.createdAt, isNotNull);
        expect(fetched.updatedAt, isNotNull);
      });
    });

    group('getAll', () {
      test('returns empty list when no humans exist', () async {
        final humans = await dao.getAllHumans();
        expect(humans, isEmpty);
      });

      test('returns all inserted humans', () async {
        await dao.insertHuman(tHuman);
        await dao.insertHuman(tHuman.copyWith(
          fullName: Value('Jane Doe'),
          nickname: Value('Janey'),
        ));

        final humans = await dao.getAllHumans();
        expect(humans, hasLength(2));
      });
    });

    group('update', () {
      test('updates fields correctly', () async {
        final id = await dao.insertHuman(tHuman);
        await dao.updateHuman(
          id,
          tHuman.copyWith(fullName: Value('Updated Name')),
        );

        final fetched = await dao.getHuman(id);
        expect(fetched!.fullName, 'Updated Name');
        expect(fetched.nickname, 'Johnny'); // unchanged
      });
    });

    group('delete', () {
      test('removes the human from the database', () async {
        final id = await dao.insertHuman(tHuman);
        await dao.deleteHuman(id);

        final fetched = await dao.getHuman(id);
        expect(fetched, isNull);
      });

      test('cascade deletes related data', () async {
        // Insert human + related family member
        final humanId = await dao.insertHuman(tHuman);
        // ... insert family member with humanId
        // ... delete human
        // ... assert family member is also deleted
      });
    });

    group('query methods', () {
      test('finds humans by name search', () async {
        await dao.insertHuman(tHuman);
        await dao.insertHuman(tHuman.copyWith(
          fullName: Value('Jane Smith'),
        ));

        final results = await dao.searchHumans('Doe');
        expect(results, hasLength(1));
        expect(results.first.fullName, 'John Doe');
      });

      test('returns empty list for non-matching search', () async {
        await dao.insertHuman(tHuman);
        final results = await dao.searchHumans('NonExistent');
        expect(results, isEmpty);
      });
    });
  });
}
```

### 5.4 Testing Foreign Keys & Cascade Deletes

```dart
group('cascade delete', () {
  test('deleting a human removes all related family members', () async {
    // Insert human
    final humanId = await dao.insertHuman(tHuman);

    // Insert family member (requires a FamilyDao)
    final familyDao = FamilyDao(database);
    await familyDao.insertFamilyMember(
      FamilyMembersCompanion(
        humanId: Value(humanId),
        name: Value('Jane Doe'),
        relationship: Value('Spouse'),
      ),
    );

    // Verify family member exists
    var members = await familyDao.getFamilyMembers(humanId);
    expect(members, hasLength(1));

    // Delete human (cascade should remove family members)
    await dao.deleteHuman(humanId);

    // Verify family member is gone
    members = await familyDao.getFamilyMembers(humanId);
    expect(members, isEmpty);
  });
});
```

### 5.5 Testing Complex Queries (JOINs, Aggregates)

```dart
group('complex queries', () {
  test('dashboard stats aggregate correctly', () async {
    // Insert test data across multiple tables
    // ...

    // Query the aggregate view
    final stats = await dao.getDashboardStats(humanId);

    expect(stats.familyCount, 3);
    expect(stats.storyCount, 5);
    expect(stats.journalCount, 10);
  });

  test('timeline filter by year', () async {
    // Insert entries with different years
    // ...

    final results = await timelineDao.getByYear(2024);
    expect(results, hasLength(2));
    expect(results.every((e) => e.year == 2024), isTrue);
  });
});
```

### 5.6 Migration Testing

```dart
group('schema migrations', () {
  test('migration from version 1 to 2 preserves data', () async {
    // Create schema v1 manually
    // Insert data using v1 schema
    // Run migration to v2
    // Verify data integrity
  });
});
```

---

## 6. Riverpod Provider Testing

Riverpod providers are tested using `ProviderContainer` — no widget tree required. This makes them fast and isolated.

### 6.1 Basic Provider Test Setup

```dart
// test/features/profile/domain/providers/profile_providers_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:enternalmind_ai/features/profile/domain/models/profile_model.dart';
import 'package:enternalmind_ai/features/profile/domain/providers/profile_providers.dart';
import 'package:enternalmind_ai/features/profile/data/repositories/profile_repository.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  late MockProfileRepository mockRepository;
  late ProviderContainer container;

  setUp(() {
    mockRepository = MockProfileRepository();

    container = ProviderContainer(
      overrides: [
        // Override the repository provider with our mock
        profileRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  // ... tests
}
```

### 6.2 Testing `FutureProvider`

```dart
group('activeProfileProvider', () {
  test('returns profile when repository succeeds', () async {
    // Arrange
    final tProfile = ProfileModel(id: 1, fullName: 'John');
    when(() => mockRepository.getActiveProfile())
        .thenAnswer((_) async => tProfile);

    // Act
    final result = container.read(activeProfileProvider);

    // Assert — use expectLater for async providers
    expectLater(
      result,
      completion(equals(tProfile)),
    );
  });

  test('returns null when no active profile exists', () async {
    // Arrange
    when(() => mockRepository.getActiveProfile())
        .thenAnswer((_) async => null);

    // Act
    final result = container.read(activeProfileProvider);

    // Assert
    expectLater(result, completion(isNull));
  });

  test('throws when repository throws', () async {
    // Arrange
    when(() => mockRepository.getActiveProfile())
        .thenThrow(Exception('DB error'));

    // Act
    final result = container.read(activeProfileProvider);

    // Assert
    expectLater(result, throwsA(isA<Exception>()));
  });
});
```

### 6.3 Testing `StateNotifierProvider`

```dart
group('profileFormProvider', () {
  test('initial state is correct', () {
    final state = container.read(profileFormProvider);
    expect(state.name, '');
    expect(state.isDirty, false);
    expect(state.isSaving, false);
    expect(state.error, isNull);
  });

  test('updateName sets name and marks dirty', () {
    container.read(profileFormProvider.notifier).updateName('John');
    
    final state = container.read(profileFormProvider);
    expect(state.name, 'John');
    expect(state.isDirty, true);
  });

  test('save calls repository and updates state on success', () async {
    // Arrange
    when(() => mockRepository.save(any()))
        .thenAnswer((_) async => ProfileModel(id: 1, fullName: 'John'));

    // Act
    container.read(profileFormProvider.notifier).updateName('John');
    await container.read(profileFormProvider.notifier).save();

    // Assert
    final state = container.read(profileFormProvider);
    expect(state.isSaving, false);
    expect(state.isSaved, true);
    expect(state.error, isNull);
    verify(() => mockRepository.save(any())).called(1);
  });

  test('save sets error state on failure', () async {
    // Arrange
    when(() => mockRepository.save(any()))
        .thenThrow(Exception('Validation failed'));

    // Act
    container.read(profileFormProvider.notifier).updateName('John');
    await container.read(profileFormProvider.notifier).save();

    // Assert
    final state = container.read(profileFormProvider);
    expect(state.isSaving, false);
    expect(state.isSaved, false);
    expect(state.error, contains('Validation failed'));
  });
});
```

### 6.4 Testing Provider Invalidations

```dart
group('provider invalidation', () {
  test('invalidation refetches data', () async {
    // Arrange
    when(() => mockRepository.getActiveProfile())
        .thenAnswer((_) async => ProfileModel(id: 1, fullName: 'John'));

    // First read
    final first = await container.read(activeProfileProvider.future);
    expect(first!.fullName, 'John');

    // Change repository behavior
    when(() => mockRepository.getActiveProfile())
        .thenAnswer((_) async => ProfileModel(id: 1, fullName: 'Jane'));

    // Invalidate
    container.invalidate(activeProfileProvider);

    // Second read should return new data
    final second = await container.read(activeProfileProvider.future);
    expect(second!.fullName, 'Jane');
  });
});
```

### 6.5 Testing Providers with Dependencies

```dart
group('chatProvider with memory dependency', () {
  test('sendMessage triggers memory search before AI call', () async {
    // Arrange — mock multiple repositories
    when(() => mockChatRepo.saveMessage(any())).thenAnswer((_) async => 1);
    when(() => mockMemoryRepo.search(any())).thenAnswer((_) async => []);
    when(() => mockProviderManager.sendStream(any()))
        .thenAnswer((_) => const Stream.empty());

    // Act
    await container.read(chatProvider.notifier).sendMessage('Hello');

    // Assert — memory search was called before AI
    verify(() => mockMemoryRepo.search(any())).called(1);
    verify(() => mockProviderManager.sendStream(any())).called(1);
  });
});
```

### 6.6 Testing Streaming Providers

```dart
group('chatStreamProvider', () {
  test('emits tokens in order', () async {
    // Arrange
    when(() => mockProviderManager.sendStream(any()))
        .thenAnswer((_) => Stream.fromIterable(['Hello', ' ', 'World']));

    // Act
    final stream = container.read(chatStreamProvider.stream);
    final tokens = await stream.toList();

    // Assert
    expect(tokens, ['Hello', ' ', 'World']);
  });

  test('completes after all tokens are emitted', () async {
    // Arrange
    when(() => mockProviderManager.sendStream(any()))
        .thenAnswer((_) => Stream.fromIterable(['Done']));

    // Act & Assert
    await expectLater(
      container.read(chatStreamProvider.stream),
      emitsInOrder(['Done', emitsDone]),
    );
  });

  test('emits error and continues', () async {
    // Arrange
    when(() => mockProviderManager.sendStream(any()))
        .thenAnswer((_) => Stream.error(Exception('API error')));

    // Act & Assert
    expectLater(
      container.read(chatStreamProvider.stream),
      emitsError(isA<Exception>()),
    );
  });
});
```

---

## 7. Repository & Use Case Testing

### 7.1 Repository Tests

Repositories coordinate between datasources. Test them by mocking the datasources.

```dart
// test/features/profile/data/repositories/profile_repository_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:enternalmind_ai/features/profile/data/repositories/profile_repository.dart';
import 'package:enternalmind_ai/features/profile/data/datasources/profile_local_source.dart';

class MockProfileLocalSource extends Mock implements ProfileLocalSource {}

void main() {
  late ProfileRepository repository;
  late MockProfileLocalSource mockLocalSource;

  setUp(() {
    mockLocalSource = MockProfileLocalSource();
    repository = ProfileRepository(mockLocalSource);
  });

  group('ProfileRepository', () {
    group('save', () {
      test('calls localSource.insert and returns model with id', () async {
        // Arrange
        final model = ProfileModel(fullName: 'John');
        when(() => mockLocalSource.insert(any()))
            .thenAnswer((_) async => 1);

        // Act
        final result = await repository.save(model);

        // Assert
        expect(result.id, 1);
        expect(result.fullName, 'John');
        verify(() => mockLocalSource.insert(any())).called(1);
      });

      test('wraps datasource exception into AppException', () async {
        // Arrange
        when(() => mockLocalSource.insert(any()))
            .thenThrow(DatabaseException('Insert failed'));

        // Act & Assert
        expect(
          () => repository.save(ProfileModel(fullName: 'John')),
          throwsA(isA<AppException>()),
        );
      });
    });

    group('getActiveProfile', () {
      test('returns profile mapped to domain model', () async {
        // Arrange
        final daoProfile = ProfileModel(
          id: 1,
          fullName: 'John',
          // ... DAO may return a different model type
        );
        when(() => mockLocalSource.getActiveProfile())
            .thenAnswer((_) async => daoProfile);

        // Act
        final result = await repository.getActiveProfile();

        // Assert
        expect(result, isNotNull);
        expect(result!.id, 1);
        expect(result.fullName, 'John');
      });

      test('returns null when no active profile', () async {
        // Arrange
        when(() => mockLocalSource.getActiveProfile())
            .thenAnswer((_) async => null);

        // Act
        final result = await repository.getActiveProfile();

        // Assert
        expect(result, isNull);
      });
    });
  });
}
```

### 7.2 Service Tests

Services orchestrate multiple repositories. Test them the same way — mock everything except the service under test.

```dart
// test/features/memory/domain/services/memory_retrieval_service_test.dart

void main() {
  late MemoryRetrievalService service;
  late MockStoryRepository mockStoryRepo;
  late MockJournalRepository mockJournalRepo;
  late MockTimelineRepository mockTimelineRepo;

  setUp(() {
    mockStoryRepo = MockStoryRepository();
    mockJournalRepo = MockJournalRepository();
    mockTimelineRepo = MockTimelineRepository();
    service = MemoryRetrievalService(
      storyRepo: mockStoryRepo,
      journalRepo: mockJournalRepo,
      timelineRepo: mockTimelineRepo,
    );
  });

  group('search', () {
    test('aggregates results from all memory sources', () async {
      // Arrange
      when(() => mockStoryRepo.search(any())).thenAnswer((_) async => [story1]);
      when(() => mockJournalRepo.search(any())).thenAnswer((_) async => [journal1]);
      when(() => mockTimelineRepo.search(any())).thenAnswer((_) async => [timeline1]);

      // Act
      final results = await service.search(humanId: 1, query: 'test');

      // Assert
      expect(results, hasLength(3));
    });

    test('handles one source throwing without failing the whole search', () async {
      // Arrange
      when(() => mockStoryRepo.search(any())).thenThrow(Exception('DB error'));
      when(() => mockJournalRepo.search(any())).thenAnswer((_) async => [journal1]);
      when(() => mockTimelineRepo.search(any())).thenAnswer((_) async => [timeline1]);

      // Act
      final results = await service.search(humanId: 1, query: 'test');

      // Assert — should still return results from other sources
      expect(results, hasLength(2));
    });

    test('returns empty list when all sources throw', () async {
      // Arrange
      when(() => mockStoryRepo.search(any())).thenThrow(Exception('err'));
      when(() => mockJournalRepo.search(any())).thenThrow(Exception('err'));
      when(() => mockTimelineRepo.search(any())).thenThrow(Exception('err'));

      // Act
      final results = await service.search(humanId: 1, query: 'test');

      // Assert
      expect(results, isEmpty);
    });

    test('ranks results by relevance score', () async {
      // Arrange
      when(() => mockStoryRepo.search(any())).thenAnswer((_) async => [
        MemoryResult(score: 0.5, ...),
        MemoryResult(score: 0.9, ...),
      ]);

      // Act
      final results = await service.search(humanId: 1, query: 'test');

      // Assert — highest score first
      expect(results.first.score, greaterThan(results.last.score));
    });
  });
}
```

---

## 8. Widget Testing

### 8.1 Widget Test with Mocked Providers

Widgets consume providers. Override them in `ProviderScope` within the test.

```dart
// test/features/profile/presentation/widgets/profile_card_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:enternalmind_ai/features/profile/domain/models/profile_model.dart';
import 'package:enternalmind_ai/features/profile/presentation/widgets/profile_card.dart';

void main() {
  group('ProfileCard', () {
    final tProfile = ProfileModel(
      id: 1,
      fullName: 'John Doe',
      nickname: 'Johnny',
      photoPath: null, // no photo
      about: 'A test user',
    );

    Widget createTestWidget({ProfileModel? profile}) {
      return ProviderScope(
        overrides: [
          // Override any relevant providers here
        ],
        child: MaterialApp(
          home: Scaffold(
            body: ProfileCard(profile: profile ?? tProfile),
          ),
        ),
      );
    }

    testWidgets('displays full name and nickname', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('Johnny'), findsOneWidget);
    });

    testWidgets('shows default avatar when photoPath is null', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byIcon(Icons.person), findsOneWidget);
    });

    testWidgets('tapping navigates to profile detail', (tester) async {
      await tester.pumpWidget(createTestWidget());

      await tester.tap(find.byType(ProfileCard));
      await tester.pumpAndSettle();

      // Verify navigation occurred
      // expect(find.byType(ProfileDetailScreen), findsOneWidget);
    });
  });
}
```

### 8.2 Testing Widget State from Async Providers

```dart
// test/features/profile/presentation/profile_list_screen_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:enternalmind_ai/features/profile/domain/models/profile_model.dart';
import 'package:enternalmind_ai/features/profile/domain/providers/profile_providers.dart';
import 'package:enternalmind_ai/features/profile/presentation/profile_list_screen.dart';

void main() {
  group('ProfileListScreen', () {
    testWidgets('shows loading indicator while fetching profiles', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            profileListProvider.overrideWith(
              (_) => FutureProvider<List<ProfileModel>>((ref) async {
                // Never completes — simulates loading
                return await Future.delayed(const Duration(hours: 1), () => []);
              }),
            ),
          ],
          child: const MaterialApp(home: ProfileListScreen()),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays list of profiles when data is loaded', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            profileListProvider.overrideWith(
              (_) => FutureProvider<List<ProfileModel>>((ref) async => [
                ProfileModel(id: 1, fullName: 'John'),
                ProfileModel(id: 2, fullName: 'Jane'),
              ]),
            ),
          ],
          child: const MaterialApp(home: ProfileListScreen()),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('John'), findsOneWidget);
      expect(find.text('Jane'), findsOneWidget);
    });

    testWidgets('shows empty state when no profiles exist', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            profileListProvider.overrideWith(
              (_) => FutureProvider<List<ProfileModel>>((ref) async => []),
            ),
          ],
          child: const MaterialApp(home: ProfileListScreen()),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Create your first profile'), findsOneWidget);
    });

    testWidgets('shows error state when provider throws', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            profileListProvider.overrideWith(
              (_) => FutureProvider<List<ProfileModel>>((ref) async {
                throw Exception('Failed to load');
              }),
            ),
          ],
          child: const MaterialApp(home: ProfileListScreen()),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Failed to load profiles'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });
  });
}
```

### 8.3 Form Widget Testing

```dart
// test/features/profile/presentation/wizard/wizard_step_basic_info_test.dart

testWidgets('validates required fields on submit', (tester) async {
  await tester.pumpWidget(createTestWidget());

  // Try submitting without filling required fields
  await tester.tap(find.text('Next'));
  await tester.pump();

  // Should show validation errors
  expect(find.text('Name is required'), findsOneWidget);
});

testWidgets('calls save when form is valid', (tester) async {
  await tester.pumpWidget(createTestWidget());

  // Fill in required fields
  await tester.enterText(find.byKey(const Key('nameField')), 'John Doe');
  await tester.enterText(find.byKey(const Key('birthDateField')), '1990-01-01');

  await tester.tap(find.text('Next'));
  await tester.pumpAndSettle();

  // Verify save was called
  verify(() => mockRepository.save(any())).called(1);
  expect(find.byType(NextStepWidget), findsOneWidget);
});
```

### 8.4 Interactive Widget Testing (Scrolling, Dismissing)

```dart
testWidgets('deletes profile on swipe', (tester) async {
  await tester.pumpWidget(createTestWidget());
  await tester.pumpAndSettle();

  // Swipe to dismiss the first item
  await tester.drag(find.byType(Dismissible), const Offset(-500, 0));
  await tester.pumpAndSettle();

  // Confirm deletion
  await tester.tap(find.text('Delete'));
  await tester.pumpAndSettle();

  // Verify profile was removed from list
  expect(find.text('John Doe'), findsNothing);
  expect(find.text('Profile deleted'), findsOneWidget);
});
```

---

## 9. Integration Testing

Integration tests verify that multiple layers work together correctly. They are slower but catch real integration bugs.

### 9.1 Full DAO → Repository → Provider Flow

```dart
// test/integration/dao_to_provider_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import 'package:enternalmind_ai/database/app_database.dart';
import 'package:enternalmind_ai/database/daos/human_dao.dart';
import 'package:enternalmind_ai/features/profile/data/datasources/profile_local_source.dart';
import 'package:enternalmind_ai/features/profile/data/repositories/profile_repository.dart';
import 'package:enternalmind_ai/features/profile/domain/providers/profile_providers.dart';

void main() {
  late AppDatabase database;
  late ProviderContainer container;

  setUp(() async {
    database = AppDatabase(QueryExecutor.memory());

    // Wire up real objects (no mocks)
    final dao = HumanDao(database);
    final localSource = ProfileLocalSource(dao);
    final repository = ProfileRepository(localSource);

    container = ProviderContainer(
      overrides: [
        profileRepositoryProvider.overrideWithValue(repository),
      ],
    );
  });

  tearDown(() async {
    container.dispose();
    await database.close();
  });

  group('Profile lifecycle integration', () {
    test('create → read → update → delete flow works end-to-end', () async {
      // CREATE
      final formState = container.read(profileFormProvider);
      container.read(profileFormProvider.notifier).updateName('John Doe');
      await container.read(profileFormProvider.notifier).save();

      // READ — should appear in list
      final profiles = await container.read(profileListProvider.future);
      expect(profiles, hasLength(1));
      expect(profiles.first.fullName, 'John Doe');

      // UPDATE
      await container.read(profileFormProvider.notifier).updateName('Jane Doe');
      await container.read(profileFormProvider.notifier).save();

      // VERIFY UPDATE
      container.invalidate(profileListProvider);
      final updatedProfiles = await container.read(profileListProvider.future);
      expect(updatedProfiles.first.fullName, 'Jane Doe');

      // DELETE
      container.read(profileListProvider.notifier).delete(updatedProfiles.first.id!);
      container.invalidate(profileListProvider);
      final finalProfiles = await container.read(profileListProvider.future);
      expect(finalProfiles, isEmpty);
    });
  });
}
```

### 9.2 Full App Smoke Test

```dart
// test/integration/app_smoke_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:enternalmind_ai/main.dart';

void main() {
  testWidgets('app launches and shows splash screen', (tester) async {
    await tester.pumpWidget(const EternalMindApp());
    await tester.pump();

    // Verify splash screen is shown
    expect(find.byType(SplashScreen), findsOneWidget);
  });

  testWidgets('navigates to wizard when no profiles exist', (tester) async {
    await tester.pumpWidget(const EternalMindApp());
    await tester.pumpAndSettle(const Duration(seconds: 3)); // splash duration

    expect(find.byType(ProfileWizard), findsOneWidget);
  });
}
```

### 9.3 E2E Tests (Integration Test Driver)

```dart
// test_driver/app_test.dart
// Run with: flutter test integration_test

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:enternalmind_ai/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('E2E: Profile Creation', () {
    testWidgets('complete wizard flow', (tester) async {
      await tester.pumpWidget(const EternalMindApp());
      await tester.pumpAndSettle();

      // Step 1: Basic Info
      await tester.enterText(find.byKey(const Key('nameField')), 'John Doe');
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();

      // Step 2: Personality
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      // ... continue through all wizard steps

      // Final: Should land on Dashboard
      await tester.pumpAndSettle();
      expect(find.byType(DashboardScreen), findsOneWidget);
    });
  });
}
```

---

## 10. Mocking Strategy

### 10.1 When to Use Mocks vs. Fakes vs. In-Memory

| Approach | Use When | Example |
|---|---|---|
| **Mock (mocktail)** | Testing interactions (was `save` called?) | Use case tests |
| **Fake** | Testing behavior (does this return correct data?) | Repository with simple in-memory storage |
| **In-Memory (Drift)** | Testing database queries | DAO tests |
| **Stub** | Providing fixed values for widget rendering | Providing a fixed profile list |
| **Spy** | Tracking calls when you also want real behavior | Rare — prefer mocks |

### 10.2 Mocktail Patterns

```dart
// ── Basic Mock ──
class MockProfileRepository extends Mock implements ProfileRepository {}

// ── Mock with fallback (for nullable returns) ──
when(() => mockRepo.getActiveProfile())
    .thenAnswer((_) async => null); // OK for nullable returns

// ── Mock throwing ──
when(() => mockRepo.save(any()))
    .thenThrow(DatabaseException('error'));

// ── Verify exact arguments ──
verify(() => mockRepo.save(argThat(
  predicate<ProfileModel>((p) => p.fullName == 'John'),
))).called(1);

// ── Verify no other calls ──
verifyNoMoreInteractions(mockRepo);

// ── Capture arguments ──
final captured = verify(() => mockRepo.save(captureAny())).captured;
expect(captured.first, isA<ProfileModel>());
```

### 10.3 Mocking Platform-Specific APIs

For platform plugins (secure storage, file picker, audio recorder), create abstract interfaces in domain and mock those:

```dart
// Don't mock flutter_secure_storage directly
// Instead, create an abstraction:

abstract class SecureStorageService {
  Future<String?> read(String key);
  Future<void> write(String key, String value);
  Future<void> delete(String key);
}

// Then mock the abstraction:
class MockSecureStorage extends Mock implements SecureStorageService {}
```

---

## 11. Test Organization

### 11.1 Directory Structure

```
test/
├── helpers/
│   ├── test_setup.dart             # Reusable test utilities
│   ├── database_test_helper.dart   # In-memory DB creation
│   └── factories.dart              # Test data factories
│
├── core/
│   ├── constants/
│   ├── errors/
│   │   ├── app_exception_test.dart
│   │   └── error_handler_test.dart
│   ├── extensions/
│   ├── theme/
│   ├── utils/
│   │   └── validators_test.dart
│   └── widgets/
│       ├── glass_card_test.dart
│       ├── gradient_button_test.dart
│       └── shimmer_loader_test.dart
│
├── features/
│   ├── profile/
│   │   ├── data/
│   │   │   ├── repositories/
│   │   │   │   └── profile_repository_test.dart
│   │   │   └── datasources/
│   │   │       └── profile_local_source_test.dart
│   │   ├── domain/
│   │   │   ├── models/
│   │   │   │   └── profile_model_test.dart
│   │   │   ├── usecases/
│   │   │   │   ├── create_profile_test.dart
│   │   │   │   ├── update_profile_test.dart
│   │   │   │   └── get_active_profile_test.dart
│   │   │   └── providers/
│   │   │       └── profile_providers_test.dart
│   │   └── presentation/
│   │       ├── profile_list_screen_test.dart
│   │       └── widgets/
│   │           └── profile_card_test.dart
│   ├── chat/
│   ├── memory/
│   ├── family/
│   ├── education/
│   ├── ...
│   └── settings/
│
├── database/
│   ├── daos/
│   │   ├── human_dao_test.dart
│   │   ├── family_dao_test.dart
│   │   ├── education_dao_test.dart
│   │   └── ... (one per DAO)
│   └── converters/
│       └── type_converters_test.dart
│
├── services/
│   ├── backup_service_test.dart
│   └── notification_service_test.dart
│
├── providers/
│   ├── app_state_providers_test.dart
│   └── database_providers_test.dart
│
└── integration/
    ├── dao_to_provider_test.dart
    └── app_smoke_test.dart
```

### 11.2 Naming Conventions

```
✅ Good:
  group('ProfileRepository.getActiveProfile', () { ... });
  test('returns null when no active profile exists', () { ... });
  test('throws AppException when datasource fails', () { ... });

❌ Avoid:
  group('testing stuff', () { ... });
  test('works', () { ... });
  test('test1', () { ... });
```

### 11.3 Test Data Factories

```dart
// test/helpers/factories.dart

import 'package:enternalmind_ai/features/profile/domain/models/profile_model.dart';

/// Creates a test [ProfileModel] with sensible defaults.
///
/// Override any field to customize:
/// ```dart
/// final profile = createTestProfile(fullName: 'Custom Name');
/// ```
ProfileModel createTestProfile({
  int? id,
  String fullName = 'John Doe',
  String nickname = 'Johnny',
  DateTime? birthDate,
}) {
  return ProfileModel(
    id: id,
    fullName: fullName,
    nickname: nickname,
    birthDate: birthDate ?? DateTime(1990, 1, 1),
    // ... other fields with sensible defaults
  );
}
```

---

## 12. Test Coverage Targets

| Layer | Target | Notes |
|---|---|---|
| Domain models | 100% | All constructors, `copyWith`, equality, serialization |
| Use cases | 100% | Success, error, edge case paths |
| Validators | 100% | Valid, invalid, boundary cases |
| DAOs | 100% | CRUD, all query variations, cascade deletes |
| Repositories | 100% | With mocked datasources |
| Services | 100% | With mocked repositories |
| Providers | 100% | State changes, invalidation, error handling |
| Widgets | 80% | Structure, states (loading/error/data), interactions |
| Screens | Integration only | Full page composition |
| Core widgets | 100% | Design system components |

### Running Coverage

```bash
# Generate coverage report
flutter test --coverage

# Exclude generated files from report
# Add to project root: .flutter_coverage_exclude
# Content:
# **/*.g.dart
# **/*.freezed.dart

# Generate HTML report (requires lcov)
genhtml coverage/lcov.info -o coverage/html

# Open report
open coverage/html/index.html    # macOS
xdg-open coverage/html/index.html # Linux
```

### Coverage Configuration

Create `.flutter_coverage_exclude` in the project root:

```
**/*.g.dart
**/*.freezed.dart
**/*.gr.dart
**/*.config.g.dart
```

---

## 13. CI Pipeline Recommendations

### 13.1 GitHub Actions Workflow

```yaml
# .github/workflows/test.yml

name: Test Suite

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main, develop]

concurrency:
  group: ${{ github.workflow }}-${{ github.event.pull_request.number || github.ref }}
  cancel-in-progress: true

jobs:
  analyze:
    name: Static Analysis
    runs-on: ubuntu-latest
    timeout-minutes: 10

    steps:
      - uses: actions/checkout@v4

      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.x'
          channel: 'stable'

      - name: Cache pub dependencies
        uses: actions/cache@v3
        with:
          path: |
            ~/.pub-cache
            .dart_tool
          key: ${{ runner.os }}-pub-${{ hashFiles('pubspec.lock') }}
          restore-keys: |
            ${{ runner.os }}-pub-

      - name: Install dependencies
        run: flutter pub get

      - name: Run dart analyzer
        run: flutter analyze --no-fatal-infos

  test:
    name: Unit & Widget Tests
    needs: analyze
    runs-on: ubuntu-latest
    timeout-minutes: 15

    steps:
      - uses: actions/checkout@v4

      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.x'
          channel: 'stable'

      - name: Cache pub dependencies
        uses: actions/cache@v3
        with:
          path: |
            ~/.pub-cache
            .dart_tool
          key: ${{ runner.os }}-pub-${{ hashFiles('pubspec.lock') }}
          restore-keys: |
            ${{ runner.os }}-pub-

      - name: Install dependencies
        run: flutter pub get

      - name: Run tests with coverage
        run: flutter test --coverage --reporter expanded

      - name: Upload coverage report
        uses: actions/upload-artifact@v4
        if: always()
        with:
          name: coverage-report
          path: coverage/

      - name: Upload test results
        uses: actions/upload-artifact@v4
        if: always()
        with:
          name: test-results
          path: build/test-results/

  # Optional: Platform-specific integration tests
  integration_test_android:
    name: Android Integration Tests
    needs: analyze
    if: github.event_name == 'pull_request'
    runs-on: ubuntu-latest
    timeout-minutes: 30

    steps:
      - uses: actions/checkout@v4

      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.x'
          channel: 'stable'

      - name: Install dependencies
        run: flutter pub get

      - name: Run integration tests
        run: flutter test integration_test/
```

### 13.2 Pre-commit Hook (Optional)

```bash
#!/bin/bash
# .git/hooks/pre-commit

echo "Running pre-commit checks..."

# Run dart analyzer
flutter analyze --no-fatal-infos
if [ $? -ne 0 ]; then
  echo "❌ Analysis failed. Fix issues before committing."
  exit 1
fi

# Run tests for changed files (optional)
echo "✅ All checks passed."
```

### 13.3 CI Best Practices

| Practice | Recommendation |
|---|---|
| **Cache dependencies** | Cache `~/.pub-cache` and `.dart_tool` to speed up installs |
| **Test sharding** | For large test suites, shard by directory: `flutter test test/features/profile/` |
| **Fail fast** | Run analysis before tests — fail early if there are lint errors |
| **Test tags** | Use `@Tag('slow')` to separate fast unit tests from slow widget tests |
| **Coverage thresholds** | Set minimum coverage thresholds (optional, via `test_coverage` package) |
| **Parallel runners** | Matrix builds for Android, iOS, web (separate runners) |
| **Artifact retention** | Keep test reports for 7 days, coverage for 30 days |
| **Notification** | Configure Slack/Discord webhook for test failures on main branch |

### 13.4 Dart Test Runner Options

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific file
flutter test test/features/profile/domain/models/profile_model_test.dart

# Run with tags (tag slow tests with @Tag('slow'))
flutter test --tag '!slow'  # Skip slow tests

# Run with retries (for flaky tests)
flutter test --test-randomize-ordering-seed=42

# Show expanded output
flutter test --reporter expanded

# Run in headless mode (CI)
flutter test --no-sound-null-safety  # Only if needed for legacy deps
```

---

## 14. Flaky Test Prevention

### 14.1 Common Causes of Flaky Tests

| Cause | Solution |
|---|---|
| Async timers | Use `tester.pump()` with precise durations, not `Future.delayed` |
| Network calls | Always mock HTTP clients — never hit real APIs |
| File system | Use in-memory database, not real file paths |
| Random data | Seed random generators, use deterministic factories |
| Animation timing | Prefer `pumpAndSettle()` over hardcoded `pump(Duration)` |
| Global state | Reset `ProviderContainer` and database in `setUp` |
| Platform channels | Register mock platform channel handlers before each test |

### 14.2 Making Tests Deterministic

```dart
// ❌ Flaky — depends on wall clock
test('returns profile after timeout', () async {
  await Future.delayed(const Duration(seconds: 2));
  // ...
});

// ✅ Deterministic — uses tester.pump
test('returns profile after timeout', () async {
  await tester.pump(const Duration(seconds: 2));
  // ...
});

// ❌ Flaky — random data
final id = Random().nextInt(1000);

// ✅ Deterministic — seeded random or factory
final id = 42; // deterministic value
```

### 14.3 Retry and Tagging

```dart
// Tag slow tests for exclusion in fast CI runs
@Tag('slow')
@Tag('integration')
testWidgets('full wizard flow', (tester) async {
  // ...
});

// In CI:
// flutter test --exclude-tags=slow,integration
```

---

## 15. Appendix: Cheat Sheets

### 15.1 Quick Reference — Testing Each Layer

| Layer | Test With | Mock What | Key Assertion |
|---|---|---|---|
| **Model** | Plain Dart test | Nothing | Equality, `copyWith`, serialization |
| **Use Case** | Plain Dart test + mocktail | Repository | Return value, error propagation, call count |
| **Service** | Plain Dart test + mocktail | Repositories, other services | Orchestration, error aggregation |
| **Repository** | Plain Dart test + mocktail | Datasources | Model mapping, error wrapping |
| **DAO** | In-memory Drift | Nothing | CRUD, queries, cascade, indexes |
| **Provider** | `ProviderContainer` + mocktail | Repositories, other providers | State transitions, invalidation |
| **Widget** | `tester.pumpWidget` + `ProviderScope` | All repo providers | Widget tree, text, interactions |
| **Screen** | `tester.pumpWidget` + `ProviderScope` | All repo providers | Full composition, navigation |

### 15.2 Common Test Patterns

```dart
// ── Pattern: Arrange-Act-Assert (AAA) ──
test('description', () async {
  // Arrange
  // Act
  // Assert
});

// ── Pattern: Given-When-Then ──
test('description', () async {
  // Given
  // When
  // Then
});

// ── Pattern: Setup/Teardown ──
setUp(() { /* create mocks, wire dependencies */ });
tearDown(() { /* dispose, clean up */ });

// ── Pattern: Factory for test data ──
final profile = createTestProfile(fullName: 'Test Name');
```

### 15.3 Recommended Packages Summary

| Package | Purpose | Command |
|---|---|---|
| `flutter_test` | Core testing framework | In SDK |
| `mocktail` | Mocking | `flutter pub add --dev mocktail` |
| `drift` | In-memory database | Already in deps |
| `sqlite3` | SQLite for testing | `flutter pub add --dev sqlite3` |
| `flutter_riverpod` | `ProviderContainer` | Already in deps |
| `integration_test` | E2E testing | In SDK |
| `golden_toolkit` | Golden image tests (optional) | `flutter pub add --dev golden_toolkit` |
| `test_coverage` | Coverage thresholds (optional) | `flutter pub add --dev test_coverage` |

---

## Version History

| Version | Date | Changes |
|---|---|---|
| 1.0 | 2026-07-15 | Initial testing strategy document |

---

> **Next Steps:** 
> 1. Add missing dev dependencies to `pubspec.yaml`
> 2. Create `test/helpers/` directory with shared utilities
> 3. Create test factories for all domain models
> 4. Set up the first DAO test using in-memory Drift
> 5. Configure CI pipeline (GitHub Actions)
> 6. Aim for 100% coverage on all new code from Phase 1 onward

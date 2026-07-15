# EternalMind AI — Architecture

> **Version:** 2.0  
> **Pattern:** Clean Architecture + Feature-First Organization  
> **State Management:** Riverpod  
> **Database:** Drift (SQLite) + Hive (Cache)  
> **See also:** [SCHEMA.md](./SCHEMA.md), [DATABASE_SPEC.md](./DATABASE_SPEC.md), [README.md](./README.md)

---

## Architecture Principles

1. **Separation of concerns** — UI never touches database directly.
2. **Dependency inversion** — High-level modules don't depend on low-level modules; both depend on abstractions.
3. **Feature encapsulation** — Each feature owns its UI, state, and logic.
4. **Testability** — Every layer can be tested in isolation.
5. **Offline-first** — All data flows must work without network.
6. **Extensibility** — Providers, models, and avatar engines are pluggable.

---

## Directory Structure

```
lib/
├── main.dart                          # App entry, ProviderScope, router setup
│
├── core/
│   ├── constants/
│   │   ├── app_constants.dart         # App-wide constants
│   │   ├── api_constants.dart         # Default API endpoints, model lists
│   │   └── ui_constants.dart          # Spacing, radius, sizing constants
│   │
│   ├── errors/
│   │   ├── app_exception.dart         # Base exception class
│   │   ├── app_error.dart             # Error model with code, message, action
│   │   └── error_handler.dart         # Global error handler → popup system
│   │
│   ├── extensions/
│   │   ├── context_extensions.dart    # BuildContext helpers
│   │   ├── string_extensions.dart     # String manipulation
│   │   ├── datetime_extensions.dart   # Date formatting
│   │   └── file_extensions.dart       # File size, type detection
│   │
│   ├── router/
│   │   ├── app_router.dart            # GoRouter configuration
│   │   ├── route_names.dart           # Named route constants
│   │   └── route_guards.dart          # Auth/profile guards
│   │
│   ├── theme/
│   │   ├── app_theme.dart             # ThemeData composition
│   │   ├── app_colors.dart            # Color palette
│   │   ├── app_typography.dart        # Text styles
│   │   ├── app_shadows.dart           # Shadow definitions
│   │   ├── app_gradients.dart         # Gradient presets
│   │   └── app_decorations.dart       # BoxDecoration presets (glass, glow)
│   │
│   ├── utils/
│   │   ├── logger.dart                # Structured logging
│   │   ├── validators.dart            # Form validators
│   │   ├── debouncer.dart             # Input debouncing
│   │   ├── thumbnail_generator.dart   # Image thumbnail creation
│   │   └── file_picker_helper.dart    # Cross-platform file picking
│   │
│   └── widgets/                       # Shared/core widgets (NOT feature-specific)
│       ├── glass_card.dart            # Reusable glassmorphism card
│       ├── gradient_button.dart       # Primary action button
│       ├── neon_text.dart             # Glowing text effect
│       ├── loading_overlay.dart       # Full-screen loading
│       ├── error_popup.dart           # Global error popup
│       ├── avatar_circle.dart         # Circular avatar widget
│       ├── section_header.dart        # Section title with optional action
│       ├── empty_state.dart           # Empty state illustration
│       ├── search_bar.dart            # Global search bar
│       └── shimmer_loader.dart        # Shimmer loading animation
│
├── features/
│   ├── splash/
│   │   ├── presentation/
│   │   │   └── splash_screen.dart
│   │   └── splash_providers.dart
│   │
│   ├── profile/
│   │   ├── data/
│   │   │   ├── repositories/
│   │   │   │   └── profile_repository.dart
│   │   │   └── datasources/
│   │   │       └── profile_local_source.dart
│   │   ├── domain/
│   │   │   ├── models/
│   │   │   │   └── profile_model.dart          # Extends generated Drift model
│   │   │   ├── usecases/
│   │   │   │   ├── create_profile.dart
│   │   │   │   ├── update_profile.dart
│   │   │   │   ├── delete_profile.dart
│   │   │   │   ├── get_active_profile.dart
│   │   │   │   └── switch_profile.dart
│   │   │   └── providers/
│   │   │       └── profile_providers.dart      # Riverpod providers for this feature
│   │   └── presentation/
│   │       ├── wizard/
│   │       │   ├── wizard_screen.dart
│   │       │   ├── wizard_step_basic_info.dart
│   │       │   ├── wizard_step_personality.dart
│   │       │   ├── wizard_step_stories.dart
│   │       │   ├── wizard_step_family.dart
│   │       │   ├── wizard_step_photo.dart
│   │       │   └── wizard_step_review.dart
│   │       ├── profile_detail_screen.dart
│   │       ├── profile_list_screen.dart
│   │       └── widgets/
│   │           ├── profile_card.dart
│   │           └── profile_stats.dart
│   │
│   ├── family/
│   │   ├── data/
│   │   │   ├── repositories/
│   │   │   │   └── family_repository.dart
│   │   │   └── datasources/
│   │   │       └── family_local_source.dart
│   │   ├── domain/
│   │   │   ├── models/
│   │   │   │   └── family_model.dart
│   │   │   ├── usecases/
│   │   │   │   ├── add_family_member.dart
│   │   │   │   ├── update_family_member.dart
│   │   │   │   └── delete_family_member.dart
│   │   │   └── providers/
│   │   │       └── family_providers.dart
│   │   └── presentation/
│   │       ├── family_tree_screen.dart
│   │       ├── family_member_screen.dart
│   │       └── widgets/
│   │           ├── family_tree_canvas.dart     # Interactive zoom/pan tree
│   │           ├── family_node.dart
│   │           └── family_connection_line.dart
│   │
│   ├── education/                              # Mirrors family structure
│   ├── career/                                 # Mirrors family structure
│   ├── stories/                                # Mirrors family structure
│   ├── timeline/                               # Mirrors family structure
│   ├── journal/                                # Mirrors family structure
│   ├── photos/                                 # Mirrors family structure
│   ├── documents/                              # Mirrors family structure
│   ├── voice_vault/                            # Mirrors family structure
│   ├── legacy/                                 # Mirrors family structure
│   │
│   ├── dashboard/
│   │   ├── data/
│   │   │   └── dashboard_repository.dart       # Aggregates data from multiple sources
│   │   ├── domain/
│   │   │   ├── dashboard_stats.dart
│   │   │   └── providers/
│   │   │       └── dashboard_providers.dart
│   │   └── presentation/
│   │       ├── dashboard_screen.dart
│   │       └── widgets/
│   │           ├── stats_cards_row.dart
│   │           ├── recent_activity_list.dart
│   │           ├── quick_actions_grid.dart
│   │           └── provider_status_card.dart
│   │
│   ├── chat/
│   │   ├── data/
│   │   │   ├── repositories/
│   │   │   │   ├── chat_repository.dart
│   │   │   │   └── chat_history_repository.dart
│   │   │   └── datasources/
│   │   │       └── chat_local_source.dart
│   │   ├── domain/
│   │   │   ├── models/
│   │   │   │   ├── chat_message_model.dart
│   │   │   │   └── chat_session_model.dart
│   │   │   ├── usecases/
│   │   │   │   ├── send_message.dart
│   │   │   │   ├── stream_response.dart
│   │   │   │   └── get_chat_history.dart
│   │   │   └── providers/
│   │   │       └── chat_providers.dart
│   │   └── presentation/
│   │       ├── chat_screen.dart
│   │       └── widgets/
│   │           ├── chat_bubble.dart
│   │           ├── chat_input_bar.dart
│   │           ├── streaming_text.dart
│   │           ├── citation_badge.dart
│   │           ├── thinking_indicator.dart
│   │           ├── suggested_prompts_bar.dart
│   │           └── attachment_preview.dart
│   │
│   ├── ai_providers/
│   │   ├── data/
│   │   │   ├── repositories/
│   │   │   │   └── ai_provider_repository.dart
│   │   │   ├── datasources/
│   │   │   │   ├── ai_provider_local_source.dart
│   │   │   │   └── secure_api_storage.dart
│   │   │   └── provider_adapters/              # One file per provider
│   │   │       ├── openai_adapter.dart
│   │   │       ├── groq_adapter.dart
│   │   │       ├── gemini_adapter.dart
│   │   │       ├── openrouter_adapter.dart
│   │   │       ├── claude_adapter.dart
│   │   │       ├── deepseek_adapter.dart
│   │   │       ├── mistral_adapter.dart
│   │   │       ├── ollama_adapter.dart
│   │   │       └── custom_adapter.dart
│   │   ├── domain/
│   │   │   ├── models/
│   │   │   │   ├── ai_provider_model.dart
│   │   │   │   └── provider_health.dart
│   │   │   ├── services/
│   │   │   │   ├── provider_manager.dart       # Core orchestration
│   │   │   │   ├── health_monitor.dart
│   │   │   │   ├── failover_handler.dart
│   │   │   │   └── provider_priority.dart
│   │   │   └── providers/
│   │   │       └── ai_provider_providers.dart
│   │   └── presentation/
│   │       ├── ai_providers_screen.dart
│   │       ├── add_provider_screen.dart
│   │       └── widgets/
│   │           ├── provider_card.dart
│   │           ├── provider_status_indicator.dart
│   │           └── provider_priority_drag.dart
│   │
│   ├── memory/
│   │   ├── data/
│   │   │   ├── repositories/
│   │   │   │   └── memory_repository.dart
│   │   │   └── datasources/
│   │   │       ├── memory_local_source.dart
│   │   │       └── embedding_source.dart
│   │   ├── domain/
│   │   │   ├── models/
│   │   │   │   ├── memory_model.dart
│   │   │   │   ├── memory_result.dart
│   │   │   │   └── memory_context.dart
│   │   │   ├── services/
│   │   │   │   ├── memory_retrieval_service.dart
│   │   │   │   ├── context_builder_service.dart
│   │   │   │   ├── memory_ranking_service.dart
│   │   │   │   └── memory_link_service.dart
│   │   │   └── providers/
│   │   │       └── memory_providers.dart
│   │   └── presentation/
│   │       ├── memory_search_screen.dart
│   │       └── widgets/
│   │           ├── memory_result_card.dart
│   │           ├── memory_timeline.dart
│   │           └── memory_confidence_badge.dart
│   │
│   ├── settings/
│   │   ├── data/
│   │   │   └── settings_repository.dart
│   │   ├── domain/
│   │   │   ├── models/
│   │   │   │   └── app_settings.dart
│   │   │   └── providers/
│   │   │       └── settings_providers.dart
│   │   └── presentation/
│   │       ├── settings_screen.dart           # Tabbed settings
│   │       └── tabs/
│   │           ├── general_tab.dart
│   │           ├── appearance_tab.dart
│   │           ├── ai_providers_tab.dart
│   │           ├── voice_tab.dart
│   │           ├── storage_tab.dart
│   │           ├── backup_tab.dart
│   │           └── developer_tab.dart
│   │
│   ├── voice/
│   │   ├── data/
│   │   │   ├── repositories/
│   │   │   │   └── voice_repository.dart
│   │   │   └── datasources/
│   │   │       └── audio_recorder.dart
│   │   ├── domain/
│   │   │   ├── services/
│   │   │   │   ├── stt_service.dart
│   │   │   │   ├── tts_service.dart
│   │   │   │   ├── voice_activity_detector.dart
│   │   │   │   └── audio_player_service.dart
│   │   │   └── providers/
│   │   │       └── voice_providers.dart
│   │   └── presentation/
│   │       └── voice_button.dart               # Reusable voice input widget
│   │
│   └── avatar/
│       ├── data/
│       │   ├── repositories/
│       │   │   └── avatar_repository.dart
│       │   └── datasources/
│       │       └── avatar_generation_source.dart
│       ├── domain/
│       │   ├── models/
│       │   │   ├── avatar_model.dart
│       │   │   └── expression.dart
│       │   ├── services/
│       │   │   ├── avatar_render_service.dart
│       │   │   ├── expression_service.dart
│       │   │   ├── lip_sync_service.dart
│       │   │   └── idle_animation_service.dart
│       │   └── providers/
│       │       └── avatar_providers.dart
│       └── presentation/
│           └── widgets/
│               ├── avatar_display.dart
│               ├── avatar_expression_layer.dart
│               └── avatar_selector.dart
│
├── services/                                   # Cross-cutting services
│   ├── backup_service.dart                     # Import/export logic
│   ├── notification_service.dart               # Local notifications
│   ├── file_service.dart                       # File system operations
│   └── index_service.dart                      # Background indexing
│
├── database/
│   ├── app_database.dart                       # Drift database definition
│   ├── app_database.g.dart                     # Generated (do not edit)
│   ├── tables/
│   │   ├── humans_table.dart
│   │   ├── family_members_table.dart
│   │   ├── education_table.dart
│   │   ├── career_history_table.dart
│   │   ├── skills_table.dart
│   │   ├── languages_table.dart
│   │   ├── interests_table.dart
│   │   ├── goals_table.dart
│   │   ├── values_beliefs_table.dart
│   │   ├── personality_traits_table.dart
│   │   ├── conversation_styles_table.dart
│   │   ├── daily_habits_table.dart
│   │   ├── favorite_quotes_table.dart
│   │   ├── favorite_words_table.dart
│   │   ├── life_places_table.dart
│   │   ├── life_stories_table.dart
│   │   ├── timeline_table.dart
│   │   ├── daily_journals_table.dart
│   │   ├── memories_table.dart
│   │   ├── memory_tags_table.dart
│   │   ├── memory_links_table.dart
│   │   ├── memory_cache_table.dart
│   │   ├── memory_search_logs_table.dart
│   │   ├── documents_table.dart
│   │   ├── photo_albums_table.dart
│   │   ├── photos_table.dart
│   │   ├── audio_files_table.dart
│   │   ├── voice_settings_table.dart
│   │   ├── avatars_table.dart
│   │   ├── legacy_messages_table.dart
│   │   ├── chat_history_table.dart
│   │   ├── ai_providers_table.dart
│   │   ├── ai_settings_table.dart
│   │   ├── downloaded_models_table.dart
│   │   └── settings_table.dart
│   ├── daos/
│   │   ├── human_dao.dart
│   │   ├── family_dao.dart
│   │   ├── education_dao.dart
│   │   ├── career_dao.dart
│   │   ├── skills_dao.dart
│   │   ├── languages_dao.dart
│   │   ├── interests_dao.dart
│   │   ├── goals_dao.dart
│   │   ├── values_dao.dart
│   │   ├── personality_dao.dart
│   │   ├── stories_dao.dart
│   │   ├── timeline_dao.dart
│   │   ├── journals_dao.dart
│   │   ├── memories_dao.dart
│   │   ├── documents_dao.dart
│   │   ├── photos_dao.dart
│   │   ├── voice_dao.dart
│   │   ├── legacy_dao.dart
│   │   ├── chat_dao.dart
│   │   ├── providers_dao.dart
│   │   └── settings_dao.dart
│   └── converters/
│       └── type_converters.dart                # Custom Drift type converters
│
└── providers/                                  # App-wide Riverpod providers
    ├── app_state_providers.dart                # App lifecycle, connectivity
    ├── database_providers.dart                 # Database instance
    ├── hive_providers.dart                     # Hive box instances
    └── secure_storage_providers.dart           # flutter_secure_storage
```

---

## Clean Architecture Layers

### 1. Data Layer (`data/`)

Responsible for all data operations — local database, cache, secure storage, and external API calls.

```
datasources/    ← Raw data access (Drift DAO, Hive, HTTP client)
repositories/   ← Implements domain repository interfaces, coordinates datasources
```

**Rules:**
- Datasources return raw types (Drift models, JSON, primitives).
- Repositories translate datasource outputs into domain models.
- Repositories are the only layer `domain/` depends on.

### 2. Domain Layer (`domain/`)

The innermost layer — no Flutter, no Drift, no platform dependencies.

```
models/         ← Pure Dart models (may extend generated Drift models)
usecases/       ← Single-responsibility business logic classes
services/       ← Cross-cutting business logic (orchestration, complex workflows)
providers/      ← Riverpod providers that wire usecases/services to UI
```

**Rules:**
- Domain models have no database annotations.
- Use cases have a single `call()` method.
- Services are for logic too complex for a single use case.
- Domain never imports from `data/` or `presentation/`.

### 3. Presentation Layer (`presentation/`)

Flutter widgets and screens. Reads state from providers, dispatches events.

```
screens/        ← Full-page widgets (routes)
widgets/        ← Reusable feature-specific widgets
```

**Rules:**
- Screens are composed of widgets.
- Widgets never access datasources directly.
- Widgets call providers or use case objects.

---

## Data Flow Patterns

### Read Flow

```
Screen
  │  reads provider
  ▼
Provider (Riverpod)
  │  calls repository
  ▼
Repository
  │  calls datasource
  ▼
Datasource (DAO / Hive / Secure)
  │
  ▼
Returns data → mapped to domain model → returned to provider → UI rebuilds
```

### Write Flow

```
User Action (tap, form submit)
  │
  ▼
Provider method / Use Case
  │
  ▼
Repository.save(entity)
  │
  ▼
Datasource.insert/update(entity)
  │
  ▼
Invalidate related providers → UI rebuilds
```

### Chat Flow (Composite)

```
User sends message
  │
  ▼
ChatScreen → ChatProvider.sendMessage()
  │
  ├──► Save user message to chat_history (via ChatRepository)
  │
  ├──► MemoryRetrievalService.search(query)
  │       │
  │       ├──► Search memories table (keyword + tag)
  │       ├──► Search timeline
  │       ├──► Search stories
  │       ├──► Search journals
  │       └──► (Future: vector search)
  │
  ├──► ContextBuilderService.build(profile + memories + conversation)
  │       │
  │       └──► Construct system prompt + memory context + chat history
  │
  ├──► ProviderManager.send(context)
  │       │
  │       ├──► Select highest-priority healthy provider
  │       ├──► Send streaming request
  │       ├──► On failure → failover → retry
  │       └──► On complete → update provider stats
  │
  ├──► ChatProvider receives stream → updates UI
  │
  ├──► Save AI response to chat_history
  │
  └──► (Background) Update memory relevance scores
```

---

## Dependency Injection

Riverpod is the DI container. No manual DI framework needed.

```
// Database provider
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

// Repository provider
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository(ref.watch(databaseProvider));
});

// Use case provider
final createProfileProvider = Provider<CreateProfile>((ref) {
  return CreateProfile(ref.watch(profileRepositoryProvider));
});

// State provider
final activeProfileProvider = FutureProvider<ProfileModel?>((ref) {
  return ref.watch(createProfileProvider).getActiveProfile();
});
```

**Key rules:**
- `ref.watch()` for reactive dependencies.
- `ref.read()` for one-time access (callbacks, event handlers).
- `ref.invalidate()` to trigger refresh after writes.
- `autoDispose` for ephemeral state (forms, wizards).

---

## Navigation Flow

```
SplashScreen
  │
  ├── (has profiles) ──► DashboardScreen (via BottomNavigation)
  │                            │
  │                            ├── Tab: Chat
  │                            ├── Tab: Memory
  │                            ├── Tab: Family
  │                            ├── Tab: Timeline
  │                            └── Tab: Settings
  │
  └── (no profiles) ──► ProfileWizard
                              │
                              └──► DashboardScreen
```

**All routes** (non-exhaustive):

| Route | Screen | Auth Required |
|---|---|---|
| `/splash` | SplashScreen | No |
| `/wizard` | ProfileWizard | No |
| `/dashboard` | DashboardScreen | Yes (profile exists) |
| `/profile/:id` | ProfileDetailScreen | Yes |
| `/profiles` | ProfileListScreen | Yes |
| `/family` | FamilyTreeScreen | Yes |
| `/family/:id` | FamilyMemberScreen | Yes |
| `/education` | EducationListScreen | Yes |
| `/career` | CareerListScreen | Yes |
| `/stories` | StoriesListScreen | Yes |
| `/timeline` | TimelineScreen | Yes |
| `/journal` | JournalListScreen | Yes |
| `/photos` | PhotoVaultScreen | Yes |
| `/documents` | DocumentListScreen | Yes |
| `/voice` | VoiceVaultScreen | Yes |
| `/chat` | ChatScreen | Yes |
| `/chat/:sessionId` | ChatScreen (specific session) | Yes |
| `/memory/search` | MemorySearchScreen | Yes |
| `/settings` | SettingsScreen | Yes |
| `/settings/providers` | AIProvidersScreen | Yes |
| `/settings/providers/add` | AddProviderScreen | Yes |
| `/backup` | BackupScreen | Yes |

Navigation is handled by **GoRouter** with `ShellRoute` for the bottom navigation scaffold.

---

## State Management Architecture

```
                    ┌──────────────────────┐
                    │    UI Layer (Widgets) │
                    │  ref.watch(provider)  │
                    └──────────┬───────────┘
                               │
                    ┌──────────▼───────────┐
                    │   Riverpod Providers  │
                    │  (StateNotifier,      │
                    │   FutureProvider,     │
                    │   StreamProvider)     │
                    └──────────┬───────────┘
                               │
                    ┌──────────▼───────────┐
                    │   Repository Layer    │
                    │   (Caching,          │
                    │    Error handling)    │
                    └──────────┬───────────┘
                               │
                    ┌──────────▼───────────┐
                    │   Data Sources        │
                    │  (Drift DAO / Hive    │
                    │   / Secure Storage)   │
                    └──────────────────────┘
```

**Provider types used:**

| Provider Type | Use Case |
|---|---|
| `Provider` | Singleton services, repositories, config |
| `FutureProvider` | Async data loading (profile, dashboard stats) |
| `StreamProvider` | Real-time data (chat streaming, voice levels) |
| `StateNotifierProvider` | Mutable state (chat messages, wizard progress) |
| `NotifierProvider` | Simpler mutable state (settings, theme) |
| `ChangeNotifierProvider` | Legacy/complex state when needed |

---

## Service Layer Architecture

Services live in `domain/services/` or `services/` for app-wide concerns.

```
services/
├── ai_providers/
│   ├── provider_manager.dart       # Routes requests to correct provider, handles failover
│   ├── health_monitor.dart         # Pings providers, tracks latency + error rate
│   └── failover_handler.dart       # Retry logic, fallback chain
│
├── memory/
│   ├── memory_retrieval_service.dart   # Searches all memory sources
│   ├── context_builder_service.dart    # Assembles AI context from memories
│   ├── memory_ranking_service.dart     # Scores and ranks memory results
│   └── memory_link_service.dart        # Links related memories
│
├── voice/
│   ├── stt_service.dart            # Speech-to-text abstraction
│   ├── tts_service.dart            # Text-to-speech abstraction
│   └── voice_activity_detector.dart    # VAD for continuous conversation
│
└── avatar/
    ├── avatar_render_service.dart      # Renders avatar (static + animated)
    ├── expression_service.dart         # Maps emotion → expression parameters
    └── lip_sync_service.dart           # Syncs mouth to audio
```

**Service rules:**
- Services are stateless singletons provided via Riverpod.
- Services depend on repositories, not directly on datasources.
- Services may compose multiple repositories.
- Services may depend on other services.

---

## Database Layer Architecture

See [DATABASE_SPEC.md](./DATABASE_SPEC.md) for full specification.

```
database/
├── app_database.dart               # Drift Database class
│   ├── LazyDatabase (creates on first access)
│   ├── Schema versioning with migrations
│   └── All table references
│
├── tables/                         # One file per table
│   └── humans_table.dart           # Drift Table definition
│       └── class Humans extends Table
│
├── daos/                           # Data Access Objects
│   └── human_dao.dart              # CRUD + query methods
│       └── class HumanDao extends DatabaseAccessor
│
└── converters/                     # Type converters
    └── type_converters.dart        # DateTime, Enum, List<String> converters
```

---

## Feature-First Organization Rules

1. **Every feature gets a `data/`, `domain/`, and `presentation/` folder** — even if initially sparse.
2. **Cross-feature dependencies** are resolved through the **service layer**, not direct feature-to-feature imports.
3. **Shared widgets** that are used across features go in `core/widgets/`.
4. **Feature-specific widgets** stay in the feature's `presentation/widgets/`.
5. **Do not create** a shared `models/` folder — models belong to their feature's domain.
6. **Repository interfaces** (abstract classes) are in `domain/` — implementations in `data/repositories/`.

---

## Key Architectural Decisions

| Decision | Choice | Rationale |
|---|---|---|
| State management | Riverpod | Compile-safe, testable, no `BuildContext` dependency |
| Database | Drift (SQLite) | Type-safe, reactive queries, SQL + Dart |
| Cache | Hive | Fast key-value for non-critical ephemeral data |
| Secure storage | flutter_secure_storage | Encrypted API keys, encryption keys |
| Routing | GoRouter | Declarative, deep linking, shell routes |
| DI | Riverpod (built-in) | No need for GetIt or Injectable |
| Code generation | build_runner | Drift, Freezed, JSON serialization |

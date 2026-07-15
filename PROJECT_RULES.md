# EternalMind AI — Project Rules

> **Version:** 2.0  
> **Purpose:** Non-negotiable rules that every developer and AI agent MUST follow.  
> **Violations of these rules are bugs.**  
> **See also:** [README.md](./README.md), [CODING_STANDARDS.md](./CODING_STANDARDS.md), [SCHEMA.md](./SCHEMA.md)

---

## Rule 1: Never Redesign the Architecture

- The folder structure in [ARCHITECTURE.md](./ARCHITECTURE.md) is **immutable**.
- Clean Architecture with feature-first organization is **required**.
- Riverpod is the **only** state management allowed.
- Drift (SQLite) is the **only** primary database.
- Hive is for cache only.
- flutter_secure_storage is for secrets only.
- **No exceptions** without project lead approval.

---

## Rule 2: Never Modify the Schema Without Dual Sync

- The Flutter schema in `SCHEMA.md` **must** match the web schema.
- Never rename database columns.
- Never delete fields.
- Never change field types without updating all consumers.
- If you add a field to a model, add it to:
  1. The Drift table definition
  2. The domain model
  3. The repository (read + write)
  4. The UI form (if applicable)
  5. The web project schema (same name, same type)
- **Always extend. Never replace.**

---

## Rule 3: No Placeholder UIs

- Every screen must be **fully functional**.
- Every button must perform an action — no "Coming Soon" buttons.
- Every list item must be tappable with a meaningful destination.
- Empty states must show helpful illustrations and CTAs.
- Never show a raw `Text('TODO')` widget.
- Never throw `UnimplementedError`.
- Never leave a route without a screen.

---

## Rule 4: Widget Composition over Configuration

- Build complex widgets by composing simple ones.
- Do not create mega-widgets with 20 parameters.
- Split widgets at logical boundaries (header, body, footer, etc.).
- If a widget file exceeds 300 lines, split it.
- Extract reusable widget patterns into `core/widgets/`.

---

## Rule 5: Repository Pattern Enforcement

- UI must **never** call DAO methods directly.
- UI must **never** import from `database/`.
- UI communicates with data through providers → repositories.
- Repositories always return domain models (not Drift models).
- Exceptions: only in `data/datasources/` and DAO files.

---

## Rule 6: Database Consistency Rules

- Foreign keys must be enabled at the database level (`PRAGMA foreign_keys = ON`).
- Every child table must have a `humanId` foreign key with `CASCADE DELETE`.
- Every table must have an `id` (auto-increment), `createdAt`, and `updatedAt`.
- Indexes required on: `humanId`, `date`, `title`, `category`, `tags`.
- All nullable fields must have explicit null handling in Dart code.
- Schema migrations must be **backward-compatible** — never drop columns.

---

## Rule 7: API Key Security

- API keys must **never** appear in:
  - Code
  - Logs
  - Error messages sent to the user
  - Git history
  - Database plaintext
- All keys go through `flutter_secure_storage`.
- The AI provider repository is the **only** code that reads keys.
- Key encryption is non-negotiable even in debug builds.

---

## Rule 8: Error Handling

- Every repository method must wrap database operations in try/catch.
- Every service method that calls external APIs must have error handling.
- Unhandled exceptions must bubble to the global error handler.
- The global error handler must display a user-friendly popup (see UI_DESIGN_SYSTEM.md).
- Never use `print()` for errors — use the logger.
- Never swallow exceptions silently.

---

## Rule 9: UI Consistency Rules

- Every screen must use the theme from `core/theme/`.
- No hardcoded colors, font sizes, or padding values.
- No Material default widgets — all widgets must match the design system.
- Dark theme is the **only** theme (light theme is not planned).
- Glassmorphism is the default card style.
- All interactive elements must have hover/active states.
- Animations must be smooth (duration 200–400ms, curves `easeInOut`).

---

## Rule 10: No Magic Strings or Numbers

- All string literals that appear in UI must be in a constants file or use localization-ready patterns.
- All numeric values for spacing, radius, and sizing must come from `core/constants/ui_constants.dart`.
- Color values must come from `core/theme/app_colors.dart`.
- API endpoints and model names must come from `core/constants/api_constants.dart`.

---

## Rule 11: State Management Discipline

- Use `ref.watch()` for reactive reads.
- Use `ref.read()` only in callbacks and event handlers — never in `build()`.
- Use `ref.invalidate()` to refresh data after mutations.
- Use `autoDispose` for ephemeral state (forms, wizards, temporary filters).
- Never pass `Ref` objects between widgets — use providers.
- Never store mutable state in widgets — use providers.

---

## Rule 12: Build Rules

- Every feature must compile independently where possible.
- No cyclic dependencies between features.
- Feature A may depend on feature B's domain models but not its presentation.
- Cross-feature services go in `services/` (top-level), not inside a feature.
- Run `flutter analyze` before every commit.
- Run `flutter test` after every significant change.
- Generated files (`.g.dart`) are committed to version control.

---

## Rule 13: Profile Handling

- The app must always have exactly **one active profile** or **zero profiles**.
- If zero profiles exist → show ProfileWizard.
- If profiles exist → restore last active profile on launch.
- Switching profiles updates all providers that depend on the active profile.
- Deleting the active profile must either switch to another profile or show the wizard.

---

## Rule 14: Import/Export Integrity

- JSON exports must include ALL tables for the selected profile.
- JSON imports must validate schema before writing.
- On schema mismatch → show clear error message listing missing/extra fields.
- Import is atomic: if any write fails, roll back the entire import.
- ZIP backups must include metadata.json + assets folder.

---

## Rule 15: Development Workflow

```
1. Read README.md, SCHEMA.md, ARCHITECTURE.md before coding
2. Identify which phase and feature the work belongs to
3. Check ROADMAP.md for priority and dependencies
4. Create/update documentation if the change affects architecture
5. Follow CODING_STANDARDS.md for all code
6. Run flutter analyze and fix all warnings
7. Run existing tests and add new ones
8. Verify the feature works on target platform(s)
9. Commit with descriptive message referencing the phase
```

---

## Rule 16: Code Generation Rules

- Drift: `flutter pub run build_runner build` after table changes.
- Freezed: Use for immutable domain models with `copyWith`.
- JSON serialization: Use `json_serializable` for import/export models only.
- Do **not** generate code for:
  - Widgets
  - Providers
  - Repositories
  - Services
  - Use cases
- Generated files must be in `.gitignore` only if the build system regenerates them per-environment. Otherwise commit them.
- Never manually edit `.g.dart` files.

---

## Rule 17: AI Provider Rules

- Provider adapters must all implement the same abstract interface.
- The provider interface must support:
  - Text generation (streaming + non-streaming)
  - Embeddings generation
  - Image generation (for avatar)
  - Speech-to-text
  - Text-to-speech
- Adding a new provider means:
  1. Create an adapter file implementing the interface
  2. Add to the provider registry
  3. Add any provider-specific configuration to the database
  4. Test failover behavior
- Never hardcode provider-specific logic outside the adapter.

---

## Rule 18: Memory System Rules

- Chat must **never** answer without first searching memories.
- Memory search must cover: stories, timeline, journals, family, education, career, documents.
- Memory results must include confidence scores.
- Context window must respect provider token limits.
- Memory updates must happen in the background — never block the UI.
- Memory linking must not create infinite loops.

---

## Rule 19: Performance Rules

- Lists longer than 20 items must use pagination or `ListView.builder`.
- Images must use cached network images and local thumbnails.
- Database queries on large tables must be indexed.
- Voice and video processing must happen in isolates.
- UI animations must run at 60fps — no jank.
- Heavy computations must not block the main isolate.
- Profile all screens: initial build time must be under 500ms.

---

## Rule 20: No Breaking Changes

- Never remove a public method, class, or widget without a deprecation cycle.
- Never change a method signature without updating all callers.
- Never delete a database column — mark it deprecated and remove in a future migration.
- Never change the meaning of an existing field.
- Always maintain backward compatibility with existing user data.

---

## Consequences of Rule Violations

| Severity | Example | Action |
|---|---|---|
| Critical | Schema mismatch, broken database | Block commit, fix immediately |
| High | Placeholder UI, missed error handling | PR rejection, fix before merge |
| Medium | Hardcoded color, missing documentation | Warning, fix in same sprint |
| Low | Style inconsistency, minor naming issue | Note for code review |

---

## Enforcement

- These rules are automatically checked during code review.
- AI agents must affirm they have read this document before generating code.
- Rules are numbered for easy reference in PR comments (e.g., "Violates Rule 4: Widget Composition").
- Rules may be amended only by updating this document with project lead approval.

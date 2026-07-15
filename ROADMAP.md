# EternalMind AI — Development Roadmap

> **Version:** 2.0  
> **Platform:** Flutter (Android, iOS, Windows, macOS, Linux)  
> **Architecture:** Offline-First Digital Human Platform  
> **See also:** [README.md](./README.md), [ARCHITECTURE.md](./ARCHITECTURE.md), [SCHEMA.md](./SCHEMA.md)

---

## Development Philosophy

Every phase must produce a **working, shippable application**. No phase depends on an incomplete prior phase. Features within a phase are ordered by user-facing impact.

**Priority hierarchy:**
1. Core data (profiles, memories) — the foundation
2. Core interaction (chat, memory retrieval) — the primary interface
3. Rich media (voice, avatar) — the immersive layer
4. Intelligence (semantic search, offline AI) — the power layer
5. Polish (performance, edge cases, accessibility)

---

## Phase 1 — Foundation (MVP)

> **Goal:** A user can create a Digital Human, import/export data, and see a functional Dashboard.

| Milestone | Description | Priority |
|---|---|---|
| 1.1 — Project Scaffold | Flutter project, folder structure, Drift setup, Hive init, Riverpod wiring | Critical |
| 1.2 — Database Layer | All Drift tables, DAOs, foreign keys, cascade deletes, indexes | Critical |
| 1.3 — Profile Creation Wizard | Step-by-step wizard, auto-save per step, resume on interrupt | Critical |
| 1.4 — Profile Management | Edit, delete, clone, switch active profile, list profiles | Critical |
| 1.5 — Import / Export | JSON import with schema validation, JSON export, ZIP backup | High |
| 1.6 — Dashboard | Profile snapshot, statistics, quick actions, recent activity | High |
| 1.7 — Navigation Shell | Bottom navigation, page transitions, side drawer (desktop) | High |
| 1.8 — Theme System | Dark theme, glassmorphism, color palette, typography, component library | Medium |

**Definition of MVP:** A user can install the app, create a Digital Human through a guided wizard, view their dashboard, and export/import their profile data. The app compiles on all platforms with no placeholder screens.

---

## Phase 2 — Chat & Memory Engine

> **Goal:** The Digital Human can hold intelligent conversations grounded in retrieved memories.

| Milestone | Description | Priority |
|---|---|---|
| 2.1 — AI Provider Manager | Multi-provider abstraction, encrypted API key storage, provider CRUD | Critical |
| 2.2 — Provider Health & Failover | Latency tracking, health checks, automatic failover with user notification | Critical |
| 2.3 — Memory Ingestion Engine | Index all profile data (stories, timeline, journals, family, etc.) into searchable memory | Critical |
| 2.4 — Memory Retrieval (RAG) | Semantic/keyword search over memories, rank by relevance, build context | Critical |
| 2.5 — Chat Pipeline | User input → memory search → context builder → AI request → response → save | Critical |
| 2.6 — Streaming Chat | Real-time token-by-token streaming with stop/cancel | High |
| 2.7 — Conversation History | Paginated history, search, delete, continue previous session | High |
| 2.8 — Citations & Sources | Show which memories the AI used to answer | Medium |
| 2.9 — Suggested Prompts | AI-generated follow-up questions based on recent context | Medium |
| 2.10 — Error Recovery | Graceful handling of API errors, network issues, provider switches | High |

**Phase 2 MVP:** A user can add at least one AI provider, chat with their Digital Human, see the AI reference memories in its answers, and experience automatic failover if the provider fails.

---

## Phase 3 — Voice Pipeline

> **Goal:** The user can speak to their Digital Human and hear spoken responses.

| Milestone | Description | Priority |
|---|---|---|
| 3.1 — STT Provider Abstraction | Speech-to-text wrapper (Whisper, platform STT, etc.) | Critical |
| 3.2 — TTS Provider Abstraction | Text-to-speech wrapper (ElevenLabs, platform TTS, etc.) | Critical |
| 3.3 — Push-to-Talk | Tap to record, release to send | High |
| 3.4 — Continuous Conversation | Hands-free mode: listen → think → speak → listen cycle | High |
| 3.5 — Voice Interruption | User can interrupt AI speaking; AI stops and listens | Medium |
| 3.6 — Voice Activity Detection | Detect silence, background noise filtering | Medium |
| 3.7 — Voice Settings UI | Provider selection, voice model, pitch, speed, emotion | Medium |
| 3.8 — Voice Vault Playback | Browse and play saved voice recordings with transcripts | Low |

**Phase 3 dependencies:** Phase 2 (Chat Engine) must be complete so voice I/O can connect to the chat pipeline.

---

## Phase 4 — Avatar Pipeline

> **Goal:** The Digital Human gains a visual presence with static and animated avatars.

| Milestone | Description | Priority |
|---|---|---|
| 4.1 — Avatar Image Generation | Generate avatar from profile photo + style prompt (multi-provider) | Critical |
| 4.2 — Avatar Gallery | Browse, select default avatar, regenerate | High |
| 4.3 — Expression System | Emotion-driven expression selection (happy, sad, thinking, etc.) | High |
| 4.4 — Idle Animation | Subtle breathing, blink, micro-movements | Medium |
| 4.5 — Talking Animation | Mouth movement synchronized with TTS audio | Medium |
| 4.6 — Lip Sync (Wav2Lip style) | Phoneme-aware lip movement for video avatars | Low |
| 4.7 — Eye Movement & Gaze | Natural eye motion, blink patterns, gaze direction | Low |
| 4.8 — Video Avatar Pipeline | Full talking-head video generation (SadTalker, MuseTalk) | Future |

**Phase 4 dependencies:** Phase 3 (Voice Pipeline) for TTS-driven lip sync and talking animation.

---

## Phase 5 — Memory Intelligence

> **Goal:** The memory system becomes deeply intelligent with semantic search and knowledge graphs.

| Milestone | Description | Priority |
|---|---|---|
| 5.1 — Embeddings Engine | Generate and store embeddings for all memory types | Critical |
| 5.2 — Semantic Search | Vector similarity search over all memories | Critical |
| 5.3 — Memory Ranking | Confidence scoring, recency boost, relevance weighting | High |
| 5.4 — Memory Linking | Auto-detect relationships between memories, build graph | Medium |
| 5.5 — Knowledge Graph | Visual graph explorer of connected memories | Medium |
| 5.6 — Memory Consolidation | Periodic background job to merge duplicate/related memories | Low |
| 5.7 — Memory Decay & Reinforcement | Frequently accessed memories gain priority; stale ones deprioritize | Low |
| 5.8 — Context Window Strategy | Smart truncation, sliding window, summarization for long conversations | Medium |

**Phase 5 dependencies:** Phase 2 (Chat Engine) — embeddings improve memory retrieval quality.

---

## Phase 6 — Offline AI

> **Goal:** The entire AI pipeline can run locally without any internet connection.

| Milestone | Description | Priority |
|---|---|---|
| 6.1 — Ollama Integration | Connect to local Ollama instance | Critical |
| 6.2 — llama.cpp Binding | Run models via llama.cpp on desktop platforms | High |
| 6.3 — MLC / MediaPipe | On-device inference for mobile platforms | High |
| 6.4 — Model Manager | Download, list, delete, switch local models | High |
| 6.5 — Local Embeddings | On-device embedding generation | Medium |
| 6.6 — Local STT | Whisper.cpp or similar on-device speech recognition | Medium |
| 6.7 — Local TTS | Piper or similar on-device text-to-speech | Medium |
| 6.8 — Seamless Offline Switch | Auto-detect network; fall back to local providers transparently | High |

**Phase 6 dependencies:** Phase 2 and Phase 5 — local models replace cloud endpoints in the same provider abstraction.

---

## Phase 7 — Video Avatar & Digital Human

> **Goal:** Real-time photorealistic Digital Human with full expression, lip sync, and natural movement.

| Milestone | Description | Priority |
|---|---|---|
| 7.1 — SadTalker Integration | Static image → talking video from audio | High |
| 7.2 — Wav2Lip Integration | Lip-sync any face video to audio | High |
| 7.3 — MuseTalk / Real-time | Real-time full-body talking avatar | Medium |
| 7.4 — Emotion Rendering | Map detected/simulated emotions to facial expressions | Medium |
| 7.5 — Gesture System | Natural hand/body movements during speech | Low |
| 7.6 — Eye Contact & Gaze | Simulated eye contact with user (camera-aware) | Low |
| 7.7 — Background & Environment | Virtual environments, lighting simulation | Low |
| 7.8 — Plugin Architecture | Third-party avatar engine support (Ready Player Me, Live2D, VRM) | Medium |

**Phase 7 dependencies:** Phase 3 (Voice) and Phase 4 (Avatar Pipeline) provide the foundation.

---

## Future / Stretch Goals

| Feature | Description |
|---|---|
| **Web Platform** | Port to web (PWA) for browser-based access |
| **Multi-User Sync** | Sync profiles across devices via encrypted cloud relay |
| **Face Recognition** | Auto-tag people in photos |
| **OCR** | Extract text from document images |
| **Legacy Message Delivery** | Scheduled/trigger-based delivery of pre-written messages |
| **Plugin System** | Third-party extensions for memories, providers, avatar engines |
| **AR Avatar** | AR overlay of Digital Human in real-world space |
| **Biometric Unlock** | Fingerprint / Face ID for app security |
| **Family Sharing** | Multiple users sharing a Digital Human |
| **Public API** | REST API for external integrations |

---

## Phase Dependencies Diagram

```
Phase 1 (Foundation)
    │
    ▼
Phase 2 (Chat & Memory) ◄──── Phase 5 (Memory Intelligence)
    │                                    │
    ▼                                    │
Phase 3 (Voice)                          │
    │                                    │
    ▼                                    │
Phase 4 (Avatar) ────────────────────────┘
    │
    ▼
Phase 6 (Offline AI) ─── enhances all phases above
    │
    ▼
Phase 7 (Video Avatar)
```

---

## Priority Matrix

| Feature | User Value | Complexity | Phase |
|---|---|---|---|
| Profile Creation | ★★★★★ | Low | 1 |
| Dashboard | ★★★★☆ | Low | 1 |
| Chat with Memories | ★★★★★ | High | 2 |
| AI Provider System | ★★★★★ | Medium | 2 |
| Memory Search | ★★★★☆ | High | 2+5 |
| Voice Chat | ★★★★★ | Medium | 3 |
| Avatar Image | ★★★★☆ | Medium | 4 |
| Offline AI | ★★★★☆ | Very High | 6 |
| Video Avatar | ★★★☆☆ | Very High | 7 |

---

## Release Cadence

Each phase is **self-contained and releasable**.

- **Phase 1**: Alpha release (internal testing)
- **Phase 2**: Beta release (feature-complete chat)
- **Phase 3**: Public release 1.0 (voice adds major polish)
- **Phases 4–7**: Subsequent major versions (2.0, 3.0, etc.)

All phase boundaries are **flexible** — high-value items from later phases may be pulled forward if implementation进度 allows.

---

## Current Status

| Phase | Status |
|---|---|
| Phase 1 — Foundation | ⬜ Not started |
| Phase 2 — Chat & Memory | ⬜ Not started |
| Phase 3 — Voice Pipeline | ⬜ Not started |
| Phase 4 — Avatar Pipeline | ⬜ Not started |
| Phase 5 — Memory Intelligence | ⬜ Not started |
| Phase 6 — Offline AI | ⬜ Not started |
| Phase 7 — Video Avatar | ⬜ Not started |

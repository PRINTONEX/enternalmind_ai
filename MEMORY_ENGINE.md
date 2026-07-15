# EternalMind AI — Memory Engine

> **Version:** 2.0  
> **Architecture:** Retrieval-Augmented Generation (RAG) with Multi-Source Memory  
> **See also:** [SCHEMA.md](./SCHEMA.md), [CHAT_ENGINE.md](./CHAT_ENGINE.md), [README.md](./README.md)

---

## Core Philosophy

> "The AI should answer exactly as the person would, using retrieved memories and profile context instead of generic chatbot responses."

The Memory Engine is the **brain** of EternalMind AI. It stores, retrieves, ranks, and links every piece of information about a Digital Human. Every chat request triggers a memory search. The AI never answers without context.

---

## Architecture Overview

```
User Question
    │
    ▼
┌──────────────────────────────────────────────────────┐
│              Memory Retrieval Service                  │
│                                                        │
│  ┌─────────────┐  ┌──────────┐  ┌───────────────┐    │
│  │ Keyword      │  │ Tag      │  │ Semantic      │    │
│  │ Search       │  │ Search   │  │ Search        │    │
│  │ (SQL LIKE)   │  │ (exact)  │  │ (embeddings)  │    │
│  └──────┬───────┘  └────┬─────┘  └──────┬────────┘    │
│         │               │               │              │
│         └───────────────┴───────────────┘              │
│                         │                              │
│                         ▼                              │
│  ┌────────────────────────────────────────┐            │
│  │        Memory Ranking Service          │            │
│  │  scores by: relevance, recency,        │            │
│  │  importance, confidence, emotion       │            │
│  └────────────────┬───────────────────────┘            │
│                   │                                    │
│                   ▼                                    │
│  ┌────────────────────────────────────────┐            │
│  │        Context Builder Service         │            │
│  │  assembles: profile + top memories     │            │
│  │  + conversation history + instructions  │            │
│  └────────────────┬───────────────────────┘            │
│                   │                                    │
│                   ▼                                    │
│  ┌────────────────────────────────────────┐            │
│  │          AI Provider (LLM)             │            │
│  │  generates response grounded in        │            │
│  │  the provided context                  │            │
│  └────────────────────────────────────────┘            │
└──────────────────────────────────────────────────────┘
```

---

## Memory Sources

The Memory Engine searches across all these sources for every chat request:

| Source | Table | Content Types | Priority Weight |
|---|---|---|---|
| Profile | `humans` | Name, bio, philosophy, quotes, personality | Highest |
| Life Stories | `life_stories` | Narratives, key life events, experiences | High |
| Timeline | `timeline` | Dated events, milestones, memories with dates | High |
| Journals | `daily_journals` | Personal reflections, moods, daily entries | High |
| Family | `family_members` | Relationships, family history, closeness | High |
| Education | `education` | Schools, degrees, achievements, courses | Medium |
| Career | `career_history` | Jobs, positions, responsibilities, locations | Medium |
| Skills | `skills` | Learned abilities, expertise areas | Medium |
| Goals | `goals` | Life objectives, aspirations, dreams | Medium |
| Values & Beliefs | `values_beliefs` | Core principles, worldview | Medium |
| Personality | `personality_traits` | Character traits, behavior patterns | Medium |
| Interests | `interests` | Hobbies, passions, recreational activities | Medium |
| Conversation Style | `conversation_styles` | How the person speaks, mannerisms | Medium |
| Photos | `photos` | Image captions, people, locations, tags | Low |
| Documents | `documents` | Titles, descriptions, categories | Low |
| Voice Notes | `audio_files` | Transcripts, speaker notes, emotions | Low |
| Legacy Messages | `legacy_messages` | Pre-written messages, delivery rules | Low |
| Chat History | `chat_history` | Previous conversations (recent relevance) | Dynamic |

---

## Memory Retrieval Pipeline

### Phase 1: Query Understanding

```dart
MemoryQuery analyzeQuery(String userMessage) {
  // 1. Extract keywords (remove stop words)
  // 2. Detect entities (names, places, dates)
  // 3. Detect intent (question vs. statement)
  // 4. Detect emotion (for mood-matching)
  // 5. Detect category hints (family, career, etc.)
  // 6. Return structured query object
}
```

### Phase 2: Multi-Source Search

Executed in parallel across all memory sources:

```dart
class MemoryRetrievalService {
  Future<List<MemoryResult>> search({
    required int humanId,
    required MemoryQuery query,
    int maxResults = 20,
  }) async {
    final results = <MemoryResult>[];
    
    // Run searches in parallel
    final futures = await Future.wait([
      _searchProfile(humanId, query),
      _searchStories(humanId, query),
      _searchTimeline(humanId, query),
      _searchJournals(humanId, query),
      _searchFamily(humanId, query),
      _searchEducation(humanId, query),
      _searchCareer(humanId, query),
      _searchSkills(humanId, query),
      _searchGoals(humanId, query),
      _searchValues(humanId, query),
      _searchPersonality(humanId, query),
      _searchInterests(humanId, query),
      _searchPhotos(humanId, query),
      _searchDocuments(humanId, query),
      _searchVoiceNotes(humanId, query),
      _searchChatHistory(humanId, query),
      _semanticSearch(humanId, query),  // Phase 5+
    ]);
    
    for (final result in futures) {
      results.addAll(result);
    }
    
    return results;
  }
}
```

Each search method:
1. Queries the corresponding DAO with `LIKE` / `IN` / `MATCH` patterns
2. Maps results to `MemoryResult` objects with metadata (source, date, importance)
3. Returns top N results from that source

### Phase 3: Memory Ranking

```dart
class MemoryRankingService {
  double calculateScore(MemoryResult memory, MemoryQuery query) {
    double score = 0.0;
    
    // 1. Text relevance (keyword overlap TF-style)
    score += _textRelevance(memory.text, query.keywords) * 0.30;
    
    // 2. Recency bonus (newer = higher)
    score += _recencyScore(memory.date) * 0.15;
    
    // 3. Importance factor (user-set importance: 1-5)
    score += (memory.importance / 5.0) * 0.15;
    
    // 4. Emotion match (query emotion matches memory emotion)
    score += _emotionMatch(query.emotion, memory.emotion) * 0.05;
    
    // 5. Source authority (profile > stories > journal > ...)
    score += _sourceAuthority(memory.sourceType) * 0.10;
    
    // 6. Memory confidence (how often accessed + how recently)
    score += _confidenceScore(memory) * 0.10;
    
    // 7. Tag overlap (query entities match memory tags)
    score += _tagOverlap(memory.tags, query.entities) * 0.10;
    
    // 8. Semantic similarity (embeddings cosine) — Phase 5+
    score += _semanticSimilarity(memory.embedding, query.embedding) * 0.05;
    
    return score;
  }
}
```

### Phase 4: Context Assembly

```dart
class ContextBuilderService {
  Future<AIContext> build({
    required int humanId,
    required String userMessage,
    required List<MemoryResult> memories,
    int maxContextTokens = 6000,  // Leaves room for response
  }) async {
    final context = AIContext();
    
    // 1. Add system prompt with profile identity
    context.addSystemPrompt(_buildSystemPrompt(profile));
    
    // 2. Add conversation style instructions
    context.addSystemPrompt(_buildStylePrompt(profile.conversationStyle));
    
    // 3. Add top-ranked memories (most relevant first)
    final rankedMemories = _rankMemories(memories, userMessage);
    for (final memory in rankedMemories.take(10)) {
      context.addMemoryContext(memory);
    }
    
    // 4. Add recent conversation history (last 10 exchanges)
    context.addConversationHistory(recentMessages);
    
    // 5. Add user's current message
    context.addUserMessage(userMessage);
    
    // 6. Trim to fit token budget
    context.trim(maxContextTokens);
    
    return context;
  }
}
```

### System Prompt Template

```
You are [Full Name], also known as [Nickname].

[Bio / About section]

Your life philosophy: [Philosophy]
Your values: [Values]
Your personality: [Personality traits]

You were born on [Birth Date] in [Birth Place].
You currently live in [Current City].
You are a [Nationality] [Occupation].

Your conversational style: [Style description]

IMPORTANT RULES:
- Answer EVERY question as [Name] would answer.
- Use retrieved memories to ground your responses.
- If you don't know something, say "I don't recall that."
- Never say "As an AI..." or "I don't have personal experiences."
- Express emotions, opinions, and memories naturally.
- Use the person's speaking style and mannerisms.

The current date is [Current Date].
```

---

## Memory Confidence System

Each memory has a confidence score (0.0 – 1.0) that determines how likely it is to be correct and relevant.

### Confidence Factors

| Factor | Description | Impact |
|---|---|---|
| **Access Frequency** | How often the memory is retrieved | +0.1 per access (max +0.3) |
| **Recency** | Days since last access | Linear decay over 90 days |
| **User Importance** | User-set 1–5 importance | 0.2 × (importance/5) |
| **Source Reliability** | Profile > Story > Journal | 0.1–0.3 multiplier |
| **Embedding Coherence** | Multiple similar memories reinforce each other | +0.05 per similar memory |
| **Corroboration** | Same info from multiple sources | +0.15 per corroborating source |

### Confidence Thresholds

```
0.0 – 0.2: Low confidence — include only if highly relevant
0.2 – 0.5: Medium confidence — include normally
0.5 – 0.8: High confidence — prioritize in context
0.8 – 1.0: Very high confidence — always include (e.g., profile facts)
```

---

## Memory Linking

Related memories are automatically linked to create a knowledge graph.

```dart
class MemoryLinkService {
  Future<void> detectLinks(int humanId, MemoryModel newMemory) async {
    // 1. Find memories with overlapping tags
    // 2. Find memories with similar dates/times
    // 3. Find memories with same named entities
    // 4. Find memories with same location
    // 5. Create links in memory_links table
    
    // Example: Adding a memory "Graduated college in 2015"
    //   → Link to Education: "Computer Science at MIT"
    //   → Link to Timeline: "2015: Moved to San Francisco"
    //   → Link to Photo: "Graduation ceremony photo"
  }
}
```

Links are bidirectional and include a relationship type:
- `sequential` — memory A happened before/after memory B
- `causal` — memory A caused memory B
- `related` — shared topic, person, or location
- `contained` — memory B is a detail of memory A

---

## Long-Term Memory

### Memory Consolidation

Periodic background process (triggered when app is idle):

```dart
class MemoryConsolidationService {
  Future<void> consolidate(int humanId) async {
    // 1. Find low-confidence memories with high access frequency
    //    → These are reliable but untagged → increase confidence
    
    // 2. Find duplicate memories
    //    → Merge content, keep the best version
    
    // 3. Find related unlinked memories
    //    → Create links
    
    // 4. Age out very old, never-accessed, low-importance memories
    //    → Archive them (not delete)
  }
}
```

### Memory Archive

Memories with:
- Confidence < 0.1
- No access in 180+ days
- Importance < 2 (user-set)

Are moved to an **archive** state. They remain searchable but are excluded from normal retrieval to save context window space. Archive is searchable via explicit memory search.

---

## Semantic Search (Phase 5+)

### Embeddings Pipeline

```
Text Memory
    │
    ▼
Embeddings Provider (any provider that supports embeddings)
    │
    ├── OpenAI text-embedding-3-small
    ├── Gemini embedding-001
    ├── Cohere embed-english-v3.0
    └── Local (Phase 6)
    │
    ▼
Vector Storage
    │
    ├── SQLite with vector extension (sqlite-vec)
    │     OR
    └── Hive with cosine similarity in Dart
    │
    ▼
Query → embed query → cosine similarity → rank results
```

### Hybrid Search Strategy

```dart
List<MemoryResult> hybridSearch(MemoryQuery query) {
  final keywordResults = keywordSearch(query);      // Fast, broad
  final semanticResults = semanticSearch(query);    // Smart, complementary
  
  // Merge and de-duplicate
  // Keyword results get 0.6× weight for the same memory
  // Semantic results get 0.4× weight
  // High overlap → boost confidence
  
  return merge(keywordResults, semanticResults);
}
```

---

## Context Window Strategy

EternalMind AI must work with models that have vastly different context windows (4K tokens for older models, up to 200K for Gemini).

### Token Budget Allocation

```
Total context window: [model_max_tokens - max_tokens_response]

Budget distribution:
├── System prompt (profile identity)    → 800–1200 tokens  (~20% for small models)
├── Conversation history (last messages) → 1000–2000 tokens (~30%)
├── Memory context (ranked)             → 1500–3000 tokens (~40%)
├── Formatting / spacing                → 200 tokens       (~5%)
└── Safety buffer                       → 200 tokens       (~5%)
```

### Truncation Strategy

```dart
class ContextTruncator {
  AIContext trim(AIContext context, int maxTokens) {
    // 1. System prompt is NEVER trimmed (identity is essential)
    // 2. Reduce conversation history first (keep the most recent)
    // 3. Reduce memory context next (keep highest-ranked memories)
    // 4. If still over budget, aggressively prune memories
    // 5. Never go over the token budget
    
    while (context.estimatedTokens > maxTokens) {
      if (context.conversationHistory.tokens > 500) {
        context.pruneConversationHistory(keep: 5); // Keep last 5 exchanges
      } else if (context.memories.length > 3) {
        context.removeLowestRankedMemory();
      } else {
        break; // Can't trim further without losing identity
      }
    }
    
    return context;
  }
}
```

### Conversation History Window

| Model Context Size | Max Conversation History | Max Memories |
|---|---|---|
| 4K (small models) | Last 5 exchanges | Top 3 |
| 8K | Last 8 exchanges | Top 5 |
| 16K | Last 12 exchanges | Top 8 |
| 32K+ | Last 20 exchanges | Top 12 |
| 100K+ | Last 30 exchanges | Top 20 |

---

## Memory Cache

To avoid re-searching for similar questions, a memory cache stores recent query-result pairs.

```dart
class MemoryCache {
  // Key: normalized query hash
  // Value: { results, timestamp, humanId }
  // TTL: 5 minutes
  // Max entries: 100 per profile
  
  Future<List<MemoryResult>?> getCached(String query, int humanId);
  Future<void> setCache(String query, int humanId, List<MemoryResult> results);
  Future<void> invalidate(int humanId); // Called when new memory is added
}
```

---

## Search Logs

All memory searches are logged for analysis and improvement:

```dart
class MemorySearchLog {
  final int id;
  final int humanId;
  final String query;
  final List<String> resultsIds;      // Which memories were returned
  final List<String> clickedResultIds; // Which ones user interacted with
  final int resultCount;
  final int latencyMs;
  final DateTime createdAt;
}
```

This data enables:
- Identifying which memory sources are most useful
- Detecting frequent queries with poor results
- Improving ranking algorithms
- Personalizing memory retrieval per profile

---

## Memory Update Cycle

After each conversation, the Memory Engine updates:

1. **Access timestamps** on retrieved memories (recency boost)
2. **Confidence scores** on memories referenced in AI responses
3. **Conversation history** — new chat entries are added
4. **Memory cache** is invalidated
5. **Background indexing** queue is checked

### Background Indexing Queue

```dart
class IndexService {
  // Queues new/updated content for indexing
  // Processes in batches to avoid UI lag
  // Indexes:
  //   1. New stories, journals, timeline entries
  //   2. Photo captions and tags
  //   3. Document titles and descriptions
  //   4. Voice transcriptions
  //   5. Chat history summaries
}
```

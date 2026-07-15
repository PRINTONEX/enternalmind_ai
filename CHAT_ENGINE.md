# EternalMind AI — Chat Engine

> **Version:** 2.0  
> **Architecture:** Memory-Grounded Conversational Pipeline  
> **See also:** [MEMORY_ENGINE.md](./MEMORY_ENGINE.md), [API_PROVIDER_SPEC.md](./API_PROVIDER_SPEC.md), [README.md](./README.md)

---

## Core Principle

> "Chat is NOT normal ChatGPT. It must answer as the Digital Human."

Every message the AI sends must be grounded in:
1. The **profile identity** (who the Digital Human is)
2. **Retrieved memories** (what the Digital Human knows)
3. **Conversation history** (what was just discussed)
4. **Conversation style** (how the Digital Human speaks)

---

## Chat Pipeline

```
User sends message
    │
    ▼
┌──────────────────────────────────────────────────────────┐
│  1. Receive & Validate                                    │
│     ├── Check for empty/whitespace messages               │
│     ├── Check for attachment data (photos, voice, docs)   │
│     ├── Save user message to chat_history immediately      │
│     └── Return typing indicator to UI                     │
├──────────────────────────────────────────────────────────┤
│  2. Memory Retrieval (parallel)                           │
│     ├── MemoryRetrievalService.search(query)              │
│     ├── Search all memory sources (10+ sources)           │
│     └── Return ranked MemoryResult list                   │
├──────────────────────────────────────────────────────────┤
│  3. Context Assembly                                      │
│     ├── ContextBuilderService.build(profile + memories)   │
│     ├── Add system prompt (identity + rules)              │
│     ├── Add conversation history (last N exchanges)       │
│     ├── Add retrieved memories (top M results)            │
│     └── Trim to fit provider token budget                 │
├──────────────────────────────────────────────────────────┤
│  4. Provider Selection & Send                             │
│     ├── ProviderManager.selectProvider()                  │
│     │     (highest priority, healthy)                     │
│     ├── Send context to provider adapter                  │
│     └── Handle streaming or non-streaming response        │
├──────────────────────────────────────────────────────────┤
│  5. Receive & Display                                     │
│     ├── Stream tokens to UI in real-time                  │
│     ├── Track citations (which memories were used)        │
│     ├── Display thinking indicator (optional)             │
│     └── On completion:                                    │
│         ├── Save AI response to chat_history              │
│         ├── Save sources/citations                        │
│         ├── Update provider stats (latency, tokens)       │
│         └── Trigger memory update cycle                   │
├──────────────────────────────────────────────────────────┤
│  6. Generate Suggestions (background)                     │
│     ├── Analyze last exchange                             │
│     ├── Generate 3 suggested follow-up prompts            │
│     └── Display below chat input                          │
└──────────────────────────────────────────────────────────┘
```

---

## Streaming Architecture

### Stream Lifecycle

```
User sends message
    │
    ▼
ChatProvider.sendMessage(text)
    │
    ├── Optimistic UI: add user message immediately
    │
    ├── Start loading state (thinking indicator)
    │
    ├── Memory search (parallel, await)
    │
    ├── Context build (sync, fast)
    │
    ├── ProviderManager.sendStream()
    │     │
    │     ├── Choose provider
    │     ├── Open SSE/WebSocket
    │     │
    │     ├── Stream loop:
    │     │   ├── Receive token
    │     │   ├── Yield to StreamController
    │     │   ├── UI appends to streaming text
    │     │   └── (User can tap Stop)
    │     │
    │     ├── Stream complete:
    │     │   ├── Save full response to chat_history
    │     │   ├── Set streaming state = false
    │     │   └── Trigger post-processing
    │     │
    │     └── Stream error:
    │           ├── FailoverHandler.retryOrFailover()
    │           ├── If failover: show notification, retry on next provider
    │           └── If all fail: show error state, preserve user message
    │
    └── Generate suggested prompts (after response)
```

### Token Display Strategy

```dart
class StreamingTextController {
  final StringBuffer _buffer = StringBuffer();
  final int _charRevealDelayMs = 30; // Character-by-character appearance
  
  // For maximum smoothness, tokens are buffered and flushed
  // to the UI every 50ms (20fps refresh rate for text).
  // This prevents excessive widget rebuilds on every token.
  
  void addToken(String token) {
    _buffer.write(token);
    // Debounced UI update: 50ms throttle
    _scheduleUpdate();
  }
}
```

### Stop/Cancel

- User taps a "Stop" button visible during streaming.
- Stream subscription is cancelled.
- HTTP connection is closed.
- Partial response is saved to chat history.
- UI shows partial response as final.

---

## Attachments

### Supported Attachment Types

| Type | Max Size | Preview |
|---|---|---|
| Photo (jpg, png, webp) | 20MB | Thumbnail in message bubble |
| Voice Recording | 50MB | Audio waveform + play button |
| Document (pdf, docx, txt) | 30MB | Document icon + filename |
| Video (mp4) | 100MB | Thumbnail + duration badge |

### Attachment Flow

```
User attaches file to message
    │
    ├── Validate type and size
    ├── If photo: generate thumbnail (200×200)
    ├── Copy to app's local storage directory
    ├── Save attachment reference to database
    ├── Add preview to chat input bar
    │
    └── On send:
        ├── Include attachment metadata in context
        ├── For photos: send as vision input (if provider supports it)
        ├── For voice: send with transcript (if available)
        └── For documents: send with filename + description
```

### Vision Support

If the active provider supports vision:
- Photo attachments are encoded as base64 and sent as image_url content blocks.
- The AI can "see" the photo and describe it.
- If the provider doesn't support vision, photo metadata is included as text.

---

## Citations & Sources

Every AI response can include citations showing which memories were used.

### Citation Format

```dart
class Citation {
  final String sourceType;    // 'story', 'timeline', 'family', etc.
  final String sourceTitle;   // The title of the memory
  final String? snippet;      // The exact text used (truncated)
  final double relevanceScore; // How relevant this was
}
```

### Display in UI

```
AI Bubble
├── "I remember graduating in 2015. It was a sunny day..."
│
├── [Sources used]
│   ├── 📖 Education · Computer Science at MIT  [tap → view]
│   ├── 📅 Timeline · Graduation Day 2015        [tap → view]
│   └── 📸 Photo · Graduation ceremony            [tap → view]
│
└── [Tap source → navigates to the original memory detail screen]
```

### When to Cite

- **Always** show citation badges when memories are used.
- **Never** show citations for generic conversational phrases ("I see", "That's interesting").
- **Show** 1–3 most relevant citations per response (ranked by relevance score).
- **Expandable** — user can tap to see all citations.

---

## AI Thinking Mode

The AI can show its "reasoning" process before generating the final response.

### Thinking Display

```
User: "Tell me about your childhood."

AI Bubble:
├── [Thinking…]  ← 2–3 second delay
│   ├── "Recalling childhood memories..."
│   ├── "Found 8 relevant memories about childhood"
│   ├── "Most relevant: Growing up in Boston..."
│   └── "Formulating response..."
│
└── "I grew up in Boston, Massachusetts. My fondest memory..."
```

### Implementation

```dart
enum ThinkingStage {
  searching,        // "Searching memories..."
  analyzing,        // "Analyzing relevant memories..."
  formulating,      // "Formulating response..."
  responding,       // Actually streaming the response
}

class ThinkingState {
  final ThinkingStage stage;
  final String? message;
  final int memoryCount;
}
```

The thinking stage is optional and can be toggled in Settings. When disabled:
- The thinking indicator shows a simple animated dots animation.
- The response starts streaming when ready.

---

## Conversation History

### Storage

Each conversation is a sequence of `chat_history` records linked by session.

```dart
class ChatSession {
  final int? id;
  final int humanId;
  final String title;          // Auto-generated from first message
  final String? summary;       // Periodic summary for long sessions
  final int messageCount;
  final DateTime createdAt;
  final DateTime updatedAt;
}
```

### Session Management

- Conversations are grouped into sessions (user can start a new session).
- Sessions auto-title based on first user message (or AI summary).
- Sessions list shows: title, last message preview, date, message count.
- Sessions can be renamed, deleted, exported.

### History Retrieval

```dart
class ChatHistoryRepository {
  /// Get paginated messages for a session.
  Future<List<ChatMessage>> getSessionMessages(int sessionId, {int limit = 50, int offset = 0});
  
  /// Get recent sessions for a human.
  Future<List<ChatSession>> getSessions(int humanId, {int limit = 20});
  
  /// Search within chat history.
  Future<List<ChatMessage>> searchMessages(int humanId, String query);
  
  /// Get last N messages for context building.
  Future<List<ChatMessage>> getRecentMessages(int humanId, {int count = 10});
}
```

### Context Injection

When building context for the AI, the last N messages from the current session are included:

```dart
final recentMessages = await chatRepository.getRecentMessages(
  humanId,
  count: _contextSizeForModel(modelMaxTokens),
);

// Format as alternating user/assistant messages
final formattedHistory = recentMessages.map((m) => ChatMessage(
  role: m.role == 'user' ? MessageRole.user : MessageRole.assistant,
  content: m.message,
));
```

---

## Suggested Prompts

After each AI response, the system generates 3 suggested follow-up prompts.

### Generation Strategy

```dart
class SuggestedPromptService {
  Future<List<String>> generateSuggestions({
    required String userMessage,
    required String aiResponse,
    required List<MemoryResult> memories,
  }) async {
    // Strategy 1: Based on recent memories
    //   "Tell me more about [topic from memory]"
    
    // Strategy 2: Follow-up questions on the response
    //   "How did that make you feel?"
    
    // Strategy 3: Explore related memories
    //   "What happened after [event from response]?"
    
    // Strategy 4: Purely contextual (use a lightweight model or templates)
    
    // Return 3 suggestions with diversity scoring
  }
}
```

### Display

```
┌──────────────────────────────────────┐
│ Suggested questions:                  │
│                                      │
│  [💭 Tell me more about your time   ]│
│   at MIT                             │
│                                      │
│  [💭 What did you do after          ]│
│   graduation?                        │
│                                      │
│  [💭 Who was your favorite          ]│
│   professor?                         │
└──────────────────────────────────────┘
```

Tapping a suggested prompt sends it as a user message and triggers the full chat pipeline.

---

## Error Recovery

### Error Types

| Error | Cause | Recovery |
|---|---|---|
| Provider Timeout | AI took too long to respond | Retry 2× → failover |
| Provider Unauthorized | API key invalid/expired | Show error, prompt user to update key |
| Provider Rate Limited | Too many requests | Wait 30s → retry → failover |
| Network Error | No internet connection | Check connectivity → show offline state |
| Memory Search Failed | Database error | Skip memories, send without context |
| Context Overflow | Token count exceeds limit | Reduce history + memories, retry |
| Invalid Response | AI returned malformed response | Regenerate with stricter parameters |

### Retry Flow

```
Error Occurred
    │
    ├── Is it a provider error?
    │     ├── Yes → FailoverHandler.retryOrFailover()
    │     │            ├── Retry #1 (1s delay)
    │     │            ├── Retry #2 (2s delay)
    │     │            ├── Retry #3 (4s delay)
    │     │            ├── All failed → select next provider
    │     │            │     ├── Success? → "Provider A unavailable. Switched to Provider B."
    │     │            │     └── No provider? → Show error state
    │     │            └── Show user notification (non-blocking)
    │     │
    │     └── No → Handle locally
    │
    ├── Is it a context error?
    │     ├── Yes → Reduce context and retry (without user notification)
    │     └── No → Continue
    │
    └── Is it a database error?
          ├── Yes → Show error popup, log to console
          └── No → Continue
```

### Error User Interface

- **Provider switch**: Small toast/banner at top of chat screen (auto-dismiss 5s)
- **Network offline**: Persistent banner "You're offline. Using local services." (if local provider available)
- **API key invalid**: Dialog with action "Update API Key"
- **All providers failed**: Error state with "Check your providers" + link to Settings

### State Preservation

- User message is **never lost** during errors.
- If error occurs before AI responds, the user message remains visible and the input shows a "Retry" button.
- If error occurs during streaming, partial response is saved and retry starts from scratch.
- Full chat state is saved to the database before any external call.

---

## Chat Message Model

```dart
class ChatMessage {
  final int? id;
  final int humanId;
  final int? sessionId;
  final String role;           // 'user', 'assistant', 'system'
  final String message;
  final List<Attachment>? attachments;
  final List<Citation>? sources;
  final String? provider;      // Which provider generated this
  final String? model;         // Which model was used
  final int? tokensIn;
  final int? tokensOut;
  final int? latencyMs;
  final DateTime createdAt;
}
```

---

## Chat UI States

| State | Description | Visual |
|---|---|---|
| Idle | Waiting for user input | Normal chat view |
| Sending | User message sent, waiting for memory search | User bubble visible, thinking indicator shows |
| Searching | Memory engine is searching | "Searching memories..." in thinking indicator |
| Streaming | AI is generating response | Tokens appear character-by-character, stop button visible |
| Complete | Full response received | Normal state, suggested prompts appear |
| Error | Failure during generation | Error state in AI bubble, retry button |
| Stopped | User cancelled streaming | Partial response shown as final |

# EternalMind AI — AI Provider Specification

> **Version:** 2.0  
> **Architecture:** Multi-Provider Abstraction with Automatic Failover  
> **See also:** [SCHEMA.md](./SCHEMA.md), [ARCHITECTURE.md](./ARCHITECTURE.md), [README.md](./README.md)

---

## Architecture Overview

The AI Provider system is designed as a **pluggable abstraction layer** that allows unlimited AI providers to be added, removed, and dynamically selected. The system handles authentication, health monitoring, failover, streaming, and model discovery — all transparently to the chat engine.

```
┌──────────────────────────────────────────────────┐
│                  Chat Engine                      │
│  (sends messages, receives streams, shows UI)     │
└──────────────────────┬───────────────────────────┘
                       │
┌──────────────────────▼───────────────────────────┐
│              Provider Manager                      │
│  Routes requests to the correct provider adapter   │
│  Handles: priority, health checks, failover        │
└───────┬──────────────┬──────────────┬─────────────┘
        │              │              │
┌───────▼──────┐ ┌─────▼──────┐ ┌─────▼──────────┐
│ OpenAI       │ │ Groq       │ │ Gemini         │  ←  Provider Adapters
│ Adapter      │ │ Adapter    │ │ Adapter        │     (one file per provider)
├──────────────┤ ├────────────┤ ├────────────────┤
│ apiKey ✓     │ │ apiKey ✓   │ │ apiKey ✓       │
│ streaming ✓  │ │ streaming ✓│ │ streaming ✓    │
│ vision ✓     │ │ vision ✓   │ │ vision ✓       │
│ embeddings ✓ │ │ embeddings │ │ embeddings ✓   │
└──────────────┘ └────────────┘ └────────────────┘
        │              │              │
┌───────▼──────────────▼──────────────▼─────────────┐
│                Secure Storage                       │
│  (flutter_secure_storage — encrypted API keys)      │
└────────────────────────────────────────────────────┘
```

---

## Provider Abstraction

### Core Interface

All provider adapters implement a single abstract interface:

```dart
abstract class AIProviderAdapter {
  /// Unique provider type identifier (e.g., 'openai', 'groq').
  String get providerType;

  /// Human-readable name.
  String get displayName;

  /// Whether this provider supports streaming.
  bool get supportsStreaming;

  /// Whether this provider supports vision/image inputs.
  bool get supportsVision;

  /// Whether this provider supports embeddings.
  bool get supportsEmbeddings;

  /// Whether this provider supports speech-to-text.
  bool get supportsSTT;

  /// Whether this provider supports text-to-speech.
  bool get supportsTTS;

  /// Whether this provider supports image generation.
  bool get supportsImageGeneration;

  /// Send a chat completion request (streaming).
  Stream<String> chatStream({
    required List<ChatMessage> messages,
    required String model,
    double temperature = 0.7,
    double topP = 1.0,
    int maxTokens = 2048,
    Map<String, dynamic>? extraParams,
  });

  /// Send a chat completion request (non-streaming).
  Future<String> chat({
    required List<ChatMessage> messages,
    required String model,
    double temperature = 0.7,
    double topP = 1.0,
    int maxTokens = 2048,
    Map<String, dynamic>? extraParams,
  });

  /// Generate embeddings for a text input.
  Future<List<double>> generateEmbeddings({
    required String input,
    required String model,
  });

  /// Generate an image from a text prompt.
  Future<String> generateImage({
    required String prompt,
    String? style,
    String? size,
  });

  /// Transcribe audio to text.
  Future<String> transcribeAudio({
    required String audioPath,
    String? language,
    String? model,
  });

  /// Synthesize text to audio.
  Future<String> synthesizeSpeech({
    required String text,
    String? voice,
    String? model,
    double? speed,
  });

  /// Check if the provider is reachable and healthy.
  Future<ProviderHealth> checkHealth();

  /// Fetch available models from the provider.
  Future<List<String>> fetchModels();
}
```

### Provider Model Configuration

Each provider instance stored in the database includes:

| Field | Type | Description |
|---|---|---|
| `id` | int | Auto-increment primary key |
| `provider` | String | User-given name (e.g., "My OpenAI") |
| `providerType` | String | Adapter identifier (e.g., "openai") |
| `apiKey` | String | Encrypted, stored in secure storage |
| `baseUrl` | String? | Custom endpoint (for proxies, Ollama, LM Studio) |
| `model` | String | Active model name |
| `temperature` | double | 0.0 – 2.0 (default 0.7) |
| `topP` | double | 0.0 – 1.0 (default 1.0) |
| `maxTokens` | int | 1 – 128000 (default 2048) |
| `timeout` | int | Request timeout in seconds (default 30) |
| `priority` | int | Lower number = higher priority (0 = highest) |
| `status` | String | active / inactive / error |
| `latency` | double? | Average response time in ms |
| `failures` | int | Consecutive failure count |
| `requests` | int | Total request count |
| `cost` | double | Approximate total cost (for paid providers) |

---

## Supported Providers

The following adapters are planned. Each adapter normalizes the provider's API into the standard interface.

| Provider | Type | Streaming | Vision | Embeddings | STT | TTS | Image Gen |
|---|---|---|---|---|---|---|---|
| OpenAI | cloud | ✅ | ✅ | ✅ | ✅ (Whisper) | ✅ (TTS) | ✅ (DALL-E) |
| Groq | cloud | ✅ | ✅ (Llama 3.2) | ❌ | ❌ | ❌ | ❌ |
| Google Gemini | cloud | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| OpenRouter | cloud | ✅ | ✅ | ❌ | ❌ | ❌ | ✅ (routed) |
| Anthropic Claude | cloud | ✅ | ✅ | ❌ | ❌ | ❌ | ❌ |
| DeepSeek | cloud | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Mistral | cloud | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |
| Cohere | cloud | ✅ | ❌ | ✅ | ❌ | ❌ | ❌ |
| Together AI | cloud | ✅ | ✅ | ❌ | ❌ | ❌ | ✅ |
| Perplexity | cloud | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ |
| Fireworks | cloud | ✅ | ✅ | ❌ | ❌ | ❌ | ✅ |
| Ollama | local | ✅ | ✅ | ❌ | ❌ | ❌ | ❌ |
| LM Studio | local | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ |
| Custom API | any | varies | varies | varies | varies | varies | varies |

### Adding a New Provider

```dart
// 1. Create adapter file
class MyNewProviderAdapter implements AIProviderAdapter {
  // Implement all required methods
}

// 2. Register in provider registry
final providerRegistry = {
  'openai': (config) => OpenAIAdapter(config),
  'groq': (config) => GroqAdapter(config),
  'my_new_provider': (config) => MyNewProviderAdapter(config),
};

// 3. Add to database (handled by UI)
// The adapter is discovered by providerType string in the database
```

---

## Automatic Failover System

### Failover Flow

```
Request to Provider A (highest priority)
    │
    ├── Success → return response
    │
    └── Failure (timeout / 4xx / 5xx / network error)
         │
         ├── Increment failure count
         │
         ├── Retry (up to 3 times with exponential backoff)
         │     ├── Attempt 1: 1s delay
         │     ├── Attempt 2: 2s delay
         │     └── Attempt 3: 4s delay
         │
         ├── All retries failed?
         │     ├── Mark provider as 'error'
         │     ├── Log failure
         │     └── Select next provider by priority
         │
         ├── Next provider available?
         │     ├── Yes → "Provider A unavailable. Switched to Provider B."
         │     └── No  → "All providers unavailable. Please check your connections."
         │
         └── Continue conversation seamlessly
```

### Health Monitoring

```dart
class HealthMonitor {
  /// Interval between health checks (seconds).
  static const checkInterval = 60;

  /// Maximum consecutive failures before marking as error.
  static const maxFailures = 3;

  /// Timeout for health check request (seconds).
  static const healthCheckTimeout = 10;

  /// Threshold for "high latency" warning (ms).
  static const highLatencyThreshold = 5000;

  Future<ProviderHealth> checkHealth(AIProviderAdapter adapter);

  // Health result:
  // - healthy: latency < 5000ms, status 200
  // - degraded: latency > 5000ms or intermittent errors
  // - unhealthy: timeout or non-200 status
  // - error: connection refused, DNS failure
}
```

### Retry Strategy

| Attempt | Delay | Backoff |
|---|---|---|
| 1 | 1s | Base |
| 2 | 2s | Linear ×2 |
| 3 | 4s | Linear ×4 |
| Total timeout | 7s + request timeout | |

- After 3 failures, the provider is marked `error`.
- A background health monitor periodically retries errored providers.
- Once healthy, the provider is re-enabled and available for failover.
- Users are notified of provider switches via a non-blocking popup.

---

## Priority System

Providers are sorted by priority (lower number first).

```
Priority 0: Groq        (fastest, preferred for chat)
Priority 1: Gemini      (good fallback, free tier)
Priority 2: OpenAI      (reliable, slower)
Priority 3: Ollama      (local, always available, might be slower)
```

**Priority adjustment:**
- Auto: The system adjusts priority based on measured latency over the last 50 requests.
- Manual: Users can drag-reorder providers in Settings → AI Providers.
- The priority field in the database is the source of truth.

**Selection algorithm:**

```dart
AIProviderConfig selectProvider(List<AIProviderConfig> providers) {
  final healthy = providers
    .where((p) => p.status == 'active')
    .toList()
    ..sort((a, b) => a.priority.compareTo(b.priority));

  if (healthy.isEmpty) throw NoAvailableProviderException();

  return healthy.first; // Highest priority, healthy provider
}
```

---

## Streaming

### Streaming Architecture

```
ProviderManager.sendStream()
    │
    ├──► Selects provider (highest priority, healthy)
    │
    ├──► Adapter.chatStream(messages, model, ...)
    │       │
    │       ├──► HTTP SSE (Server-Sent Events) connection
    │       │     or WebSocket connection
    │       │
    │       └──► Parses tokens from stream
    │
    ├──► Yields tokens to ChatProvider
    │       │
    │       ├──► Updates UI in real-time
    │       ├──► Tracks token count
    │       └──► Supports cancel/stop
    │
    └──► On stream complete:
          ├──► Save complete response to chat_history
          ├──► Update provider stats (latency, tokens, cost)
          └──► Update memory if needed
```

### Stream Cancel

- User can tap "Stop" button to cancel streaming.
- Cancel closes the HTTP/WebSocket connection.
- Partial response (what was received) is saved to chat history.
- Provider is not penalized for user-initiated cancellation.

---

## Secure API Key Storage

### Storage Architecture

```
flutter_secure_storage
    ├── Key: 'provider_key_{providerId}'
    │   Value: encrypted API key
    │
    ├── Key: 'provider_base_url_{providerId}'
    │   Value: encrypted custom base URL (optional)
    │
    └── Key: 'encryption_salt'
        Value: random salt for key derivation
```

### Security Rules

- API keys are **never** stored in the database.
- The `ai_providers` table stores a `keyReference` field (not the key itself).
- Keys are encrypted at rest using platform-native encryption (Keychain on iOS, EncryptedSharedPreferences on Android).
- On first launch, the app generates a random encryption key and stores it in secure storage.
- API keys are **never** logged or printed.
- When exporting backups, API keys are **excluded** from JSON export. A placeholder `[KEY_EXCLUDED_FOR_SECURITY]` replaces the key.
- On import, the user must re-enter API keys.

---

## Local Models

### Architecture for Offline AI

```
Local Provider Adapter (Ollama / LM Studio / llama.cpp)
    │
    ├── Communicates with locally running process
    ├── HTTP API (localhost:11434 for Ollama)
    ├── No API key required
    ├── Supports same interface as cloud adapters
    └── Priority: user-configurable, but typically lowest for speed
```

### Model Management

```dart
class DownloadedModel {
  final int id;
  final String name;           // "llama3.2:3b"
  final String providerType;   // "ollama", "llamacpp"
  final String path;           // Local file path or docker container
  final int sizeInBytes;
  final int parameterCount;    // e.g., 3_000_000_000 for 3B
  final String status;         // downloading / ready / error
  final double downloadProgress; // 0.0 – 1.0
}
```

Users can:
- List available models from connected local providers
- Download models with progress tracking
- Delete downloaded models
- Set default local model for offline mode
- View model metadata (size, parameters, quantization)

---

## Custom Providers

Users can add any OpenAI-compatible API as a custom provider:

```
Custom API Provider
    ├── Name: "My Custom API"
    ├── Base URL: "https://api.myservice.com/v1"
    ├── API Key: (encrypted)
    ├── Model: "custom-model-name"
    ├── Supports streaming: (user toggle)
    └── Supports embeddings: (user toggle)
```

The custom adapter uses the same interface as OpenAI adapter but with a user-configured base URL. This supports:
- Any OpenAI-compatible API (together.ai, fireworks, etc.)
- Self-hosted models (Ollama, vLLM, Text Generation Inference)
- Corporate/proxy endpoints
- Regional API mirrors

---

## Fallback Priorities

When no providers are configured, the system should:

1. Show the **Add Provider** screen on first chat attempt.
2. Display a curated list of recommended providers with setup instructions.
3. Until a provider is added, show a helpful empty state.
4. Never crash or show a blank screen.

---

## Provider Status Lifecycle

```
         ┌──────────┐
         │   added   │  ← User configures a new provider
         └────┬─────┘
              │
              ▼
         ┌──────────┐
         │  pending  │  ← First health check in progress
         └────┬─────┘
              │
     ┌────────┴────────┐
     ▼                  ▼
┌─────────┐      ┌──────────┐
│  active  │      │  error    │  ← Health check failed
└────┬────┘      └────┬─────┘
     │                 │
     │ (health check   │ (background retry
     │  passes)        │  every 60s)
     │                 │
     └──────┬──────────┘
            ▼
      ┌─────────┐
      │  active  │
      └─────────┘

Inactive state (user-disabled): provider is skipped entirely.
```

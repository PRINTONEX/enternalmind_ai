# EternalMind AI — Voice Pipeline

> **Version:** 2.0  
> **Architecture:** Modular Voice I/O with Provider Abstraction  
> **See also:** [API_PROVIDER_SPEC.md](./API_PROVIDER_SPEC.md), [CHAT_ENGINE.md](./CHAT_ENGINE.md), [README.md](./README.md)

---

## Core Philosophy

Voice is not an afterthought — it is a **first-class interaction mode**. The Digital Human should be able to:

- **Listen** via Speech-to-Text (STT)
- **Think** via the Memory Engine + AI
- **Speak** via Text-to-Speech (TTS)
- **Be interrupted** and respond naturally
- **Work offline** (future) with local models

Everything is modular. Each voice capability is abstracted behind a provider interface, allowing different engines to be swapped without affecting the rest of the pipeline.

---

## Architecture Overview

```
┌──────────────────────────────────────────────────────┐
│                   Voice Pipeline                       │
│                                                        │
│  ┌──────────┐    ┌──────────┐    ┌──────────┐        │
│  │  STT     │    │  Memory  │    │  TTS     │        │
│  │  Engine  │───►│  Engine  │───►│  Engine  │        │
│  └──────────┘    └──────────┘    └──────────┘        │
│       │                                                │
│       ▼                                                │
│  ┌──────────┐                                          │
│  │  Voice   │                                          │
│  │  Activity│                                          │
│  │  Detect  │                                          │
│  └──────────┘                                          │
│       │                                                │
│       ▼                                                │
│  ┌──────────┐    ┌──────────┐                          │
│  │  Audio   │    │  Lip     │                          │
│  │  Player  │───►│  Sync    │──► (to Avatar Engine)    │
│  └──────────┘    └──────────┘                          │
│                                                        │
└──────────────────────────────────────────────────────┘
```

---

## Voice Interaction Modes

### Mode 1: Push-to-Talk

```
User taps mic button
    │
    ├── UI shows recording state (pulsing ring)
    ├── Audio is recorded (using platform audio recorder)
    │
    ├── User releases mic button
    │     │
    │     ├── Audio is sent to STT engine
    │     ├── STT returns text transcript
    │     ├── Transcript appears in chat input bar
    │     └── User can edit before sending
    │
    └── User taps send → enters normal chat pipeline
```

### Mode 2: Continuous Conversation (Hands-Free)

```
User taps "Listen" button
    │
    ├── Voice Activity Detector activates
    ├── System listens for speech
    │
    ├── Speech detected
    │     │
    │     ├── Buffered until silence detected (800ms pause)
    │     ├── Audio sent to STT
    │     ├── STT returns transcript
    │     ├── Transcript enters chat pipeline
    │     │
    │     ├── AI generates response
    │     ├── TTS speaks response aloud
    │     │
    │     └── System returns to listening state
    │
    ├── User says "Hey [Name]" → wake word detection (future)
    │
    └── User taps "Stop" → exits continuous mode
```

### Mode 3: Hybrid

- User types a message → AI responds with voice (TTS only)
- User speaks a message → AI responds with text (STT only)

This is useful for situations where one direction (input or output) is preferred.

---

## Speech-to-Text (STT)

### Provider Abstraction

```dart
abstract class STTProvider {
  String get providerType;
  bool get supportsRealTime;
  bool get supportsLanguageDetection;
  List<String> get supportedLanguages;

  /// Transcribe a complete audio file.
  Future<String> transcribeFile({
    required String audioPath,
    String? language,
  });

  /// Transcribe a stream of audio bytes (real-time).
  Stream<String> transcribeStream({
    required Stream<Uint8List> audioStream,
    String? language,
  });
}
```

### Supported STT Providers

| Provider | Type | Real-time | Languages | Accuracy | Cost |
|---|---|---|---|---|---|
| OpenAI Whisper (API) | Cloud | No | 99 | ★★★★★ | Per-minute |
| Whisper.cpp | Local | Yes | 99 | ★★★★☆ | Free |
| Google Speech-to-Text | Cloud | Yes | 125 | ★★★★★ | Per-minute |
| Platform STT (Android/iOS) | Local | Yes | Varies | ★★★☆☆ | Free |
| Deepgram (future) | Cloud | Yes | 30+ | ★★★★★ | Per-minute |
| Silero VAD | Local | Yes | — | VAD only | Free |

### Audio Preprocessing

Before STT, audio is preprocessed:

```dart
class AudioPreprocessor {
  Future<ProcessedAudio> preprocess(String rawPath) async {
    // 1. Convert to 16kHz mono WAV (standard STT format)
    // 2. Normalize volume (peak normalization)
    // 3. Remove background noise (basic noise gate)
    // 4. Split silences (for streaming VAD)
    // 5. Return processed audio
  }
}
```

---

## Text-to-Speech (TTS)

### Provider Abstraction

```dart
abstract class TTSProvider {
  String get providerType;
  bool get supportsSSML;
  bool get supportsEmotion;
  bool get supportsVoiceCloning;
  List<String> get availableVoices;

  /// Synthesize text to audio file.
  Future<String> synthesize({
    required String text,
    String? voice,
    double? speed,
    double? pitch,
    String? emotion,
    String? language,
  });

  /// Synthesize text to audio stream.
  Stream<Uint8List> synthesizeStream({
    required String text,
    String? voice,
    double? speed,
    double? pitch,
    String? emotion,
    String? language,
  });

  /// Clone a voice from sample audio.
  Future<String> cloneVoice({
    required String samplePath,
    String? name,
  });
}
```

### Supported TTS Providers

| Provider | Type | Voice Cloning | Emotion | Quality | Cost |
|---|---|---|---|---|---|
| ElevenLabs | Cloud | ✅ | ✅ | ★★★★★ | Per-character |
| OpenAI TTS | Cloud | ❌ | ✅ | ★★★★☆ | Per-character |
| Google Cloud TTS | Cloud | ❌ | ✅ | ★★★★☆ | Per-character |
| Microsoft Edge TTS | Cloud (free) | ❌ | ❌ | ★★★☆☆ | Free |
| Platform TTS | Local | ❌ | ❌ | ★★☆☆☆ | Free |
| Piper TTS | Local | ❌ | ❌ | ★★★☆☆ | Free |
| Coqui AI (future) | Local | ✅ | ✅ | ★★★★☆ | Free |

### Voice Settings

```dart
class VoiceSettings {
  final String sttProvider;
  final String ttsProvider;
  final String voiceModel;        // e.g., "Rachel" for ElevenLabs
  final String accent;
  final double pitch;             // 0.5 – 2.0
  final double speed;             // 0.5 – 2.0
  final double volume;            // 0.0 – 1.0
  final String emotion;           // 'neutral', 'happy', 'sad', etc.
  final int pauseDuration;        // ms pause between sentences
  
  // Stored in voice_settings table
}
```

---

## Continuous Conversation Flow

```
[LISTENING]
    │
    ├── VAD: Silence → continue listening
    │
    ├── VAD: Speech detected
    │     │
    │     ├── Start audio buffer
    │     ├── Show voice wave animation
    │     ├── Buffering... (ring expands)
    │     │
    │     ├── VAD: Silence (800ms)
    │     │     │
    │     │     ├── Stop buffering
    │     │     ├── Process audio
    │     │     │
    │     │     ├── [PROCESSING]
    │     │     │     │
    │     │     │     ├── STT → text
    │     │     │     ├── Memory search
    │     │     │     ├── Context build
    │     │     │     ├── AI response (streaming)
    │     │     │     │
    │     │     │     └── [SPEAKING]
    │     │     │           │
    │     │     │           ├── TTS → audio file/stream
    │     │     │           ├── Audio player plays
    │     │     │           ├── Lip sync updates avatar
    │     │     │           ├── Show transcript + audio wave
    │     │     │           │
    │     │     │           ├── Finish speaking
    │     │     │           │
    │     │     │           └── [LISTENING] ← loop
    │     │     │
    │     │     └── Timeout (60s no speech) → auto-exit continuous mode
    │     │
    │     └── Speech continues → continue buffering
    │
    └── User taps "Stop" → exit continuous mode
```

---

## Voice Interruption

The user can interrupt the AI while it is speaking.

### Interruption Flow

```
AI is speaking (TTS playing)
    │
    ├── VAD detects user speech
    │     │
    │     ├── Interruption detected
    │     │     │
    │     │     ├── Stop TTS playback immediately
    │     │     ├── Stop lip sync animation
    │     │     ├── Save partial AI response to chat history
    │     │     ├── Start buffering user's speech
    │     │     └── Show "Listening..." indicator
    │     │
    │     └── User finishes speaking
    │           │
    │           ├── STT → text
    │           ├── New chat pipeline cycle
    │           └── AI responds (now with context of interruption)
    │
    └── No user speech → continue speaking
```

### Interruption Rules

- Interruption is only enabled in **Continuous Conversation** mode.
- In Push-to-Talk mode, the user must wait for the AI to finish.
- A short phrase ("Stop", "Hold on") counts as interruption.
- Background noise should not trigger interruption (VAD filters by energy threshold).
- User can set interruption sensitivity in Voice Settings.

---

## Voice Activity Detection (VAD)

### VAD Implementation

```dart
class VoiceActivityDetector {
  /// Energy threshold for speech detection (0.0 – 1.0).
  final double energyThreshold;
  
  /// Minimum speech duration to trigger (ms).
  final int minSpeechDuration = 200;
  
  /// Silence duration to mark end of speech (ms).
  final int silenceTimeout = 800;
  
  /// Buffer audio and detect speech/silence transitions.
  VoiceState processBuffer(Uint8List audioFrame) {
    // 1. Calculate RMS energy
    // 2. Compare to threshold
    // 3. Apply debounce (avoid flickering)
    // 4. Return: silence / speech_start / speech / speech_end
  }
}
```

### VAD States

```
silence ──────► speech_start ──────► speech ──────► speech_end ──────► silence
     (threshold)         (200ms)        (800ms gap)        (reset)
```

---

## Audio Flow Diagram

```
Recording
    │
    ▼
  [AudioStream] ───► VAD ───► Speech Detected?
                                │
                          ┌─────┴─────┐
                          │           │
                          ▼           ▼
                     [STT]       [Discard]
                          │
                          ▼
                     [Text] ───► [Chat Pipeline]
                                      │
                                      ▼
                                 [AI Response]
                                      │
                                      ▼
                                 [TTS]
                                      │
                                      ▼
                              [Audio Output] ───► [Speaker]
                                      │
                                      ▼
                              [Lip Sync Data] ───► [Avatar Engine]
```

---

## File Storage

### Audio File Management

```
App Storage Directory/
└── audio/
    ├── recordings/          ← User voice recordings (Voice Vault)
    │   ├── {uuid}.wav
    │   └── {uuid}.m4a
    │
    ├── tts_cache/           ← Cached TTS outputs (to avoid re-synthesis)
    │   └── {text_hash}.mp3
    │
    └── temp/                ← Temporary files (cleaned periodically)
        ├── stt_input.wav
        └── tts_output.mp3
```

### Caching Strategy

- TTS outputs are cached by text hash + voice setting hash.
- Cache TTL: 24 hours.
- Cache size limit: 100MB.
- Oldest entries are evicted first.

---

## Future Offline Speech

### Local STT (Whisper.cpp)

```dart
class WhisperCppSTT implements STTProvider {
  // Runs on-device via whisper.cpp Dart bindings
  // Model sizes: tiny (75MB), base (150MB), small (500MB)
  // Models downloaded from within the app
  // Works completely offline
  // Accuracy: good for clean speech, acceptable for noisy
}
```

### Local TTS (Piper)

```dart
class PiperTTS implements TTSProvider {
  // Runs on-device via Piper TTS engine
  // Model sizes: 10–50MB per voice
  // Supports multiple languages
  // Quality: good for basic speech, limited emotion
}
```

### Offline Voice Pipeline

```
Local STT → Memory Engine → Local AI → Local TTS → Avatar
                    (all offline, no network required)
```

This is the ultimate goal for Phase 6 — a fully offline voice experience.

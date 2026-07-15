# EternalMind AI — Avatar Pipeline

> **Version:** 2.0  
> **Architecture:** Modular Avatar System with Multiple Renderer Support  
> **See also:** [VOICE_PIPELINE.md](./VOICE_PIPELINE.md), [README.md](./README.md), [SCHEMA.md](./SCHEMA.md)

---

## Core Philosophy

The Avatar gives the Digital Human a **visual presence**. It evolves across phases:

1. **Static avatar** — A generated image with emotion expressions
2. **Animated avatar** — Idle animation (breathing, blinking) + talking animation (lip sync)
3. **Video avatar** — Full talking-head video with lip sync, expression, natural movement

All avatar types share a common abstraction layer. The chat and voice pipelines never need to know which avatar engine is being used.

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                    Avatar Pipeline                           │
│                                                              │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐  │
│  │  Image Gen   │    │  Expression  │    │  Animation   │  │
│  │  Engine      │───►│  Engine      │───►│  Engine      │  │
│  └──────────────┘    └──────────────┘    └──────────────┘  │
│        │                                                     │
│        ▼                                                     │
│  ┌──────────────┐    ┌──────────────┐                        │
│  │  Lip Sync    │    │  Eye/Gaze    │                        │
│  │  Engine      │    │  Engine      │                        │
│  └──────────────┘    └──────────────┘                        │
│        │                                                     │
│        ▼                                                     │
│  ┌──────────────────────────────────────────────────┐       │
│  │           Avatar Renderer                         │       │
│  │  (StaticImage / Live2D / Video / 3D)              │       │
│  └──────────────────────────────────────────────────┘       │
│                                                              │
│  Inputs: Chat State, Voice State, Emotion State              │
│  Output: Visual Frame → Display Widget                       │
└──────────────────────────────────────────────────────────────┘
```

---

## Avatar Generation

### Static Avatar Creation

On profile creation, the system generates an initial avatar image.

```dart
class AvatarGenerationService {
  Future<AvatarModel> generateAvatar({
    required int humanId,
    required String profilePhotoPath,    // User's reference photo
    String? style,                        // 'realistic', 'anime', 'painting', etc.
    String? prompt,                       // Additional customization
  }) async {
    // 1. Select best AI provider for image generation
    // 2. Build prompt from profile data:
    //    "A portrait of [name], [age] years old, [style],
    //     based on this reference photo: [photo]"
    // 3. Generate image
    // 4. Save to local storage
    // 5. Create AvatarModel record in database
    // 6. Return model
  }
}
```

### Avatar Model

```dart
class AvatarModel {
  final int? id;
  final int humanId;
  final String imagePath;       // Local file path to avatar image
  final String style;           // 'realistic', 'anime', 'painting', '3d', 'pixel'
  final String? expression;     // Current expression state
  final String? clothing;       // Clothing description
  final String? prompt;         // Generation prompt used
  final bool isDefault;         // Whether this is the active avatar
  final DateTime createdAt;
}
```

### Supported Image Generation Providers

| Provider | Type | Styles | Quality | Cost |
|---|---|---|---|---|
| OpenAI DALL-E 3 | Cloud | Realistic, Vivid | ★★★★★ | Per-image |
| Stability AI | Cloud | Many (anime, painting, etc.) | ★★★★★ | Per-image |
| Gemini | Cloud | Realistic | ★★★★☆ | Free tier |
| Local SD (future) | Local | Any | ★★★★☆ | Free |

---

## Expression System

### Expression States

```dart
enum Expression {
  neutral,        // Default, relaxed face
  happy,          // Smiling, warm
  sad,            // Downward expression
  thinking,       // Slight head tilt, raised eyebrow
  surprised,      // Eyes wide, mouth slightly open
  concerned,      // Furrowed brow
  laughing,       // Wide smile, eyes crinkled
  crying,         // Tears, distressed
  angry,          // Tense jaw, narrowed eyes
  loving,         // Soft eyes, gentle smile
  sleepy,         // Heavy eyelids, relaxed
}
```

### Expression Selection Logic

```dart
class ExpressionService {
  Expression determineExpression({
    required String? aiResponse,       // What the AI said
    required String? aiEmotion,        // If AI provides emotion metadata
    required String userMessage,       // What user said
    required String? userEmotion,      // Detected user emotion (from voice/text)
  }) {
    // Priority:
    // 1. AI-specified emotion (if provider supports it)
    // 2. Detect from AI response sentiment
    // 3. Mirror user's emotion (empathy)
    // 4. Default: neutral or thinking
    
    // Examples:
    // "That's wonderful!" → happy
    // "I'm sorry to hear that" → sad/concerned
    // "Let me think..." → thinking
    // "I love you too" → loving
    // "That's hilarious!" → laughing
  }
}
```

### Expression Implementation

| Phase | Implementation |
|---|---|
| Phase 4a (Static) | Pre-rendered expression images (generated via AI) |
| Phase 4b (Animated) | SVG/Lottie expression layers overlaid on base image |
| Phase 4c (Live2D) | Live2D model with expression parameters |
| Phase 7 (Video) | Real-time face expression rendering |

**For Phase 4a:**

```dart
class StaticExpressionRenderer {
  Future<String> generateExpressionImage({
    required String baseAvatarPath,
    required Expression expression,
  }) async {
    // Use image generation API with prompt:
    // "Same person as [base image], but with [expression] expression"
    // Return rendered image path
  }
}
```

---

## Lip Sync

### Lip Sync Pipeline

```
TTS Audio Output
    │
    ▼
┌─────────────────────────────┐
│     Lip Sync Engine         │
│                             │
│  ┌───────────────────────┐  │
│  │ Phoneme Extraction    │  │  ← Extract phonemes from text or audio
│  │                       │  │
│  │ Input: TTS text OR    │  │
│  │        Audio waveform │  │
│  │                       │  │
│  │ Output: Phoneme       │  │
│  │         timeline      │  │
│  └───────────────────────┘  │
│                             │
│  ┌───────────────────────┐  │
│  │ Viseme Mapping        │  │  ← Map phonemes to mouth shapes
│  │                       │  │
│  │ Phoneme → Viseme      │  │
│  │ 'm'   → mouth_closed  │  │
│  │ 'aa'  → mouth_open    │  │
│  │ 'iy'  → mouth_wide    │  │
│  │ ...                   │  │
│  └───────────────────────┘  │
│                             │
│  ┌───────────────────────┐  │
│  │ Frame Generation      │  │  ← Generate mouth frames
│  │                       │  │
│  │ Output: mouth state   │  │
│  │ per audio frame       │  │
│  └───────────────────────┘  │
│                             │
└─────────────────────────────┘
            │
            ▼
    Avatar Expression Layer
    (mouth shape updated per frame)
```

### Viseme Set

| Viseme | Phonemes | Mouth Shape |
|---|---|---|
| A | `aa`, `ae`, `ah` | Wide open |
| B | `m`, `p`, `b` | Closed |
| C | `f`, `v` | Lower lip on teeth |
| D | `th`, `dh` | Tongue between teeth |
| E | `iy`, `ih` | Wide smile |
| F | `w`, `uw` | Rounded, puckered |
| G | `eh`, `er` | Mid-open |
| H | `s`, `z` | Teeth together |
| I | `sh`, `zh` | Slightly puckered |
| J | `n`, `t`, `d` | Tongue on palate |
| K | `k`, `g`, `ng` | Wide, back open |
| Silence | — | Closed, relaxed |

---

## Eye Movement & Gaze

### Eye Animation System

```dart
class EyeAnimationService {
  /// Generate natural blink pattern (every 2–4 seconds).
  BlinkState generateBlink(double timeSinceLastBlink) {
    // Blink duration: 100–200ms
    // Full closure + reopen
    // Random interval: 2–6 seconds
  }
  
  /// Generate natural saccadic movement.
  GazePoint generateGaze(GazeState state) {
    // Micro-movements every 200–500ms
    // Fixation periods: 1–5 seconds
    // Return (x, y) offset for pupil position
  }
  
  /// Generate smooth pursuit (following moving object).
  GazePoint generatePursuit(Offset targetPosition) {
    // Smooth tracking at ~30°/s
    // Limited range (±15° from center)
  }
}
```

### Gaze Behaviors

| Context | Behavior |
|---|---|
| Idle | Random micro-movements, occasional blinks |
| Listening | Fixed on user direction, occasional blinks |
| Thinking | Upward/away gaze, reduced blink rate |
| Speaking | Direct gaze, more expressive blinks |
| User interrupts | Quick glance toward user |

---

## Idle Animation

When the Digital Human is not speaking, subtle idle animations keep the avatar feeling alive.

### Idle Animation Layers

```
Layer 1: Micro-movements
    ├── Subtle breathing (chest/shoulder rise and fall)
    ├── 4-second cycle, amplitude: 2–4 pixels
    └── Implemented as continuous sine wave

Layer 2: Blink
    ├── Every 2–6 seconds (randomized)
    ├── 150ms blink duration
    └── Coordinate with eye movement

Layer 3: Head movement
    ├── Subtle shifts (every 5–15 seconds)
    ├── Slight tilt (2–5 degrees)
    └── Random direction

Layer 4: Expression transitions
    ├── Gradual transition between expressions
    ├── Duration: 500ms–1s
    └── Micro-expressions (100ms, barely perceptible)
```

### Idle Animation State Machine

```
neutral ──► blink ──► neutral
neutral ──► micro_head_tilt ──► neutral
neutral ──► expression_shift ──► neutral
neutral ──► breath_cycle (continuous)
```

---

## Talking Animation

When the AI speaks, the avatar enters "talking" mode.

### Talking State

```
TTS starts
    │
    ▼
Idle State ──► Talking State
    │               │
    │               ├── Lip sync active (mouth follows visemes)
    │               ├── Eye movement: direct gaze with blinks
    │               ├── Head: subtle nod/movement with speech rhythm
    │               ├── Expression: matches speech content
    │               └── Breathing: faster rate during speech
    │
    └── TTS ends
            │
            ▼
    Return to Idle State
    (with post-speech expression hold for 1–2 seconds)
```

### Talking Animation Parameters

| Parameter | Value |
|---|---|
| Mouth open speed | 80ms |
| Mouth close speed | 100ms |
| Head nod frequency | 1 nod per 3–5 seconds |
| Head nod amplitude | 3–6 degrees |
| Blink rate while talking | Reduced (every 4–8 seconds) |
| Expression change delay | 500ms after emotion shift |

---

## Video Avatar Pipeline (Phase 7)

### Architecture

```
Text Response
    │
    ▼
TTS Engine
    │
    ├──► Audio file
    │
    ▼
Video Avatar Engine
    │
    ├── SadTalker:   Still image + audio → talking head video
    ├── Wav2Lip:     Any face video + audio → lip-synced video
    ├── MuseTalk:    Real-time full-body talking avatar
    └── Custom:      API-based video generation
    │
    ▼
Video File
    │
    ▼
Video Player (rendered in avatar widget)
```

### SadTalker Pipeline

```dart
class SadTalkerPipeline {
  Future<String> generateTalkingVideo({
    required String sourceImage,    // Avatar still image
    required String audioFile,      // TTS output
    String? expression,             // Emotional expression
  }) async {
    // 1. Preprocess: align face in source image
    // 2. Extract audio features (mel spectrogram)
    // 3. Generate 3D face motion coefficients
    // 4. Render video frames with motion + expression
    // 5. Composite frames into video
    // 6. Return video file path
  }
}
```

### Wav2Lip Pipeline

```dart
class Wav2LipPipeline {
  Future<String> syncLipMovement({
    required String sourceVideo,    // Pre-generated or real
    required String audioFile,      // TTS output
  }) async {
    // 1. Extract face from video frames
    // 2. Sync lip movement to audio
    // 3. Composite synced lips onto original video
    // 4. Return video file path
  }
}
```

### MuseTalk / Real-Time

```dart
class MuseTalkPipeline {
  // Real-time (30+ fps) full-body avatar
  // Input: audio stream + latent face representation
  // Output: video frames at 30fps
  // Latency: < 200ms
  // Requires: GPU (desktop) or NPU (mobile future)
}
```

---

## Avatar Renderer Architecture

### Renderer Abstraction

```dart
abstract class AvatarRenderer {
  /// Render a single frame.
  Widget render(AvatarState state);

  /// Update avatar state.
  void updateState(AvatarState newState);

  /// Get the current frame as an image (for screenshots).
  Future<Uint8List> captureFrame();
}

// Implementations:
class StaticImageRenderer implements AvatarRenderer { ... }
class Live2DRenderer implements AvatarRenderer { ... }
class VideoPlayerRenderer implements AvatarRenderer { ... }
class ThreeDRenderer implements AvatarRenderer { ... } // Future
```

### Avatar State (shared across renderers)

```dart
class AvatarState {
  final Expression expression;
  final LipSyncState lipSync;       // Current mouth shape
  final GazeState gaze;             // Eye position
  final HeadState head;             // Head rotation/tilt
  final AnimationMode mode;         // idle / talking / thinking / listening
  final BlinkState blink;           // Blink phase
  final BreathingState breathing;   // Breathing phase
}
```

### Renderer Selection

The appropriate renderer is selected based on available avatar data:

| Has | Renderer |
|---|---|
| Static image only | `StaticImageRenderer` |
| Static image + expression layers | `StaticImageRenderer` with expression overlays |
| Live2D model files | `Live2DRenderer` |
| Video pipeline files | `VideoPlayerRenderer` |
| 3D model files (future) | `ThreeDRenderer` |

---

## Avatar Data Flow

```
┌─────────────────────────────────────────────────────┐
│                     Event Sources                     │
│                                                       │
│  Chat Engine    Voice Pipeline    User Activity       │
│  (new message)  (speaking state)  (idle, active)     │
└─────────────────────┬───────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────────┐
│              Avatar State Manager                     │
│                                                       │
│  Listens to events and updates AvatarState:           │
│  - On chat message → expression = matching           │
│  - On TTS start → mode = talking, lip sync active    │
│  - On TTS end → mode = idle                          │
│  - On idle 5s → expression → neutral                 │
│  - Timer → blink cycle                               │
│  - Timer → gaze movement                             │
└─────────────────────┬───────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────────┐
│              Avatar Renderer                          │
│                                                       │
│  Receives updated AvatarState and renders frame       │
│  - Extracts expression parameters                    │
│  - Applies lip sync frame                            │
│  - Updates eye position                              │
│  - Adjusts head position                             │
│  - Returns widget to display                         │
└─────────────────────┬───────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────────┐
│              Avatar Display Widget                    │
│                                                       │
│  Shows the rendered avatar in the UI                  │
│  - Size: configurable (SM, MD, LG, XL, XXL)          │
│  - Glass container (optional circular frame)          │
│  - Glow effect based on speaking state               │
└─────────────────────────────────────────────────────┘
```

---

## Avatar Storage

```
App Storage Directory/
└── avatars/
    ├── {humanId}/
    │   ├── generated/
    │   │   ├── avatar_default.png          ← Original generated
    │   │   ├── avatar_happy.png            ← Pre-rendered expression
    │   │   ├── avatar_sad.png
    │   │   └── ... (one per expression)
    │   │
    │   ├── live2d/                         ← Live2D model files
    │   │   ├── model.json
    │   │   ├── texture.png
    │   │   └── physics.json
    │   │
    │   ├── video/                          ← Generated video avatars
    │   │   ├── talking_001.mp4
    │   │   └── talking_002.mp4
    │   │
    │   └── cache/                          ← Animation cache
    │       ├── lip_sync_cache.bin
    │       └── expression_cache.bin
    │
    └── shared/
        └── default_avatar.png              ← Fallback if no avatar
```

---

## Future Digital Human Architecture

### Vision (Phase 7+)

```
┌────────────────────────────────────────────────────┐
│              Digital Human                            │
│                                                        │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  │
│  │  Memory      │  │  AI Core    │  │  Personality │  │
│  │  Engine      │  │  (LLM)      │  │  Engine      │  │
│  └─────────────┘  └─────────────┘  └─────────────┘  │
│                                                        │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  │
│  │  Voice       │  │  Avatar     │  │  Emotion     │  │
│  │  Pipeline    │  │  Pipeline   │  │  Engine      │  │
│  └─────────────┘  └─────────────┘  └─────────────┘  │
│                                                        │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  │
│  │  Gesture    │  │  Gaze       │  │  Breathing  │  │
│  │  Engine     │  │  Engine     │  │  Engine     │  │
│  └─────────────┘  └─────────────┘  └─────────────┘  │
│                                                        │
│  ┌──────────────────────────────────────────────────┐ │
│  │         3D Renderer (Unity/Unreal)               │ │
│  │  Real-time photorealistic Digital Human           │ │
│  └──────────────────────────────────────────────────┘ │
└────────────────────────────────────────────────────────┘
```

### Design Principles for Future Architecture

1. **Separation of concerns** — Each engine is independent and replaceable.
2. **Synchronization** — All engines run on a shared clock/timeline for perfect sync.
3. **Pluggable renderers** — The underlying renderer (2D, Live2D, 3D, video) is transparent.
4. **Progressive enhancement** — A static image avatar works the same way as a full 3D model from the pipeline perspective.
5. **Performance scaling** — Complex rendering automatically downgrades on lower-end devices.

---

## Avatar Widget Structure

```dart
/// Main avatar display widget used throughout the app.
class AvatarDisplay extends ConsumerWidget {
  const AvatarDisplay({
    super.key,
    required this.size,         // AvatarSize enum (SM, MD, LG, XL, XXL)
    this.showGlow = true,       // Whether to show neon glow ring
    this.showExpression = true, // Show expression indicator
    this.onTap,                 // Tap handler
    this.circular = true,       // Circular crop
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarState = ref.watch(avatarStateProvider);
    final avatarData = ref.watch(activeAvatarProvider);
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.value,
        height: size.value,
        decoration: BoxDecoration(
          shape: circular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: circular ? null : BorderRadius.circular(12),
          boxShadow: showGlow ? _getGlowShadow(avatarState) : null,
        ),
        child: ClipRRect(
          borderRadius: /* match container */,
          child: Stack(
            children: [
              // Base avatar image
              _buildBaseImage(avatarData),
              
              // Expression overlay (if applicable)
              if (showExpression && avatarState.expression != Expression.neutral)
                _buildExpressionOverlay(avatarData, avatarState.expression),
              
              // Lip sync overlay (if talking)
              if (avatarState.mode == AnimationMode.talking)
                _buildLipSyncOverlay(avatarState.lipSync),
              
              // Glow ring (if speaking)
              if (showGlow && avatarState.mode == AnimationMode.talking)
                _buildSpeakingGlowRing(),
            ],
          ),
        ),
      ),
    );
  }
}
```

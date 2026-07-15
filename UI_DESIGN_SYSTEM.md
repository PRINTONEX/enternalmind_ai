# EternalMind AI — UI Design System

> **Version:** 2.0  
> **Theme:** Dark Futuristic / Glassmorphism / Cyberpunk / Neon / Minimal / Premium  
> **Platform:** Flutter (mobile-first, multi-platform)  
> **See also:** [ARCHITECTURE.md](./ARCHITECTURE.md), [PROJECT_RULES.md](./PROJECT_RULES.md)

---

## Design Philosophy

EternalMind AI's visual identity communicates **premium intelligence**, **emotional depth**, and **futuristic minimalism**.

- **Dark first** — the default and only theme. Light mode is not planned.
- **Glass as canvas** — frosted glass surfaces create depth and hierarchy.
- **Neon as accent** — glowing elements guide attention to interactive areas.
- **Smooth motion** — every animation serves a purpose (feedback, focus, delight).
- **No Material defaults** — every widget is custom-styled to the design system.

---

## Color Palette

### Core Colors

```
Primary (Purple)          #7C3AED   hsl(270, 80%, 50%)
Primary Light             #8B5CF6   hsl(252, 87%, 66%)
Primary Dark              #5B21B6   hsl(258, 75%, 42%)

Secondary (Cyan)          #06B6D4   hsl(188, 94%, 43%)
Secondary Light           #22D3EE   hsl(188, 86%, 53%)
Secondary Dark            #0891B2   hsl(189, 92%, 36%)

Accent (Pink)             #EC4899   hsl(330, 81%, 60%)
Accent Light              #F472B6   hsl(330, 86%, 71%)
Accent Dark               #DB2777   hsl(330, 71%, 50%)

Deep Blue                 #0F172A   hsl(222, 47%, 11%)
Deep Blue Light           #1E293B   hsl(222, 43%, 17%)
Deep Blue Medium          #334155   hsl(216, 28%, 27%)
```

### Functional Colors

```
Success                   #10B981   hsl(160, 84%, 39%)
Warning                   #F59E0B   hsl(38, 92%, 50%)
Error                     #EF4444   hsl(0, 84%, 60%)
Info                      #3B82F6   hsl(217, 91%, 60%)

Success Dark              #065F46
Warning Dark              #92400E
Error Dark                #991B1B
Info Dark                 #1E40AF
```

### Surface Colors

```
Surface (base)            #0A0E1A   hsl(226, 44%, 6%)
Surface Elevated          #111827   hsl(221, 39%, 10%)
Surface Card              #1A1F33   hsl(223, 34%, 15%)
Surface Glass             rgba(20, 25, 45, 0.75)   (glass background)
Surface Input             rgba(255, 255, 255, 0.05)

Glass Border              rgba(255, 255, 255, 0.12)
Glass Border Light        rgba(255, 255, 255, 0.18)
Glass Blur                12px (backdropFilter)
```

### Text Colors

```
Text Primary              #F8FAFC   hsl(210, 40%, 98%)
Text Secondary            #94A3B8   hsl(216, 20%, 65%)
Text Tertiary             #64748B   hsl(216, 16%, 50%)
Text Disabled             #475569   hsl(216, 13%, 35%)

Text on Primary           #FFFFFF
Text on Surface           #F8FAFC
Text Link                 #8B5CF6
Text Error                #FCA5A5
Text Neon Primary         #C084FC   (glowing primary text)
Text Neon Secondary       #67E8F9   (glowing secondary text)
```

### Gradient Presets

```
Neon Purple    ← #7C3AED → #8B5CF6
Neon Cyan      ← #06B6D4 → #22D3EE
Sunset         ← #7C3AED → #EC4899
Ocean          ← #06B6D4 → #3B82F6
Deep Space     ← #0F172A → #1E293B
Glass Highlight ← rgba(255, 255, 255, 0.1) → rgba(255, 255, 255, 0.02)
```

---

## Typography

### Font Family

- **Primary:** `Inter` (sans-serif, variable weight)
- **Monospace:** `JetBrains Mono` (for code, timestamps, data)
- **Emoji:** System default

Inter loaded via Google Fonts (`google_fonts` package).

### Type Scale

```
Display 1   → Inter ExtraBold         42/48   letter-spacing -0.02
Display 2   → Inter Bold              34/40   letter-spacing -0.02
Heading 1   → Inter SemiBold          28/34   letter-spacing -0.01
Heading 2   → Inter SemiBold          22/28   letter-spacing -0.01
Heading 3   → Inter SemiBold          18/24   letter-spacing normal
Subheading  → Inter Medium             16/22   letter-spacing 0.01
Body Large  → Inter Regular            16/24   letter-spacing 0.01
Body        → Inter Regular            14/20   letter-spacing 0.01
Body Small  → Inter Regular            12/16   letter-spacing 0.02
Caption     → Inter Medium             11/14   letter-spacing 0.03
Label       → Inter SemiBold           13/18   letter-spacing 0.02
Button      → Inter SemiBold           14/18   letter-spacing 0.03
Monospace   → JetBrains Mono Regular   14/20   letter-spacing normal
```

### Text Styles in Code

```dart
// Defined in core/theme/app_typography.dart
TextStyle display1 = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w800,
  fontSize: 42,
  height: 48 / 42,
  letterSpacing: -0.02,
);

// Usage
Text('EternalMind', style: context.textStyle.display1);
Text('Memory Search', style: context.textStyle.heading2);
Text('Last active 2h ago', style: context.textStyle.caption);
```

### Neon Text Effect

```dart
// Primary neon glow
TextStyle neonPrimary = TextStyle(
  color: AppColors.textNeonPrimary,
  shadows: [
    Shadow(color: AppColors.primary.withOpacity(0.5), blurRadius: 8),
    Shadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 16),
    Shadow(color: AppColors.primary.withOpacity(0.1), blurRadius: 24),
  ],
);
```

---

## Spacing & Sizing

### Spacing Scale (8px grid)

```
Space 1  →  4px    (quarter-step)
Space 2  →  8px    (base)
Space 3  →  12px
Space 4  →  16px
Space 5  →  20px
Space 6  →  24px
Space 7  →  32px
Space 8  →  40px
Space 9  →  48px
Space 10 →  64px
```

### Border Radius

```
Radius XS    →  4px    (badges, tags)
Radius SM    →  8px    (buttons, inputs)
Radius MD    →  12px   (cards, dialogs)
Radius LG    →  16px   (modals, sheets)
Radius XL    →  20px   (containers, bottom nav)
Radius Full  →  999px  (pills, avatars)
```

### Icon Sizes

```
Icon XS    →  14px
Icon SM    →  18px
Icon MD    →  22px
Icon LG    →  28px
Icon XL    →  36px
Icon Hero  →  48px
```

### Avatar Sizing

```
Avatar SM  →  32px  (chat bubbles, list items)
Avatar MD  →  48px  (family tree nodes, timeline)
Avatar LG  →  72px  (profile cards, settings)
Avatar XL  →  120px (profile header, dashboard hero)
Avatar XXL →  200px (generated avatar preview)
```

---

## Shadows

```dart
// Surface shadow (subtle depth on dark surfaces)
Shadow surface = BoxShadow(
  color: Colors.black.withOpacity(0.2),
  blurRadius: 4,
  offset: const Offset(0, 2),
);

// Glass shadow (for glassmorphism cards)
Shadow glass = BoxShadow(
  color: Colors.black.withOpacity(0.3),
  blurRadius: 16,
  offset: const Offset(0, 8),
);

// Neon glow (purple)
Shadow glowPurple = BoxShadow(
  color: AppColors.primary.withOpacity(0.3),
  blurRadius: 12,
  spreadRadius: 1,
);

// Neon glow (cyan)
Shadow glowCyan = BoxShadow(
  color: AppColors.secondary.withOpacity(0.3),
  blurRadius: 12,
  spreadRadius: 1,
);

// Elevated shadow (for modals, dialogs)
Shadow elevated = BoxShadow(
  color: Colors.black.withOpacity(0.5),
  blurRadius: 32,
  offset: const Offset(0, 16),
);
```

---

## Component Library

### Glassmorphism Card

The foundational UI container.

```dart
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin,
    this.borderRadius = 12,
    this.glowColor,
    this.onTap,
  });

  // Implementation:
  // Container with:
  // - background: rgba(20, 25, 45, 0.75)
  // - borderRadius: 12
  // - border: Border.all(color: rgba(255, 255, 255, 0.12))
  // - backdropFilter: ImageFilter.blur(sigmaX: 12, sigmaY: 12)
  // - shadow: BoxShadow (see Glass shadow above)
}
```

**Variants:**
- `GlassCard` — standard, with/without glow border
- `GlassCard.tappable` — with `onTap`, hover effect, scale animation on press
- `GlassCard.hero` — larger, more prominent glow, for hero sections
- `GlassCard.transparent` — no background, just border and blur for overlays

### Buttons

```dart
// Primary action button — gradient purple, neon glow
class PrimaryButton extends StatelessWidget {
  // background: gradient(Neon Purple)
  // borderRadius: 8
  // height: 48
  // padding: horizontal 24
  // text: Button style, white, 14/18, letter-spacing 0.03
  // On hover: glow intensifies (larger spread + blur)
  // On press: scale 0.97
  // Disabled: opacity 0.4
}

// Secondary action — glass style, subtle border
class SecondaryButton extends StatelessWidget {
  // background: Surface Glass
  // border: Glass Border
  // On hover: border brightens
  // On press: scale 0.97
}

// Tertiary / Text — no background, minimal
class TextButton extends StatelessWidget {
  // color: Text Secondary
  // hover: color → Text Primary, subtle underline
}

// Icon button — circular, glass background
class IconButton extends StatelessWidget {
  // size: 40×40
  // background: Surface Glass
  // border: glass
  // icon color: Text Secondary → Primary on hover
}

// Mic button — special animation for voice input
class MicButton extends StatelessWidget {
  // Idle: glass circle
  // Listening: pulsing neon ring
  // Processing: spinning gradient ring
  // Error: red glow
}
```

### Input Fields

```dart
class GlassInput extends StatelessWidget {
  // decoration:
  //   filled: true
  //   fillColor: Surface Input (rgba(255, 255, 255, 0.05))
  //   border: OutlineInputBorder, radius: 8, color: transparent
  //   focusedBorder: color: Primary
  //   labelStyle: TextSecondary
  //   hintStyle: TextTertiary
  //   contentPadding: 16px horizontal, 14px vertical
  //   prefixIconColor: TextSecondary
  //   suffixIconColor: TextSecondary
  // text style: Body
  // cursorColor: Primary
}
```

**Variants:**
- `GlassInput` — default text input
- `GlassInput.multiline` — for longer text (journal, stories)
- `GlassInput.search` — with search icon, clear button
- `GlassInput.password` — with visibility toggle

### Chat Bubbles

```dart
// User message — dark glass, right-aligned
class UserBubble extends StatelessWidget {
  // background: Deep Blue Medium
  // borderRadius: 16 (top-right: 4 for user)
  // margin: 0,8
  // maxWidth: 75% of screen
  // text: Body, Text Primary
}

// AI message — glass with subtle purple border
class AIBubble extends StatelessWidget {
  // background: Surface Glass
  // border: Glass Border with subtle Primary tint
  // borderRadius: 16 (top-left: 4 for AI)
  // margin: 8,0
  // maxWidth: 75% of screen
  // text: Body, Text Primary
  // optional: citation chips below text
  // optional: thinking indicator while streaming
}

// System message — center, small text
class SystemBubble extends StatelessWidget {
  // text: Caption, Text Tertiary
  // centered, no bubble background
}
```

### Dialogs & Popups

```dart
class GlassDialog extends StatelessWidget {
  // background: Surface Card
  // borderRadius: 16
  // surfaceTintColor: transparent
  // barrierDismissible: by default false for important dialogs
  // shadow: Elevated
}

class ErrorPopup extends StatelessWidget {
  // Icon: error icon with red glow
  // Title: Error, white
  // Body: error message, Text Secondary
  // Action: PrimaryButton "Dismiss"
  // Auto-dismiss after 5s for non-critical errors
  // For provider switches: "Provider X unavailable. Switched to Y."
}
```

### Loading States

```dart
class ShimmerLoader extends StatelessWidget {
  // Animated gradient shimmer
  // base: Surface Glass
  // highlight: rgba(255, 255, 255, 0.08)
  // duration: 1.5s, infinite loop
  // Pre-built variants:
  //   ShimmerLoader.card()    → card-shaped shimmer
  //   ShimmerLoader.list()    → list item shimmer
  //   ShimmerLoader.circle()  → avatar shimmer
  //   ShimmerLoader.text()    → text line shimmer
}

class NeonLoader extends StatelessWidget {
  // Full-screen / overlay loading
  // Animated spinning ring with neon gradient
  // Optional: status text below
}
```

---

## Navigation

### Bottom Navigation

```dart
class GlassBottomNav extends StatelessWidget {
  // background: Surface Glass with extra blur
  // border: top border, Glass Border
  // height: 64 + bottom safe area
  // items: 5 max
  // icon: Icon MD
  // label: Caption
  // active: icon glows (Primary neon), text: Text Primary
  // inactive: icon: Text Tertiary, text: Text Tertiary
  // transition: subtle scale + glow on selection
  // shape: rounded top corners (Radius MD)
}
```

### Page Transitions

```dart
// Slide transition (default for push)
// duration: 300ms, Curves.easeInOut
// Slide from right

// Fade transition (for dialogs, modals)
// duration: 200ms, Curves.easeOut

// Scale transition (for profile switching)
// duration: 250ms, Curves.easeInOut

// Bottom sheet slide
// duration: 300ms, Curves.easeOutCubic
```

---

## Animations & Micro-interactions

### Standard Durations

| Context | Duration | Curve |
|---|---|---|
| Button press | 100ms | easeOut |
| Hover state | 150ms | easeOut |
| Page transition | 300ms | easeInOut |
| Dialog show | 200ms | easeOut |
| Dialog dismiss | 150ms | easeIn |
| Bottom sheet | 300ms | easeOutCubic |
| Loading shimmer | 1.5s loop | linear |
| Neon pulse | 2s loop | easeInOut |
| Typing indicator | 400ms loop | easeInOut |
| Stream text appear | 30ms per char | linear |

### Micro-interactions

```
- Button press: scale 1.0 → 0.97 → 1.0 (100ms)
- Card tap: subtle background brighten + scale 1.0 → 0.98 (100ms)
- Switch toggle: sliding thumb + color transition (200ms)
- Heart/favorite: scale 1.0 → 1.3 → 1.0 bounce (300ms)
- List item appear: fade + slide up staggered (300ms, 50ms delay between items)
- Error shake: horizontal translate ±4px (300ms, 3 oscillations)
- Pull to refresh: gradient ring rotation
- Scroll: subtle parallax on hero elements
- Memory load: card fade-in with slide (250ms)
```

---

## Specific Component Designs

### Hero Cards

Large, prominent cards on the Dashboard and Profile screens.

```dart
class HeroCard extends StatelessWidget {
  // Large GlassCard (borderRadius: 16–20)
  // Enhanced glow border (Primary or Secondary)
  // content: typically avatar (XXL) + name + short bio + quick action buttons
  // background: subtle gradient overlay (Deep Space or Neon Purple gradient)
  // shadow: Elevated + Neon glow
}
```

### Family Tree Nodes

```dart
// Person node
// - Avatar (MD) with relationship label below
// - Connection lines to related nodes
// - GlassCard background on selected node
// - Hover: scale 1.05 + glow
// - Selected: primary border
```

### Timeline Items

```dart
// GlassCard with left accent border (color by category)
// Date chip on top-right
// Title + description
// Optional: photo thumbnails, document icons, voice play button
// Tappable → full detail view
```

### Loading Animation

```dart
class ThinkingIndicator extends StatelessWidget {
  // 3 dots, animated with staggered scale
  // colors: Primary, Secondary, Accent (cycling)
  // duration: 400ms per cycle
  // shown while AI is generating response
}
```

---

## Layout Patterns

### Screen Structure

```
SafeArea
  └── Column
        ├── ScreenHeader (title + optional action)
        │     ├── BackButton (optional)
        │     ├── Title (Heading 2 or Heading 3)
        │     └── ActionButton (optional)
        │
        ├── Body (expanded, scrollable)
        │     ├── Content sections (16px horizontal padding)
        │     └── Section separators (24px vertical spacing)
        │
        └── BottomBar (optional, for actions)
```

### Dashboard Grid

```
┌────────────────────┐
│   Hero Card         │  ← Profile photo, name, quick stats
├────────┬───────────┤
│ Stat 1 │ Stat 2    │  ← Small glass cards (2 columns)
├────────┴───────────┤
│ Recent Activity    │  ← Scrollable list
├────────────────────┤
│ Quick Actions      │  ← 4-column icon grid
├────────────────────┤
│ Provider Status    │  ← Horizontal scroll of provider cards
└────────────────────┘
```

### Content Card Pattern

```
┌────────────────────┐
│ Icon  Title    ↗   │  ← Row: leading icon, title, optional action
├────────────────────┤
│                    │
│  Content area      │  ← Main content (text, images, etc.)
│                    │
├────────────────────┤
│ Tags  ·  Date      │  ← Footer metadata
└────────────────────┘
```

---

## Do Not

- Do not use Material `Card` widget — use `GlassCard`.
- Do not use `ElevatedButton`, `OutlinedButton`, or `TextButton` from Material — use system buttons.
- Do not use `AppBar` — use custom `ScreenHeader` widget.
- Do not use `BottomNavigationBar` from Material — use `GlassBottomNav`.
- Do not use `Dialog` from Material — use `GlassDialog`.
- Do not use `TextField` with default decoration — use `GlassInput`.
- Do not use `CircularProgressIndicator` — use `NeonLoader` or `ThinkingIndicator`.
- Do not hardcode any color, spacing, or radius value — use theme constants.

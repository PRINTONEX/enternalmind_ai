# Profile Screen — Design Specification

> **For:** UI Designer  
> **Project:** EternalMind AI  
> **File:** `lib/features/profile/presentation/profile_screen.dart`  
> **Date:** 2026-07-16  

---

## 1. Current Layout (21 Sections)

The profile screen uses a **vertical stack of expandable GlassCards**. Each card shows an icon, title, description, and expand arrow. When expanded, it reveals a content area with Cancel / Save Changes buttons at the bottom.

### Section References by Index

| # | Title | Icon | Color | Status |
|---|---|---|---|---|
| 0 | **Identity** | `person_outline_rounded` | `#7C3AED` Purple | ✅ **Wired to DB** |
| 1 | **Life Stories** | `menu_book_outlined` | `#06B6D4` Cyan | ✅ **Wired to DB** |
| 2 | **Guided Interview** | `question_answer_outlined` | `#EC4899` Pink | ⏳ Placeholder |
| 3 | **Daily Journal** | `edit_note_rounded` | `#10B981` Green | ✅ **Wired to DB** |
| 4 | **Family Tree** | `account_tree_outlined` | `#3B82F6` Blue | ✅ **Wired to DB** |
| 5 | **Life Map** | `map_outlined` | `#F59E0B` Amber | ✅ **Wired to DB** |
| 6 | **Memories** | `photo_library_outlined` | `#D946EF` Magenta | ✅ **Wired to DB** |
| 7 | **Photo Albums** | `collections_bookmark_outlined` | `#00E5FF` Teal | ✅ **Wired to DB** |
| 8 | **Voice Vault** | `keyboard_voice_outlined` | `#7C3AED` Purple | ✅ **Wired to DB** |
| 9 | **Documents** | `description_outlined` | `#10B981` Green | ✅ **Wired to DB** |
| 10 | **Legacy Messages** | `forward_to_inbox_outlined` | `#EC4899` Pink | ✅ **Wired to DB** |
| 11 | **Career** | `work_outline_rounded` | `#3B82F6` Blue | ✅ **Wired to DB** |
| 12 | **Education** | `school_outlined` | `#06B6D4` Cyan | ✅ **Wired to DB** |
| 13 | **Skills & Expertise** | `psychology_outlined` | `#F59E0B` Amber | ✅ **Wired to DB** |
| 14 | **Interests** | `favorite_border_rounded` | `#D946EF` Magenta | ✅ **Wired to DB** |
| 15 | **Goals & Aspirations** | `flag_outlined` | `#00E5FF` Teal | ✅ **Wired to DB** |
| 16 | **Personality Profile** | `track_changes_outlined` | `#7C3AED` Purple | ✅ **Wired to DB** |
| 17 | **AI Companion Personality** | `android_outlined` | `#10B981` Green | ✅ **Wired to DB** |
| 18 | **Favorites** | `star_border_rounded` | `#EC4899` Pink | ✅ **Wired to DB** |
| 19 | **Languages** | `translate_rounded` | `#3B82F6` Blue | ✅ **Wired to DB** |
| 20 | **Privacy & Security** | `lock_outline_rounded` | `#64748B` Gray | ⏳ Placeholder |

---

## 2. Existing Data Flow

### How Data Gets From DB to Screen

```
JSON backup → ImportProvider → Drift SQLite DB
                                     │
                          ┌──────────┴──────────┐
                          │  dashProfileProvider │  ← watches `humans` table
                          │  ↓                   │
                          │  ProfileModel        │  ← domain model
                          └─────────────────────┘
                                     │
                          ┌──────────┴──────────┐
                          │ profileXxxProvider   │  ← one per table
                          │  ↓                   │
                          │ Drift DataClass      │  ← e.g. FamilyMembersTableData
                          └─────────────────────┘
                                     │
                          ┌──────────┴──────────┐
                          │ _buildXxxContent()   │  ← render method
                          └─────────────────────┘
```

### Key Files

| File | Purpose |
|---|---|
| `lib/features/profile/providers/profile_providers.dart` | 19 FutureProviders, one per table |
| `lib/features/profile/presentation/profile_screen.dart` | All 21 section cards + content builders |
| `lib/database/app_database.dart` | Drift database with 33 tables |
| `lib/human_11_complete.json` | Example human data (Aftab Shah) |

---

## 3. Missing Data Tables — Need NEW Sections

These 5 tables have data in the database but **no section on the Profile screen** displays them.

### 3.1 Timeline 📅

**Suggested position:** Between Life Map (5) and Memories (6)  
**Icon:** `timeline_rounded`  
**Color:** `#8B5CF6` Violet  
**Provider:** `profileTimelineProvider` (needs to be created)

**Table columns:** `id`, `human_id`, `title`, `description`, `date`, `year`, `location`, `emotion`, `importance`
**Data example** (from JSON):
```json
{
  "title": "Marriage",
  "year": 2020,
  "date": "2020-03-21",
  "description": "I got married and started a new chapter...",
  "emotion": "Happy",
  "location": "Paobitek",
  "importance": "High"
}
```

**Suggested design:**
```
┌──────────────────────────────────────────┐
│ 📅 Timeline                              │
│ 6 life milestones                        │
├──────────────────────────────────────────┤
│                                          │
│  2020 ┌─────────────────────────────┐    │
│  ●────│ Marriage                    │    │
│  │    │ Paobitek           😊 Happy │    │
│  │    └─────────────────────────────┘    │
│  2021 ┌─────────────────────────────┐    │
│  ●────│ Armaan Born                 │    │
│  │    │ Phouden           😃 Joy    │    │
│  │    └─────────────────────────────┘    │
│  2025 ┌─────────────────────────────┐    │
│  ●────│ Family Relationship        │    │
│       │ Challenges       😢 Sad     │    │
│       └─────────────────────────────┘    │
│                                          │
└──────────────────────────────────────────┘
```

**Layout:** Left-side vertical timeline line with dots, year labels, and cards on the right. Each event card shows: year badge, title, location pill, emotion emoji, description (2-line max).

---

### 3.2 Values & Beliefs 📖

**Suggested position:** Between Goals (15) and Personality (16)  
**Icon:** `auto_awesome_rounded`  
**Color:** `#10B981` Emerald  
**Provider:** `profileValuesBeliefsProvider` (needs to be created)

**Table columns:** `id`, `human_id`, `religion`, `core_values`, `life_principles`, `ethics`, `things_never_do`, `things_always_do`, `political_preference`

**Data example** (from JSON):
```json
{
  "religion": "Islam (Sunni Muslim)",
  "core_values": "Honesty,Family,Respect,Kindness,Learning,Innovation",
  "life_principles": "Always keep learning.\nTreat everyone with respect....",
  "ethics": "I believe every decision should be made with honesty...",
  "things_never_do": "Cheat people\nSteal\nIntentionally hurt others...",
  "things_always_do": "Keep learning\nHelp people when possible\nSupport my family..."
}
```

**Suggested design:**
```
┌──────────────────────────────────────────┐
│ 📖 Values & Beliefs                      │
│ Core principles and ethics               │
├──────────────────────────────────────────┤
│                                          │
│ 🕌 Religion: Islam (Sunni Muslim)        │
│                                          │
│ 💎 Core Values                           │
│ [Honesty] [Family] [Respect] [Kindness]  │
│ [Learning] [Innovation] [Responsibility] │
│                                          │
│ 📜 Life Principles                       │
│ 1. Always keep learning                  │
│ 2. Treat everyone with respect           │
│ 3. Family comes first                    │
│ 4. Technology should solve real problems │
│                                          │
│ ⚖️ Ethics                                │
│ I believe every decision should be made  │
│ with honesty, fairness, compassion...    │
│                                          │
│ ✅ Always Do        ❌ Never Do         │
│ Keep learning       Cheat people        │
│ Help people         Steal               │
│ Support my family   Hurt others         │
│ Finish what I start Break promises      │
│                                          │
└──────────────────────────────────────────┘
```

**Layout:** 
- Religion line with an icon
- Core Values as colored pill chips in a Wrap
- Life Principles as a numbered list
- Ethics as a quote-style block
- Two-column row: Always Do (green) vs Never Do (red)

---

### 3.3 Decision Profile 🧠

**Suggested position:** Inside Personality section (16) or as a subsection below it  
**Icon:** `account_tree_rounded`  
**Color:** `#F59E0B` Amber  
**Provider:** `profileDecisionProfileProvider` (needs to be created)

**Table columns:** `id`, `human_id`, `logic_level`, `emotion_level`, `faith_level`, `research_level`, `experience_level`, `friends_influence`, `family_influence`, `risk_level`, `financial_style`, `leadership_style`, `conflict_handling`

**Data example** (from JSON):
```json
{
  "logic_level": 67, "emotion_level": 91, "faith_level": 85,
  "research_level": 83, "experience_level": 87,
  "friends_influence": 79, "family_influence": 73,
  "risk_level": "Medium",
  "financial_style": "Balanced Investor...",
  "leadership_style": "Supportive...",
  "conflict_handling": "Calm Discussion..."
}
```

**Suggested design:**
```
┌──────────────────────────────────────────┐
│ 🧠 Decision Profile                      │
│ How I make choices                       │
├──────────────────────────────────────────┤
│                                          │
│ Decision Factors:                        │
│ Logic       ████████░░░░ 67%             │
│ Emotion     █████████░░░ 91%             │
│ Faith       █████████░░░ 85%             │
│ Research    ████████░░░░ 83%             │
│ Experience  █████████░░░ 87%             │
│ Friends     ████████░░░░ 79%             │
│ Family      ███████░░░░░ 73%             │
│                                          │
│ 🎲 Risk Level: Medium                    │
│                                          │
│ 💰 Financial Style                       │
│ Balanced Investor • Long-Term Planning   │
│                                          │
│ 👥 Leadership Style                      │
│ Supportive • Lead by Example             │
│                                          │
│ 🤝 Conflict Handling                     │
│ Calm Discussion • Listen First           │
│                                          │
└──────────────────────────────────────────┘
```

**Layout:** 
- Progress bars for all numeric decision factors (0-100)
- Badge for Risk Level
- Short text blocks for Financial, Leadership, Conflict styles

---

### 3.4 Daily Habits 🌅

**Suggested position:** Between Career (11) and Education (12)  
**Icon:** `wb_sunny_outlined`  
**Color:** `#F59E0B` Amber  
**Provider:** `profileDailyHabitsProvider` (needs to be created)

**Table columns:** `id`, `human_id`, `wake_time`, `sleep_time`, `prayer`, `exercise`, `reading`, `coding`, `tea_coffee`, `smoking_alcohol`, `meditation_walking`, `custom_habits`

**Data example** (from JSON):
```json
{
  "wake_time": "04:00:00",
  "sleep_time": "20:23:00",
  "prayer": "Perform daily prayers whenever possible...",
  "exercise": "Walking, daily movement...",
  "reading": "Technology articles, AI research...",
  "coding": "Daily coding, experimenting...",
  "tea_coffee": "1-2 cups of tea daily...",
  "custom_habits": "Research new AI technologies..."
}
```

**Suggested design:**
```
┌──────────────────────────────────────────┐
│ 🌅 Daily Habits                          │
│ Routines and lifestyle                   │
├──────────────────────────────────────────┤
│                                          │
│ ⏰ Schedule                              │
│   Wake: 04:00        Sleep: 20:23        │
│   → Daily duration: 16h 23min awake     │
│                                          │
│ 🌄 Morning                               │
│   📿 Prayer: daily prayers & Quran       │
│   ☕ 1-2 cups of tea daily               │
│                                          │
│ ☀️ Day Activities                        │
│   📖 Reading tech, AI, Linux docs        │
│   💻 Coding daily, building projects     │
│   🏃 Walking, daily movement             │
│                                          │
│ 🌆 Evening                               │
│   🧘 Evening walks + quiet thinking      │
│   🚬 Smoking: sometimes                  │
│                                          │
│ ✏️ Custom Habits                         │
│  • Research new AI technologies          │
│  • Watch technical videos                │
│  • Maintain servers                      │
│  • Build side projects                   │
│  • Help others solve technical problems  │
│                                          │
└──────────────────────────────────────────┘
```

**Layout:**
- Schedule bar showing wake/sleep times with a day duration calculation
- Three sections: Morning (🌄), Day (☀️), Evening (🌆)
- Each habit as an icon + label row
- Custom habits as a bulleted list

---

### 3.5 Favorite Words 💬

**Suggested position:** Inside Favorites section (18) as a sub-section  
**Icon:** `text_fields_rounded`  
**Color:** `#EC4899` Pink  
**Provider:** Already exists as `profileFavoriteWordsProvider` needs to be created

**Table columns:** `id`, `human_id`, `word`

**Data example** (from JSON):
```json
[
  {"word": "Keep Learning"},
  {"word": "My Son"},
  {"word": "Technology"}
]
```

**Suggested design:** Display as large text cards, like pinned words, within the Favorites section:

```
┌──────────────────────────────────────────┐
│ ⭐ Favorites                             │
│ 8 favorites saved                        │
├──────────────────────────────────────────┤
│                                          │
│ Food   [Cow Meat]                        │
│ Movie  [Sifi]                            │
│ Book   [Computer]                        │
│ Color  [Green, Purple, Pink]             │
│                                          │
│ 💬 Favorite Words                        │
│ ┌─────────────────┐                     │
│ │  "Keep Learning" │                     │
│ └─────────────────┘                     │
│ ┌─────────────────┐                     │
│ │   "My Son"      │                     │
│ └─────────────────┘                     │
│ ┌─────────────────┐                     │
│ │  "Technology"   │                     │
│ └─────────────────┘                     │
│                                          │
└──────────────────────────────────────────┘
```

---

## 4. Complete Data Inventory

### All Tables vs Profile Sections

| Table | Data Count | Profile Section | Status |
|---|---|---|---|
| `humans` | 1 | 0: Identity | ✅ Wired |
| `family_members` | 7 | 4: Family Tree | ✅ Wired |
| `education` | 3 | 12: Education | ✅ Wired |
| `career_history` | 2 | 11: Career | ✅ Wired |
| `skills` | 5 | 13: Skills | ✅ Wired |
| `interests` | 6 | 14: Interests | ✅ Wired |
| `goals` | 6 | 15: Goals | ✅ Wired |
| `languages` | 3 | 19: Languages | ✅ Wired |
| `personality_traits` | 1 | 16: Personality | ✅ Wired |
| `conversation_styles` | 1 | 17: AI Personality | ✅ Wired |
| `favorites` | 8+ | 18: Favorites | ✅ Wired |
| `life_stories` | 12 | 1: Life Stories | ✅ Wired |
| `timeline` | 6 | **❌ NO SECTION** | ❌ Missing |
| `daily_journals` | 4 | 3: Daily Journal | ✅ Wired |
| `memories` | 10 | 6: Memories | ✅ Wired |
| `memory_tags` | 34 | (shown within memories) | ⏳ Partial |
| `memory_links` | 8 | (shown within memories) | ⏳ Partial |
| `photos` | 2 | 7: Photo Albums | ✅ Wired |
| `photo_albums` | 11 | 7: Photo Albums | ✅ Wired |
| `documents` | 3 | 9: Documents | ✅ Wired |
| `audio_files` | 0 | 8: Voice Vault | ✅ (empty) |
| `voice_settings` | 1 | 8: Voice Vault | ✅ Wired |
| `legacy_messages` | 7 | 10: Legacy Messages | ✅ Wired |
| `life_places` | 7 | 5: Life Map | ✅ Wired |
| `values_beliefs` | 1 | **❌ NO SECTION** | ❌ Missing |
| `decision_profiles` | 1 | **❌ NO SECTION** | ❌ Missing |
| `daily_habits` | 1 | **❌ NO SECTION** | ❌ Missing |
| `favorite_quotes` | 0 | 0: Identity (field) | ✅ Covered |
| `favorite_words` | 3 | **❌ NO SECTION** | ❌ Missing |
| `ai_providers` | 3 | Separate screen | N/A |
| `ai_settings` | 1 | Separate screen | N/A |
| `avatars` | 0 | Future feature | N/A |
| `chat_history` | 0 | Separate screen | N/A |

---

## 5. Implementation Order (Recommended)

| Phase | Sections | Effort |
|---|---|---|
| **1. Fix compilation errors** | Current code has ~30 errors from data wiring | 30 min |
| **2. Create 5 new providers** | timeline, values_beliefs, decision_profiles, daily_habits, favorite_words | 15 min |
| **3. Add 5 new section cards** | Follow existing pattern in profile_screen.dart | 1-2 hrs |
| **4. Decision Profile as Personality subsection** | Nested inside section 16 | 1 hr |
| **5. Favorite Words inside Favorites** | Subsection inside section 18 | 30 min |
| **6. Remove unused `profilePhotosProvider`** | Don't need provider for photos count | 5 min |

---

## 6. Technical Notes for Developer

### Section Card Pattern (existing)
Every section follows this template in `_buildSectionWrapper()`:

```dart
_buildSectionWrapper(
  index: 5,          // unique index (0-25 after adding new ones)
  icon: Icons.xxx,   // icon for the circle
  title: 'Section Name',
  description: 'Dynamic count or status string',
  color: Color(0xFF...), // accent color
  content: _buildXxxContent(data), // content widget
)
```

### Provider Pattern (existing)
```dart
final profileTimelineProvider = FutureProvider<List<TimelineTableData>>((ref) async {
  final dao = ref.watch(timelineDaoProvider);
  final id = ref.watch(activeProfileIdProvider);
  if (id == null) return [];
  return dao.getForHuman(id);
});
```

### Re-indexing
Adding 5 new sections requires re-indexing all subsequent sections. Current indices 6-20 will shift by +1 or +2 depending on where inserts happen.

### Color Palette Guidelines
Each section should use a unique color from the existing palette:
- Purple: `#7C3AED`
- Cyan: `#06B6D4`
- Pink: `#EC4899`
- Green: `#10B981`
- Blue: `#3B82F6`
- Amber: `#F59E0B`
- Magenta: `#D946EF`
- Teal: `#00E5FF`
- Violet: `#8B5CF6` (new — for Timeline)
- Emerald: `#34D399` (new — for Values)

---

*Document generated 2026-07-16 for EternalMind AI Profile Screen redesign.*

## 2025-05-18 - Tooltip Properties as Accessibility Labels in Flutter
**Learning:** In Flutter, icon-only `IconButton` widgets do not automatically expose accessible text labels to screen readers (VoiceOver/TalkBack) unless a `tooltip` parameter is provided. The `tooltip` serves both as accessible semantics and visual hover/long-press hints.
**Action:** Always specify state-appropriate `tooltip` strings on all `IconButton` instances throughout Flutter components.

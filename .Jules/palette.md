## 2025-05-18 - Tooltips for Icon-Only Buttons in Flutter
**Learning:** Icon-only `IconButton` widgets without explicit `tooltip` attributes are invisible to screen readers (VoiceOver/TalkBack) as accessible interactive labels and offer no feedback on hover/long-press.
**Action:** Always provide a concise, state-appropriate `tooltip` string for all `IconButton` components to ensure complete screen reader accessibility and clear user feedback.

## 2025-05-10 - Flutter IconButton Tooltips for Screen Reader Accessibility
**Learning:** In Flutter, `IconButton` widgets without `tooltip` parameters lack accessibility labels for screen readers like TalkBack and VoiceOver, in addition to leaving desktop/web users without visual hover cues.
**Action:** Always provide descriptive, context-appropriate `tooltip` strings (or dynamic state tooltips like password visibility toggles) on every `IconButton`.

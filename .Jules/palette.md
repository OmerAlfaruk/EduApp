## 2025-02-18 - Flutter IconButton Tooltips for Screen Reader Accessibility
**Learning:** Icon-only buttons (`IconButton`) without explicit `tooltip` strings are opaque to screen readers (e.g. TalkBack / VoiceOver) and fail to provide visual hover/long-press hints.
**Action:** Always provide descriptive, action-oriented `tooltip` parameters on all `IconButton` components to ensure basic accessibility and hover UX.

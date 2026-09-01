## 2025-05-15 - IconButton Accessibility Tooltips in Flutter
**Learning:** In Flutter, icon-only `IconButton` widgets without explicit `tooltip` attributes lack accessible labels for screen readers (like TalkBack and VoiceOver) and lack desktop/web hover hints.
**Action:** Always provide state-appropriate `tooltip` strings (e.g., `obscurePassword ? 'Show password' : 'Hide password'`) for all `IconButton` instances to ensure accessibility and clear UX feedback.

# Palette's Journal

## 2026-07-20 - Accessible Icon-Only Buttons in Flutter
**Learning:** Icon-only buttons (like `IconButton`) in Flutter are screen-reader unfriendly because they lack a descriptive text label. Specifying a descriptive, state-appropriate `tooltip` property not only provides a helpful hint to desktop/mouse hover users but also acts as the primary accessibility and semantics label for mobile screen readers (such as TalkBack or VoiceOver).
**Action:** When creating or editing `IconButton` or custom icon-only components in Flutter, always ensure a `tooltip` attribute with state-appropriate descriptions (e.g., toggles should reflect show/hide status) is present.

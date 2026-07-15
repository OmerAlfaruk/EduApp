# Palette's Journal - Education App

This journal captures critical UX and accessibility learnings, patterns, and constraints encountered during development.

## 2024-12-19 - Semantic Accessibility and Hover/Long-press Overlay via Tooltips on Icon-Only Buttons in Flutter
**Learning:** Icon-only buttons (like `IconButton` in Flutter) lack explicit text and can be completely inaccessible to screen readers without standard semantic attributes. In Flutter, specifying a state-appropriate `tooltip` property not only provides a high-contrast visual hint overlay on hover (desktop/web) or long-press (mobile), but also serves as the primary accessibility/semantic label for assistive technologies.
**Action:** Always define descriptive, state-appropriate `tooltip` values on all `IconButton` and other icon-only components in Flutter projects to ensure visual clarity and full screen reader accessibility.

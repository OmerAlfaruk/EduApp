# Palette's Journal - Critical UX/accessibility learnings

## 2025-01-26 - IconButton Accessibility Tooltips in Flutter
**Learning:** In Flutter, icon-only buttons like `IconButton` require a descriptive `tooltip` parameter to serve as the primary semantic/accessibility label for screen readers. Lacking this leads to poor screen reader experiences.
**Action:** Always add descriptive, state-appropriate tooltips to IconButtons to ensure better accessibility and UI quality.

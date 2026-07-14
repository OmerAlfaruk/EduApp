# Palette's Journal - Critical UX and Accessibility Learnings

## 2025-02-15 - IconButton Accessibility in Flutter
**Learning:** Icon-only buttons (like those constructed with `IconButton`) in Flutter are screen-reader-unfriendly if they lack a descriptive `tooltip` attribute. In Flutter, the `tooltip` property functions not only as a visual/hover popup on web and desktop, but also as the primary semantic/accessibility label for the screen reader (acting similarly to ARIA labels or `aria-label` in web interfaces).
**Action:** Always provide descriptive and state-dependent `tooltip` properties to `IconButton` widgets in Flutter to ensure they are accessible, semantic, and hover-friendly.

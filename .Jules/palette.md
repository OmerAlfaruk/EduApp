# Palette's Journal - Critical Learnings

## 2025-01-20 - Flutter Icon-Only Buttons Semantic Accessibility
**Learning:** In Flutter, `IconButton` widgets lacking a `tooltip` property do not provide proper screen reader labels by default, making them completely inaccessible to visually impaired users using Semantics. Moreover, state-driven icon-only buttons (like password visibility toggles or dynamic profile pic actions) must update their tooltips dynamically alongside their visual icon states to keep the accessibility tree fully synchronized.
**Action:** Always define a state-appropriate and descriptive `tooltip` property for all `IconButton` and similar icon-only clickable widgets in Flutter to ensure they are visible, descriptive, and accurately announced by screen readers.

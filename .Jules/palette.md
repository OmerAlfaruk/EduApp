## 2024-12-16 - Accessible Flutter IconButtons
**Learning:** Icon-only buttons like `IconButton` in Flutter do not have visible text labels. To make them fully accessible for screen readers, they must always specify a descriptive, state-appropriate `tooltip` property, which serves as their primary semantic label.
**Action:** When using `IconButton` or any other icon-only button, ensure a descriptive and context-appropriate `tooltip` is explicitly provided.

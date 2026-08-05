## 2024-12-14 - Accessible Icon-Only Buttons in Flutter
**Learning:** Icon-only buttons (like `IconButton`) in Flutter are screen-reader unfriendly unless they specify a descriptive, state-appropriate `tooltip` property, which acts as the primary accessibility label.
**Action:** Always include a descriptive and dynamic (when appropriate) `tooltip` property for every `IconButton` or icon-only widget to ensure proper screen reader support.

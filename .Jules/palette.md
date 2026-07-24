## 2025-02-14 - Semantic labels for Flutter icon-only buttons
**Learning:** In Flutter, icon-only buttons like `IconButton` do not natively expose text names to screen readers. Specifying a descriptive, state-appropriate `tooltip` property acts as the primary accessibility/semantic label for assistive technologies, bridging the UX gap for visually impaired users.
**Action:** Always define descriptive, dynamic or static `tooltip` properties for every `IconButton` or icon-only interactive widget in Flutter apps to ensure seamless accessibility.

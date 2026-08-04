## 2025-01-20 - Explicit state-appropriate tooltips on icon-only buttons
**Learning:** Icon-only buttons (such as IconButton in Flutter) are highly problematic for accessibility/screen readers unless they contain a descriptive tooltip. Furthermore, when the button performs different actions or toggles states (like visibility toggle or profile picture edit vs add), the tooltip must be dynamic and state-appropriate.
**Action:** Always specify a state-appropriate `tooltip` property for any `IconButton` or icon-only interactive element in Flutter apps.

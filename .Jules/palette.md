# Palette's Journal - Critical UX/Accessibility Learnings

## 2024-07-30 - Accessible Interactive Buttons in Flutter
**Learning:** In Flutter, icon-only buttons such as `IconButton` and `PopupMenuButton` do not provide a text representation by default. For screen reader users, these buttons are virtually invisible or non-descriptive unless a `tooltip` or a `semanticLabel` is explicitly specified. Adding descriptive and state-appropriate tooltips (like "Show password" vs "Hide password") dramatically increases accessibility (a11y) and improves hover experience on desktop/web/tablet viewports.
**Action:** Always inspect the widget tree for `IconButton` and `PopupMenuButton` usages. Ensure they specify a descriptive, state-appropriate `tooltip` property to serve as the primary semantic/accessibility label for screen readers and helpful hover context for desktop users.

## 2025-02-18 - Accessibility Tooltips for Icon-Only Buttons in Flutter
**Learning:** In Flutter, icon-only `IconButton` widgets default to having no semantic accessibility label or tooltip. Adding descriptive, state-aware `tooltip` properties provides crucial context to screen reader users and displays helpful hover tooltips on desktop/web platforms without affecting the visual design layout.
**Action:** Always provide a state-appropriate `tooltip` argument on all `IconButton` instances throughout Flutter app layouts.

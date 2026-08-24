## 2025-05-18 - Accessibility Tooltips on Core Navigation IconButtons
**Learning:** Reusable navigation components like `IconButton` in `NestedBackButton` lack accessibility tooltips by default in Flutter, leaving screen readers without primary semantic labels when navigating backwards.
**Action:** Always provide explicit `tooltip` attributes on shared `IconButton` widgets to ensure screen reader accessibility and consistent hover tooltips.

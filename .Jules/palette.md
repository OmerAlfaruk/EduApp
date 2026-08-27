## 2025-05-10 - Flutter IconButton Tooltips as Primary Semantic Labels
**Learning:** In Flutter, icon-only `IconButton` widgets without a `tooltip` property lack semantic accessibility labels for screen readers. Shared navigation components like `NestedBackButton` require an explicit `tooltip` to ensure accessible navigation across all views.
**Action:** Always specify a descriptive, state-appropriate `tooltip` property on icon-only `IconButton` widgets.

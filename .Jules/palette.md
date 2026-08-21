## 2025-02-23 - Accessibility Tooltips on Navigation Icon Buttons
**Learning:** Icon-only navigation buttons in Flutter (such as custom `NestedBackButton` widgets) lack semantic context for screen readers and touch tooltips unless explicitly provided via the `tooltip` property.
**Action:** Always provide a descriptive `tooltip` (e.g. `tooltip: 'Back'`) on icon-only `IconButton` components to ensure proper screen reader accessibility and touch feedback.

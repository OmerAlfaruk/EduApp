## 2025-02-18 - Accessibility Tooltips for Icon Navigation Buttons
**Learning:** In Flutter, `IconButton` widgets lack accessibility names unless `tooltip` is explicitly specified. Navigation elements like `NestedBackButton` are invisible to screen readers without descriptive tooltips.
**Action:** Always provide `tooltip` properties on all icon-only buttons (`IconButton`, `PopupMenuButton`, etc.) to guarantee accessibility support.

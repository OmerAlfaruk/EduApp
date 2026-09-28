## 2025-05-18 - Accessibility Tooltips on Flutter IconButtons
**Learning:** In Flutter, `IconButton` widgets without explicit `tooltip` properties lack primary semantic labels for screen readers as well as hover tooltips for desktop/web users. State-dependent icon buttons (such as password visibility toggles or dynamic action buttons) need state-appropriate tooltip values to convey action intent clearly.
**Action:** Always provide a descriptive, state-appropriate `tooltip` string when implementing or modifying `IconButton` widgets across the application.

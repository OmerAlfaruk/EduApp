## 2025-05-18 - Icon-Only Button Accessibility in Flutter
**Learning:** In Flutter, `IconButton` widgets lacking a `tooltip` property leave screen readers without primary semantic labels, making app navigation and form toggles opaque to screen reader users.
**Action:** Always ensure all icon-only `IconButton`s specify a descriptive, state-appropriate `tooltip` (such as 'Back', 'Search', or 'Show password'/'Hide password') across all app bars and form fields.

## 2026-10-11 - Adding Tooltips to Icon-Only Buttons in Flutter
**Learning:** In Flutter, icon-only `IconButton` widgets without a `tooltip` attribute lack accessible text for screen readers (Semantics) and desktop/web hover hints, making icon intent ambiguous.
**Action:** Always provide state-appropriate, clear `tooltip` properties on all `IconButton` widgets across the app.

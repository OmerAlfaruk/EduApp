## 2025-05-15 - Accessibility Tooltips on Flutter Icon-Only Buttons
**Learning:** Icon-only `IconButton` widgets in Flutter lack default screen-reader semantic labels unless a `tooltip` attribute is explicitly provided. Dynamic tooltip text (e.g. toggling 'Show password' / 'Hide password') significantly enhances both accessibility and visual clarity.
**Action:** Always provide descriptive and state-appropriate `tooltip` attributes on `IconButton` widgets across Flutter views and forms.

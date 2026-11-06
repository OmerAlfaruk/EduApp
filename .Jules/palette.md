# Palette's Journal

## 2026-03-31 - State-Aware Tooltips on Password Visibility Toggles
**Learning:** In Flutter applications, `IconButton` widgets used for password visibility toggling lack semantic labels by default for screen readers. Providing a dynamic, state-aware `tooltip` ('Show password' vs 'Hide password') supplies both desktop/web hover hints and the essential accessibility semantics without requiring full custom semantics widgets.
**Action:** Always provide state-aware `tooltip` properties on toggle `IconButton` widgets whenever obscured/unobscured text inputs are implemented.

## 2026-11-23 - Dynamic Tooltips for Password Visibility Toggles
**Learning:** In Flutter, `IconButton` widgets without a `tooltip` lack screen reader accessibility descriptions and hover/long-press visual feedback. For stateful toggle buttons like password obscuring toggles, the tooltip must dynamically convey the future action ('Show password' when hidden, 'Hide password' when visible) rather than a static label.
**Action:** Always provide state-sensitive `tooltip` strings on toggling `IconButton`s across forms in this design system.

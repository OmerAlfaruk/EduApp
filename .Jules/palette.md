## 2025-05-10 - Icon-Only Button Tooltips in Flutter

**Learning:** Icon-only buttons (such as `IconButton`) in Flutter require explicit `tooltip` attributes to expose accessible names to screen readers and tooltips on long-press/hover. Dynamic icon buttons like password visibility toggles should dynamically update their `tooltip` based on state.
**Action:** Always provide descriptive, state-aware `tooltip` labels for any `IconButton` added or modified across Flutter presentation components.

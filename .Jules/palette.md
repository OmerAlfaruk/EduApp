## 2025-05-10 - Icon-only buttons accessibility in Flutter

**Learning:** In Flutter, `IconButton` widgets without a `tooltip` property lack accessible labels for screen readers and accessibility tools. Dynamic buttons (such as password visibility toggles) should update their `tooltip` based on state (e.g., 'Show password' vs 'Hide password').
**Action:** Always provide a descriptive, state-appropriate `tooltip` on `IconButton` components to ensure full screen reader support and desktop hover feedback.

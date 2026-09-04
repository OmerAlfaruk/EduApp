## 2025-02-18 - IconButton Accessibility Tooltips
**Learning:** Icon-only buttons (such as back buttons or password visibility toggles) in Flutter lack accessible labels for screen readers unless explicit, state-appropriate `tooltip` strings are assigned.
**Action:** Always provide descriptive `tooltip` values on `IconButton` instances, ensuring dynamic updates when interactive states change (e.g. toggle states like show/hide password).

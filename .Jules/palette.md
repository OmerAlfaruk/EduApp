## 2. Verify Frontend (If Applicable)
## 2025-05-21 - Dynamic Tooltips for Icon-Only Buttons
**Learning:** In Flutter, `IconButton` widgets rely on the `tooltip` property to provide both web/desktop hover feedback and primary accessibility labels for screen readers. Stateful buttons (such as password visibility toggles) must dynamically update their `tooltip` value when state toggles to accurately reflect the action to the user.
**Action:** Always provide descriptive, state-dependent `tooltip` strings on `IconButton` widgets across all screens and verify them with widget tests.

## 2025-05-18 - Icon Button Accessibility Tooltips in Flutter
**Learning:** Icon-only `IconButton` widgets without explicit `tooltip` properties lack primary accessibility labels for screen readers and helpful hover text for desktop/web users. In forms with toggleable states (such as password visibility), dynamic tooltips provide critical context.
**Action:** Always provide descriptive, state-aware `tooltip` strings (e.g. `tooltip: obscurePassword ? 'Show password' : 'Hide password'`) for all icon-only buttons.

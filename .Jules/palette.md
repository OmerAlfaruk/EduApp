## 2025-05-18 - State-Appropriate Tooltips for Flutter IconButtons

**Learning:** In Flutter, icon-only `IconButton` widgets rely on the `tooltip` property to provide semantic accessibility descriptions for screen readers (like VoiceOver and TalkBack) and desktop hover text. When an icon button toggles visual state (such as password visibility), static tooltips or missing tooltips reduce accessibility.
**Action:** Always provide a state-appropriate `tooltip` property on `IconButton` widgets (e.g., `obscurePassword ? 'Show password' : 'Hide password'`) and audit interactive icon-only components using automated tools.

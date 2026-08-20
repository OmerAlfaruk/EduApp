## 2025-05-10 - State-Dependent Tooltips on Toggle IconButtons
**Learning:** Icon-only buttons without tooltips lack semantic context for screen readers and desktop hover states. For interactive toggles like password visibility controls, static labels are insufficient; tooltips must dynamically reflect the action that will occur upon pressing (e.g. "Show password" vs. "Hide password").
**Action:** Always provide state-dependent `tooltip` properties on `IconButton` widgets in Flutter, especially for toggles, to ensure screen reader accessibility and clear user feedback.

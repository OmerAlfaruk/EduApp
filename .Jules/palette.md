# Palette's Journal

## 2026-02-18 - Dynamic Tooltips on State-Toggling Icon Buttons
**Learning:** In Flutter applications, `IconButton` widgets used for password visibility or state toggles are icon-only and lack text labels. Screen readers (TalkBack / VoiceOver) depend on the `tooltip` property to announce accessibility semantics. When toggling visibility, keeping the tooltip synchronized with the action (`Show password` when obscured, `Hide password` when visible) provides clear affordance and meets accessibility guidelines.
**Action:** Always provide state-aware `tooltip` properties on toggleable `IconButton` widgets and verify state changes via widget tests checking `find.byTooltip()`.

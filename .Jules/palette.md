## 2026-04-18 - Stateful Tooltips on Obscure Password Buttons
**Learning:** In Flutter, `IconButton` without a `tooltip` lacks semantics for screen readers and offers no hover or long-press feedback. For toggling state (such as showing/hiding password), dynamic tooltips (e.g., `'Show password'` vs `'Hide password'`) communicate both the upcoming action and the current obscuring state clearly to assistive technologies and desktop/web users.
**Action:** Always provide state-dependent `tooltip` properties on toggle icon buttons like password visibility controls across forms.

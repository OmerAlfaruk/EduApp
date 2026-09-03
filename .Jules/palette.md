## 2025-05-20 - Dynamic Accessibility Tooltips on Password Toggles
**Learning:** In Flutter, `IconButton` relies on `tooltip` as its primary semantic accessibility label. Static tooltips or missing tooltips on stateful buttons fail to communicate state changes (like showing/hiding password text) to screen readers.
**Action:** Always provide state-dependent tooltips (`obscureText ? 'Show password' : 'Hide password'`) on stateful toggle `IconButton`s across form fields.

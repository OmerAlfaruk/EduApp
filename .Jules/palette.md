## 2025-05-18 - Accessibility Labels for Dynamic IconButtons

**Learning:** Icon-only buttons in Flutter (such as password visibility toggles and app bar actions) default to having no semantic text unless the `tooltip` parameter is explicitly provided. For stateful toggles like password visibility, static tooltips fail to reflect the action context; dynamic state-dependent tooltips (e.g., 'Show password' vs 'Hide password') are required to give screen reader users clear context of the toggled state.
**Action:** Always provide state-dependent `tooltip` values on stateful icon-only buttons (`IconButton`) across form fields and screens.

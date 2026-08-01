# Palette's Journal - Critical UX/Accessibility Learnings

## 2025-01-24 - Interactive State-Appropriate Accessibility Tooltips
**Learning:** In Flutter applications, icon-only interactive controls (like back buttons, toggle buttons, and form icons) must provide proper semantics for screen readers and screen magnifiers. This is best achieved by defining a descriptive, context-specific `tooltip` attribute. When the interactive state changes (e.g. obscure/reveal password, edit/add photo), the tooltip should dynamically adapt to reflect the *new* state. This prevents confusion for screen reader users by always providing clear, actionable guidance.
**Action:** Always verify if there are any custom `IconButton` or text form fields with icon suffixes. Add state-appropriate, descriptive tooltips to make them accessible and intuitive for all users.

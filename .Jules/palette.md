# Palette's UX and Accessibility Journal

## 2024-12-14 - Screen Reader Labels & State-Appropriate Tooltips for IconButtons
**Learning:** In Flutter, icon-only interactive controls (such as `IconButton` inside app bars and input fields) are highly susceptible to being ignored or incorrectly interpreted by screen readers if they lack a semantic label. Under the hood, Flutter's `IconButton` maps its `tooltip` property directly to the accessibility tree as the semantic label. Furthermore, for toggleable components (e.g., password visibility switch, edit vs add profile picture), static labels fail to convey the dynamic control state to screen readers.
**Action:** Always supply a dynamic, state-appropriate `tooltip` property to all `IconButton` widgets to ensure screen readers read the correct, context-aware semantic label.

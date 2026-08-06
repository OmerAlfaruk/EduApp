# Palette's UX Journal

## 2025-01-20 - Accessible Icon-Only Buttons and Safe Password Fields
**Learning:** Icon-only buttons (such as password visibility toggles, picture edit triggers, and menu buttons) must always specify descriptive and state-appropriate 'tooltip' attributes to serve as semantic labels for screen readers and touch interface guidance. Additionally, password fields should be obscured by default with visibility controls to protect user privacy.
**Action:** Always provide state-aware, localized/appropriate tooltips on all Flutter IconButtons and PopupMenuButtons. Ensure State-driven ValueListenableBuilders or StatefulWidgets are used to toggle password obscuring properly without leaking listeners or causing rebuild issues.

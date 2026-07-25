## 2024-07-25 - Icon-only Buttons and Mobile Accessibility
**Learning:** In Flutter, icon-only buttons (`IconButton`) that lack semantic labels or `tooltip` properties cause screen reader issues and reduce motor-accessibility for users who depend on visual hover hints or spoken semantic descriptors.
**Action:** Always specify a descriptive, state-appropriate 'tooltip' property on all `IconButton` components to ensure cross-platform accessibility and screen reader compliance.

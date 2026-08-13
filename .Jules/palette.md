# Palette's Journal - Critical UX & Accessibility Learnings

## 2025-01-24 - Inclusive Screen Reader Navigation via State-Appropriate Tooltips
**Learning:** Icon-only buttons (like search, notifications, or toggle actions) in Flutter do not provide semantic text labels out of the box. Users relying on assistive screen reading technology (like TalkBack or VoiceOver) cannot perceive their purpose unless a descriptive, state-appropriate `tooltip` property is defined on the parent widget.
**Action:** Always specify a dynamic, context-aware `tooltip` property when using `IconButton` or custom icon-only components to guarantee accessibility and clear communication of the button's dynamic state changes (e.g., toggling show/hide passwords or editing profile images).

# Palette's UX and Accessibility Journal

## 2025-02-14 - Icon-only buttons accessibility in Flutter
**Learning:** Icon-only buttons (like `IconButton`) in Flutter lack textual labels by default, rendering them inaccessible to screen readers and difficult to understand without hover or long-press context. Specifying a descriptive, state-appropriate `tooltip` property solves this by serving as the primary semantic/accessibility label for screen readers.
**Action:** Always specify a state-appropriate and descriptive `tooltip` property for every `IconButton` or icon-only interactive component in Flutter apps to ensure semantic clarity and complete accessibility.

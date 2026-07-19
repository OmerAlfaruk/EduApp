## 2025-07-19 - State-Dependent Screen Reader Tooltips in Flutter

**Learning:** Icon-only buttons (like `IconButton`) in Flutter are invisible to screen readers unless they have a `tooltip` property, which acts as their primary accessibility/semantic label. Furthermore, for dynamic interactions (such as toggling password visibility or uploading/changing a profile picture), a static tooltip is insufficient and can be misleading. Tooltips must dynamically change based on the active state of the button (e.g., changing from "Show password" to "Hide password") to provide an accurate, accessible, and delightful user experience.

**Action:** Always include a descriptive `tooltip` on every `IconButton` in Flutter, and ensure that if the button's action or state is toggleable/dynamic, the tooltip expression dynamically updates (using ternary conditions) to reflect the current active state of the widget.

## 2025-05-20 - Accessible Icon Buttons and Mock Naming Convention
**Learning:** Icon-only buttons (like `IconButton`) in Flutter require `tooltip` properties so screen readers have appropriate semantics/accessibility labels. Also, Flutter test runner executes any `*_test.dart` file as a test suite, so helper/mock files must use `.mock.dart` suffix instead.
**Action:** Always provide descriptive, state-appropriate `tooltip` on `IconButton` widgets, and name test helper/mock files `.mock.dart`.

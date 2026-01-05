import 'package:flutter/material.dart';

/// Material Design 3 Responsive Breakpoints
/// See: https://m3.material.io/foundations/layout/applying-layout
class AppBreakpoints {
  AppBreakpoints._();

  /// Compact (phone portrait) - 0 to 599dp
  static const double compact = 600;

  /// Medium (tablet portrait, foldable) - 600 to 839dp
  static const double medium = 840;

  /// Expanded (tablet landscape, desktop) - 840dp+
  static const double expanded = 1200;

  /// Extra-large (large desktop) - 1200dp+
  static const double extraLarge = 1600;

  // ─────────────────────────────────────────────────────────────────────────────
  // HELPER METHODS
  // ─────────────────────────────────────────────────────────────────────────────

  /// Check if current width is compact (phone)
  static bool isCompact(BuildContext context) =>
      MediaQuery.sizeOf(context).width < compact;

  /// Check if current width is medium (tablet portrait)
  static bool isMedium(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= compact && width < medium;
  }

  /// Check if current width is expanded (tablet landscape / desktop)
  static bool isExpanded(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= medium && width < expanded;
  }

  /// Check if current width is extra-large (large desktop)
  static bool isExtraLarge(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= expanded;

  /// Get recommended number of columns for grid layout
  static int getColumns(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < compact) return 4;
    if (width < medium) return 8;
    return 12;
  }

  /// Get recommended content max width
  static double? getMaxContentWidth(BuildContext context) {
    if (isCompact(context)) return null; // Full width on compact
    if (isMedium(context)) return 600;
    if (isExpanded(context)) return 840;
    return 1040; // Extra-large
  }
}

import 'package:flutter/material.dart';

/// @deprecated This class is deprecated as of M3 migration.
///
/// Use the following M3 alternatives instead:
///
/// **Colors:**
/// - `AppColors.primary` → `colorScheme.primary`
/// - `AppColors.secondary` → `colorScheme.secondary`
/// - `AppColors.error` → `colorScheme.error`
/// - `AppColors.success` → `colorScheme.tertiary` or `SemanticColors.present`
/// - `AppColors.warning` → `colorScheme.secondary` or `SemanticColors.late`
/// - `AppColors.info` → `colorScheme.tertiary`
///
/// **Attendance Status Colors:**
/// - `AppColors.present` → `SemanticColors.present`
/// - `AppColors.absent` → `SemanticColors.absent`
/// - `AppColors.late` → `SemanticColors.late`
/// - `AppColors.excused` → `SemanticColors.excused`
///
/// **Text Colors:**
/// - `AppColors.textPrimary` → `colorScheme.onSurface`
/// - `AppColors.textSecondary` → `colorScheme.onSurfaceVariant`
///
/// **Backgrounds:**
/// - `AppColors.background` → `colorScheme.surface`
/// - `AppColors.cardBackground` → `colorScheme.surfaceContainerLow`
///
/// **Borders:**
/// - `AppColors.border` → `colorScheme.outline`
/// - `AppColors.divider` → `colorScheme.outlineVariant`
///
/// **Gradients:**
/// Use dynamic gradients: `LinearGradient(colors: [colorScheme.primary, colorScheme.tertiary])`
@Deprecated(
    'Use Theme.of(context).colorScheme and SemanticColors for M3 compliance')
class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF007BFF);
  static const Color primaryLight = Color(0xFF4DA3FF);
  static const Color primaryDark = Color(0xFF0056B3);

  // Secondary Colors
  static const Color secondary = Color(0xFF28A745);
  static const Color secondaryLight = Color(0xFF5CB85C);
  static const Color secondaryDark = Color(0xFF1E7E34);

  // Status Colors
  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFDC3545);
  static const Color info = Color(0xFF17A2B8);

  // Attendance Status Colors
  static const Color present = Color(0xFF28A745);
  static const Color absent = Color(0xFFDC3545);
  static const Color late = Color(0xFFFFC107);
  static const Color excused = Color(0xFF17A2B8);

  // Text Colors
  static const Color textPrimary = Color(0xFF212529);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textDisabled = Color(0xFFADB5BD);

  // Background Colors
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Border Colors
  static const Color border = Color(0xFFDEE2E6);
  static const Color divider = Color(0xFFE9ECEF);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

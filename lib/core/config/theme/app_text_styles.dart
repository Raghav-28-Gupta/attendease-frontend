import 'package:flutter/material.dart';

/// @deprecated Use Theme.of(context).textTheme instead for M3 compliance.
/// This file is kept for backwards compatibility but will be removed in future.
///
/// Example migration:
/// - AppTextStyles.h1 → textTheme.displayLarge
/// - AppTextStyles.h2 → textTheme.displayMedium
/// - AppTextStyles.h3 → textTheme.headlineLarge
/// - AppTextStyles.h4 → textTheme.headlineMedium
/// - AppTextStyles.body1 → textTheme.bodyLarge
/// - AppTextStyles.body2 → textTheme.bodyMedium
/// - AppTextStyles.caption → textTheme.labelSmall
/// - AppTextStyles.button → textTheme.labelLarge
@Deprecated('Use Theme.of(context).textTheme for M3 compliance')
class AppTextStyles {
  // Headings
  static const TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );

  static const TextStyle h4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );

  // Body Text
  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'Inter',
  );

  static const TextStyle body2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'Inter',
  );

  // Caption
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: 'Inter',
  );

  // Button
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: 'Inter',
  );
}

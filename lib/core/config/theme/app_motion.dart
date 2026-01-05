import 'package:flutter/material.dart';

/// Material Design 3 Motion Tokens
/// See: https://m3.material.io/styles/motion/overview
class AppMotion {
  AppMotion._();

  // ─────────────────────────────────────────────────────────────────────────────
  // CURVES
  // ─────────────────────────────────────────────────────────────────────────────

  /// Emphasized - for significant transitions (page transitions, modals)
  static const Curve emphasized = Curves.easeInOutCubicEmphasized;

  /// Emphasized decelerate - for entering elements
  static const Curve emphasizedDecelerate = Curves.easeOutCubic;

  /// Emphasized accelerate - for exiting elements
  static const Curve emphasizedAccelerate = Curves.easeInCubic;

  /// Standard - for subtle or reversible animations
  static const Curve standard = Curves.easeInOut;

  /// Standard decelerate - for entering subtle elements
  static const Curve standardDecelerate = Curves.easeOut;

  /// Standard accelerate - for exiting subtle elements
  static const Curve standardAccelerate = Curves.easeIn;

  // ─────────────────────────────────────────────────────────────────────────────
  // DURATIONS
  // ─────────────────────────────────────────────────────────────────────────────

  /// Short 1 - fastest, for small changes (icons, indicators)
  static const Duration short1 = Duration(milliseconds: 50);

  /// Short 2
  static const Duration short2 = Duration(milliseconds: 100);

  /// Short 3
  static const Duration short3 = Duration(milliseconds: 150);

  /// Short 4 - typical for FAB, chips
  static const Duration short4 = Duration(milliseconds: 200);

  /// Medium 1 - typical for cards, sheets
  static const Duration medium1 = Duration(milliseconds: 250);

  /// Medium 2 - typical for dialogs
  static const Duration medium2 = Duration(milliseconds: 300);

  /// Medium 3
  static const Duration medium3 = Duration(milliseconds: 350);

  /// Medium 4 - typical for page transitions
  static const Duration medium4 = Duration(milliseconds: 400);

  /// Long 1
  static const Duration long1 = Duration(milliseconds: 450);

  /// Long 2 - for complex choreographed sequences
  static const Duration long2 = Duration(milliseconds: 500);

  /// Long 3
  static const Duration long3 = Duration(milliseconds: 550);

  /// Long 4 - slowest, for large surface changes
  static const Duration long4 = Duration(milliseconds: 600);

  // ─────────────────────────────────────────────────────────────────────────────
  // STATE LAYER OPACITIES
  // ─────────────────────────────────────────────────────────────────────────────

  /// Hover state opacity
  static const double stateHover = 0.08;

  /// Focus state opacity
  static const double stateFocus = 0.12;

  /// Pressed state opacity
  static const double statePressed = 0.12;

  /// Dragged state opacity
  static const double stateDragged = 0.16;
}

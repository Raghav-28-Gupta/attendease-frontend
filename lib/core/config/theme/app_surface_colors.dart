import 'package:flutter/material.dart';

/// M3 Surface Container convenience extension.
///
/// Note: Flutter 3.22+ includes native surfaceContainer* properties.
/// This extension provides only the 'Lowest' variant which isn't in Flutter yet,
/// and re-exports the native ones for convenience and future compatibility.
extension SurfaceContainers on ColorScheme {
  /// Lowest emphasis surface (not native in Flutter yet)
  Color get surfaceLowest => surface;
}

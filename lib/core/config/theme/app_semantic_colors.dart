import 'package:flutter/material.dart';

/// M3-compatible semantic colors for attendance status.
/// Usage: Theme.of(context).extension<SemanticColors>()!.present
@immutable
class SemanticColors extends ThemeExtension<SemanticColors> {
  final Color present;
  final Color onPresent;
  final Color absent;
  final Color onAbsent;
  final Color late;
  final Color onLate;
  final Color excused;
  final Color onExcused;

  const SemanticColors({
    required this.present,
    required this.onPresent,
    required this.absent,
    required this.onAbsent,
    required this.late,
    required this.onLate,
    required this.excused,
    required this.onExcused,
  });

  /// Generate semantic colors from M3 ColorScheme
  factory SemanticColors.fromScheme(ColorScheme scheme) {
    return SemanticColors(
      present: scheme.tertiaryContainer,
      onPresent: scheme.onTertiaryContainer,
      absent: scheme.errorContainer,
      onAbsent: scheme.onErrorContainer,
      late: Color.alphaBlend(
        scheme.error.withValues(alpha: 0.3),
        scheme.tertiaryContainer,
      ),
      onLate: scheme.onTertiaryContainer,
      excused: scheme.secondaryContainer,
      onExcused: scheme.onSecondaryContainer,
    );
  }

  @override
  SemanticColors copyWith({
    Color? present,
    Color? onPresent,
    Color? absent,
    Color? onAbsent,
    Color? late,
    Color? onLate,
    Color? excused,
    Color? onExcused,
  }) {
    return SemanticColors(
      present: present ?? this.present,
      onPresent: onPresent ?? this.onPresent,
      absent: absent ?? this.absent,
      onAbsent: onAbsent ?? this.onAbsent,
      late: late ?? this.late,
      onLate: onLate ?? this.onLate,
      excused: excused ?? this.excused,
      onExcused: onExcused ?? this.onExcused,
    );
  }

  @override
  SemanticColors lerp(SemanticColors? other, double t) {
    if (other == null) return this;
    return SemanticColors(
      present: Color.lerp(present, other.present, t)!,
      onPresent: Color.lerp(onPresent, other.onPresent, t)!,
      absent: Color.lerp(absent, other.absent, t)!,
      onAbsent: Color.lerp(onAbsent, other.onAbsent, t)!,
      late: Color.lerp(late, other.late, t)!,
      onLate: Color.lerp(onLate, other.onLate, t)!,
      excused: Color.lerp(excused, other.excused, t)!,
      onExcused: Color.lerp(onExcused, other.onExcused, t)!,
    );
  }
}

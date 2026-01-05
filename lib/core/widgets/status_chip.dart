import 'package:flutter/material.dart';
import '../config/theme/app_semantic_colors.dart';

enum AttendanceStatusType {
  present,
  absent,
  late,
  excused,
}

/// M3-styled status chip for attendance status display.
/// Uses SemanticColors ThemeExtension for proper M3 dynamic color support.
class StatusChip extends StatelessWidget {
  final AttendanceStatusType status;
  final bool showIcon;

  const StatusChip({
    super.key,
    required this.status,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    final semanticColors = Theme.of(context).extension<SemanticColors>()!;
    final config = _getStatusConfig(status, semanticColors);

    return Chip(
      avatar: showIcon
          ? Icon(
              config.icon,
              size: 16,
              color: config.foregroundColor,
            )
          : null,
      label: Text(
        config.label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: config.foregroundColor,
              fontWeight: FontWeight.w600,
            ),
      ),
      backgroundColor: config.backgroundColor,
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  _StatusConfig _getStatusConfig(
    AttendanceStatusType status,
    SemanticColors colors,
  ) {
    return switch (status) {
      AttendanceStatusType.present => _StatusConfig(
          label: 'Present',
          backgroundColor: colors.present,
          foregroundColor: colors.onPresent,
          icon: Icons.check_circle_outlined,
        ),
      AttendanceStatusType.absent => _StatusConfig(
          label: 'Absent',
          backgroundColor: colors.absent,
          foregroundColor: colors.onAbsent,
          icon: Icons.cancel_outlined,
        ),
      AttendanceStatusType.late => _StatusConfig(
          label: 'Late',
          backgroundColor: colors.late,
          foregroundColor: colors.onLate,
          icon: Icons.access_time,
        ),
      AttendanceStatusType.excused => _StatusConfig(
          label: 'Excused',
          backgroundColor: colors.excused,
          foregroundColor: colors.onExcused,
          icon: Icons.description_outlined,
        ),
    };
  }
}

/// Filter chip variant for when users can filter by status
class FilterStatusChip extends StatelessWidget {
  final AttendanceStatusType status;
  final bool selected;
  final ValueChanged<bool>? onSelected;

  const FilterStatusChip({
    super.key,
    required this.status,
    this.selected = false,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final label = switch (status) {
      AttendanceStatusType.present => 'Present',
      AttendanceStatusType.absent => 'Absent',
      AttendanceStatusType.late => 'Late',
      AttendanceStatusType.excused => 'Excused',
    };

    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
      selectedColor: colorScheme.secondaryContainer,
    );
  }
}

class _StatusConfig {
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData icon;

  _StatusConfig({
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
  });
}

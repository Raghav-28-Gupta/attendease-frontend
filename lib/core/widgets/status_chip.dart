import 'package:flutter/material.dart';
import '../config/theme/app_colors.dart';

enum AttendanceStatusType {
  present,
  absent,
  late,
  excused,
}

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
    final config = _getStatusConfig(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: config.color.withAlpha((0.1 * 255).round()),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: config.color.withAlpha((0.3 * 255).round()),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon) ...[
            Icon(config.icon, size: 14, color: config.color),
            const SizedBox(width: 6),
          ],
          Text(
            config.label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: config.color,
            ),
          ),
        ],
      ),
    );
  }

  _StatusConfig _getStatusConfig(AttendanceStatusType status) {
    switch (status) {
      case AttendanceStatusType.present:
        return _StatusConfig(
          label: 'Present',
          color: AppColors.present,
          icon: Icons.check_circle,
        );
      case AttendanceStatusType.absent:
        return _StatusConfig(
          label: 'Absent',
          color: AppColors.absent,
          icon: Icons.cancel,
        );
      case AttendanceStatusType.late:
        return _StatusConfig(
          label: 'Late',
          color: AppColors.late,
          icon: Icons.access_time,
        );
      case AttendanceStatusType.excused:
        return _StatusConfig(
          label: 'Excused',
          color: AppColors.excused,
          icon: Icons.description,
        );
    }
  }
}

class _StatusConfig {
  final String label;
  final Color color;
  final IconData icon;

  _StatusConfig({
    required this.label,
    required this.color,
    required this.icon,
  });
}

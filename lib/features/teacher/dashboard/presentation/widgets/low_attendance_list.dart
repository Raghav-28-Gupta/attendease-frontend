import 'package:flutter/material.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../data/models/teacher_dashboard_model.dart';

/// M3-styled low attendance list widget.
class LowAttendanceList extends StatelessWidget {
  final List<LowAttendanceStudent> students;

  const LowAttendanceList({
    super.key,
    required this.students,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (students.isEmpty) {
      return Card(
        margin: const EdgeInsets.all(AppSpacing.md),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 48,
                color: colorScheme.tertiary,
              ),
              const SizedBox(height: AppSpacing.smd),
              Text(
                'All students have good attendance!',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        children: students.map((student) {
          final isCritical = student.percentage < 65;
          final statusColor =
              isCritical ? colorScheme.error : colorScheme.secondary;

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: statusColor,
              child: Text(
                student.name.substring(0, 1).toUpperCase(),
                style: textTheme.titleSmall?.copyWith(
                  color: isCritical
                      ? colorScheme.onError
                      : colorScheme.onSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              student.name,
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              '${student.subjectCode} • ${student.batchCode}',
              style: textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.smd,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${student.percentage.toStringAsFixed(1)}%',
                style: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

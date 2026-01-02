import 'package:flutter/material.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/utils/date_utils.dart';
import '../../data/models/student_dashboard_model.dart';

/// M3-styled today's classes list widget.
class TodayClassesWidget extends StatelessWidget {
  final List<TodayClassInfo> classes;

  const TodayClassesWidget({
    super.key,
    required this.classes,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (classes.isEmpty) {
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              Icon(
                Icons.event_available,
                size: 48,
                color: colorScheme.tertiary,
              ),
              const SizedBox(height: AppSpacing.smd),
              Text(
                'No classes today! 🎉',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Enjoy your day off!',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: classes.map((classInfo) {
        return Card(
          margin: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.schedule,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            title: Text(
              classInfo.subjectName,
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  '${AppDateUtils.formatTime(classInfo.startTime)} - '
                  '${AppDateUtils.formatTime(classInfo.endTime)}',
                  style: textTheme.bodySmall,
                ),
                if (classInfo.room != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    'Room: ${classInfo.room}',
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  classInfo.subjectCode,
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  classInfo.teacherName,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

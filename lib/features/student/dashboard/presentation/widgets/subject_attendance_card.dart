import 'package:flutter/material.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../data/models/student_dashboard_model.dart';

/// M3-styled subject attendance card widget.
class SubjectAttendanceCard extends StatelessWidget {
  final SubjectAttendanceInfo subject;
  final VoidCallback onTap;

  const SubjectAttendanceCard({
    super.key,
    required this.subject,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final stats = subject.stats;
    final statusColor = _getStatusColor(colorScheme, stats.status);

    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Subject Header Row
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subject.subjectCode,
                          style: textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subject.subjectName,
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.smd,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${subject.stats.percentage.toStringAsFixed(1)}%',
                      style: textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.smd),
                child: Divider(
                  height: 1,
                  color: colorScheme.outlineVariant,
                ),
              ),

              // Stats Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildStatItem(
                      context,
                      'Sessions',
                      stats.totalSessions.toString(),
                      Icons.event_note_outlined,
                      colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Expanded(
                    child: _buildStatItem(
                      context,
                      'Present',
                      stats.present.toString(),
                      Icons.check_circle_outline,
                      colorScheme.tertiary,
                    ),
                  ),
                  Expanded(
                    child: _buildStatItem(
                      context,
                      'Absent',
                      stats.absent.toString(),
                      Icons.cancel_outlined,
                      colorScheme.error,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(height: 4),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            value,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        Text(
          label,
          style: textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Color _getStatusColor(ColorScheme colorScheme, String status) {
    return switch (status.toLowerCase()) {
      'good' => colorScheme.tertiary,
      'warning' => colorScheme.secondary,
      'critical' || 'danger' => colorScheme.error,
      _ => colorScheme.primary,
    };
  }
}

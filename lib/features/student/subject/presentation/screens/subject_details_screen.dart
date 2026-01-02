import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/config/theme/app_semantic_colors.dart';
import '../../../dashboard/data/models/student_dashboard_model.dart';

/// M3-styled subject details screen.
class SubjectDetailsScreen extends ConsumerWidget {
  final SubjectAttendanceInfo subject;

  const SubjectDetailsScreen({
    super.key,
    required this.subject,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(subject.subjectCode),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subject Header - M3 styled
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.mlg),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject.subjectName,
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Code: ${subject.subjectCode}',
                    style: textTheme.bodyLarge?.copyWith(
                      color:
                          colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Semester: ${subject.semester}',
                    style: textTheme.bodyMedium?.copyWith(
                      color:
                          colorScheme.onPrimaryContainer.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Attendance Stats
            _buildStatsSection(context),

            const SizedBox(height: AppSpacing.lg),

            // Progress Section
            _buildProgressSection(context),

            const SizedBox(height: AppSpacing.lg),

            // Attendance Breakdown
            _buildBreakdownSection(context),

            const SizedBox(height: AppSpacing.lg),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final stats = subject.stats;
    final statusColor = _getStatusColor(colorScheme, stats.status);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.mlg),
          child: Column(
            children: [
              // Circular Progress
              SizedBox(
                height: 150,
                width: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: CircularProgressIndicator(
                        value: stats.percentage / 100,
                        strokeWidth: 12,
                        backgroundColor: colorScheme.surfaceContainerHighest,
                        valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${stats.percentage.toStringAsFixed(1)}%',
                          style: textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: statusColor,
                          ),
                        ),
                        Text(
                          stats.status,
                          style: textTheme.labelMedium?.copyWith(
                            color: statusColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              // Stats Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatColumn(
                    context,
                    'Total',
                    stats.totalSessions.toString(),
                    Icons.event_outlined,
                  ),
                  _buildStatColumn(
                    context,
                    'Attended',
                    stats.attended.toString(),
                    Icons.check_circle_outline,
                    colorScheme.tertiary,
                  ),
                  _buildStatColumn(
                    context,
                    'Missed',
                    stats.absent.toString(),
                    Icons.cancel_outlined,
                    colorScheme.error,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final stats = subject.stats;

    if (stats.percentage >= 75) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        child: Card(
          color: colorScheme.tertiaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.check_circle,
                    color: colorScheme.onTertiary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Great Job! 🎉',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onTertiaryContainer,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'You have excellent attendance',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onTertiaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final statusColor = _getStatusColor(colorScheme, stats.status);
    final sessionsNeeded =
        ((75 * stats.totalSessions) / 100).ceil() - stats.attended;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Card(
        color: stats.status == 'CRITICAL'
            ? colorScheme.errorContainer
            : colorScheme.secondaryContainer,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    stats.status == 'CRITICAL'
                        ? Icons.error_outline
                        : Icons.warning_amber_outlined,
                    color: stats.status == 'CRITICAL'
                        ? colorScheme.onErrorContainer
                        : colorScheme.onSecondaryContainer,
                    size: 24,
                  ),
                  const SizedBox(width: AppSpacing.smd),
                  Text(
                    stats.status == 'CRITICAL'
                        ? 'Critical Alert!'
                        : 'Attention Needed',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: stats.status == 'CRITICAL'
                          ? colorScheme.onErrorContainer
                          : colorScheme.onSecondaryContainer,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.smd),
              Text(
                'You need to attend at least $sessionsNeeded more ${sessionsNeeded > 1 ? 'classes' : 'class'} to reach 75% attendance.',
                style: textTheme.bodyMedium?.copyWith(
                  color: stats.status == 'CRITICAL'
                      ? colorScheme.onErrorContainer
                      : colorScheme.onSecondaryContainer,
                ),
              ),
              const SizedBox(height: AppSpacing.smd),
              LinearProgressIndicator(
                value: stats.percentage / 75,
                backgroundColor: colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation<Color>(statusColor),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                '${(stats.percentage / 75 * 100).toStringAsFixed(0)}% to target',
                style: textTheme.labelMedium?.copyWith(
                  color: statusColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBreakdownSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final semanticColors = Theme.of(context).extension<SemanticColors>()!;
    final stats = subject.stats;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Attendance Breakdown',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Card(
            child: Column(
              children: [
                _buildBreakdownTile(
                  context,
                  'Present',
                  stats.present,
                  stats.totalSessions,
                  Icons.check_circle_outlined,
                  semanticColors.present,
                  semanticColors.onPresent,
                ),
                Divider(height: 1, color: colorScheme.outlineVariant),
                _buildBreakdownTile(
                  context,
                  'Absent',
                  stats.absent,
                  stats.totalSessions,
                  Icons.cancel_outlined,
                  semanticColors.absent,
                  semanticColors.onAbsent,
                ),
                Divider(height: 1, color: colorScheme.outlineVariant),
                _buildBreakdownTile(
                  context,
                  'Late',
                  stats.late,
                  stats.totalSessions,
                  Icons.access_time,
                  semanticColors.late,
                  semanticColors.onLate,
                ),
                Divider(height: 1, color: colorScheme.outlineVariant),
                _buildBreakdownTile(
                  context,
                  'Excused',
                  stats.excused,
                  stats.totalSessions,
                  Icons.description_outlined,
                  semanticColors.excused,
                  semanticColors.onExcused,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(
    BuildContext context,
    String label,
    String value,
    IconData icon, [
    Color? color,
  ]) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final effectiveColor = color ?? colorScheme.onSurfaceVariant;

    return Column(
      children: [
        Icon(icon, size: 20, color: effectiveColor),
        const SizedBox(height: 4),
        Text(
          value,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: effectiveColor,
          ),
        ),
        Text(
          label,
          style: textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildBreakdownTile(
    BuildContext context,
    String label,
    int count,
    int total,
    IconData icon,
    Color bgColor,
    Color fgColor,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final percentage = total > 0 ? (count / total * 100) : 0.0;

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: fgColor, size: 20),
      ),
      title: Text(label),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            count.toString(),
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: fgColor,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            '(${percentage.toStringAsFixed(1)}%)',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(ColorScheme colorScheme, String status) {
    return switch (status.toUpperCase()) {
      'GOOD' => colorScheme.tertiary,
      'WARNING' => colorScheme.secondary,
      'CRITICAL' => colorScheme.error,
      _ => colorScheme.onSurfaceVariant,
    };
  }
}

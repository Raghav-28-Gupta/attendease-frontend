import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/widgets/empty_state_widget.dart';
import '../../../../../core/extensions/datetime_extensions.dart';
import '../../data/models/attendance_session_model.dart';
import '../providers/session_history_provider.dart';

class AttendanceHistoryScreen extends ConsumerWidget {
  final String enrollmentId;
  final String enrollmentName;

  const AttendanceHistoryScreen({
    super.key,
    required this.enrollmentId,
    required this.enrollmentName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(enrollmentSessionsProvider(enrollmentId));
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(enrollmentName),
            const SizedBox(height: 2),
            Text(
              'Attendance History',
              style: textTheme.labelSmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () =>
                ref.invalidate(enrollmentSessionsProvider(enrollmentId)),
          ),
        ],
      ),
      body: sessionsAsync.when(
        data: (sessions) {
          if (sessions.isEmpty) {
            return const EmptyStateWidget(
              message: 'No attendance sessions yet',
              icon: Icons.event_busy_outlined,
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(enrollmentSessionsProvider(enrollmentId));
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: sessions.length,
              itemBuilder: (context, index) {
                final session = sessions[index];
                return _SessionCard(session: session);
              },
            ),
          );
        },
        loading: () => const LoadingWidget(message: 'Loading sessions...'),
        error: (err, _) => AppErrorWidget(
          message: err.toString(),
          onRetry: () =>
              ref.invalidate(enrollmentSessionsProvider(enrollmentId)),
        ),
      ),
    );
  }
}

class _SessionCard extends StatelessWidget {
  final SessionWithDetails session;

  const _SessionCard({required this.session});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final sessionType = session.sessionType;
    final typeColor = _getTypeColor(colorScheme, sessionType);

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.smd),
      child: InkWell(
        onTap: () {
          context.push('/teacher/session-details/${session.id}');
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 16,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        session.date.format('dd MMM yyyy'),
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.smd,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: typeColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      sessionType,
                      style: textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: typeColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.smd),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 14,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${session.startTime} - ${session.endTime}',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.smd),
              Row(
                children: [
                  _StatChip(
                    label: 'Present',
                    value: session.count.records.toString(),
                    color: colorScheme.tertiary,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  _StatChip(
                    label: 'Absent',
                    value: '0',
                    color: colorScheme.error,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  _StatChip(
                    label: 'Late',
                    value: '0',
                    color: colorScheme.secondary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTypeColor(ColorScheme colorScheme, String type) {
    return switch (type.toUpperCase()) {
      'REGULAR' => colorScheme.primary,
      'MAKEUP' => colorScheme.secondary,
      'EXTRA' || 'LAB' => colorScheme.tertiary,
      'EXAM' => colorScheme.error,
      _ => colorScheme.onSurfaceVariant,
    };
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatChip({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

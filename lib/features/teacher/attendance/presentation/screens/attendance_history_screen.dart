import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_colors.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(enrollmentName),
            const SizedBox(height: 2),
            Text(
              'Attendance History',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: sessionsAsync.when(
        data: (sessions) {
          if (sessions.isEmpty) {
            return const EmptyStateWidget(
              message: 'No attendance sessions found',
              icon: Icons.event_busy,
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(enrollmentSessionsProvider(enrollmentId));
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sessions.length,
              itemBuilder: (context, index) {
                final session = sessions[index];
                return _SessionCard(
                  session: session,
                  onTap: () {
                    context.push(
                      '/teacher/session-details/${session.id}',
                      extra: session,
                    );
                  },
                );
              },
            ),
          );
        },
        loading: () => const LoadingWidget(message: 'Loading sessions...'),
        error: (error, stack) => AppErrorWidget(
          message: error.toString(),
          onRetry: () {
            ref.invalidate(enrollmentSessionsProvider(enrollmentId));
          },
        ),
      ),
    );
  }
}

class _SessionCard extends StatelessWidget {
  final SessionWithDetails session;
  final VoidCallback onTap;

  const _SessionCard({
    required this.session,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final attendedCount = session.count.records;
    // ignore: unused_local_variable
    final attendancePercentage = attendedCount > 0 ? 100.0 : 0.0;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date & Type Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        session.date.format('dd MMM yyyy'),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getTypeColor(session.type).withAlpha((0.1 * 255).round()),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _getTypeColor(session.type).withAlpha((0.3 * 255).round()),
                      ),
                    ),
                    child: Text(
                      session.type,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: _getTypeColor(session.type),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Time Row
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 14,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${_formatTime(session.startTime)} - ${_formatTime(session.endTime)}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Stats Row
              Row(
                children: [
                  Expanded(
                    child: _StatItem(
                      icon: Icons.people,
                      label: 'Students',
                      value: attendedCount.toString(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _StatItem(
                      icon: Icons.timelapse,
                      label: 'Time',
                      value: session.date.relativeTime,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Action Button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: onTap,
                    icon: const Icon(Icons.visibility, size: 16),
                    label: const Text('View Details'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'REGULAR':
        return AppColors.primary;
      case 'MAKEUP':
        return AppColors.warning;
      case 'EXTRA':
        return AppColors.success;
      default:
        return AppColors.textSecondary;
    }
  }

  String _formatTime(String time) {
    final parts = time.split(':');
    final hour = int.parse(parts[0]);
    final minute = parts[1];
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:$minute $period';
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

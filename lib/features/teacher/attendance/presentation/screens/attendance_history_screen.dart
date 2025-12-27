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
            const Text(
              'Attendance History',
              style: TextStyle(fontSize: 12),
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
    // ✅ FIX: Safely handle nullable type
    final sessionType = session.sessionType;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          context.push('/teacher/session-details/${session.id}');
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date and Type Row
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
                      color: _getTypeColor(sessionType)
                          .withAlpha((0.1 * 255).round()),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _getTypeColor(sessionType)
                            .withAlpha((0.3 * 255).round()),
                      ),
                    ),
                    child: Text(
                      sessionType,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: _getTypeColor(sessionType),
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
                    '${session.startTime} - ${session.endTime}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Attendance Stats
              Row(
                children: [
                  _StatChip(
                    label: 'Present',
                    value: session.count.records.toString(),
                    color: AppColors.success,
                  ),
                  const SizedBox(width: 8),
                  _StatChip(
                    label: 'Absent',
                    value: '0',
                    color: AppColors.error,
                  ),
                  const SizedBox(width: 8),
                  _StatChip(
                    label: 'Late',
                    value: '0',
                    color: AppColors.warning,
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
    switch (type.toUpperCase()) {
      case 'REGULAR':
        return AppColors.primary;
      case 'MAKEUP':
        return AppColors.warning;
      case 'EXTRA':
        return AppColors.info;
      case 'LAB':
        return AppColors.info;
      case 'TUTORIAL':
        return AppColors.warning;
      case 'EXAM':
        return AppColors.error;
      default:
        return AppColors.textSecondary;
    }
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlpha((0.1 * 255).round()),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

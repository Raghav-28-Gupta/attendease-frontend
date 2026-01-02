import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/widgets/empty_state_widget.dart';
import '../../../../../core/widgets/student_navigation_bar.dart';
import '../../../../../core/utils/date_utils.dart';
import '../../data/models/timetable_model.dart';
import '../providers/timetable_provider.dart';

class TimetableScreen extends ConsumerWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timetableAsync = ref.watch(timetableProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Timetable'),
      ),
      body: timetableAsync.when(
        data: (timetable) {
          if (timetable.timetable.isEmpty) {
            return const EmptyStateWidget(
              message: 'No timetable available',
              icon: Icons.calendar_today_outlined,
            );
          }

          // Group by day
          final groupedByDay = <String, List<TimetableEntry>>{};
          for (var entry in timetable.timetable) {
            if (!groupedByDay.containsKey(entry.dayOfWeek)) {
              groupedByDay[entry.dayOfWeek] = [];
            }
            groupedByDay[entry.dayOfWeek]!.add(entry);
          }

          // Sort days
          final daysOrder = [
            'MONDAY',
            'TUESDAY',
            'WEDNESDAY',
            'THURSDAY',
            'FRIDAY',
            'SATURDAY',
            'SUNDAY'
          ];
          final sortedDays =
              daysOrder.where((day) => groupedByDay.containsKey(day)).toList();

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(timetableProvider);
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: sortedDays.length,
              itemBuilder: (context, index) {
                final day = sortedDays[index];
                final entries = groupedByDay[day]!;

                // Sort entries by start time
                entries.sort((a, b) => a.startTime.compareTo(b.startTime));

                return _DayCard(
                  day: day,
                  entries: entries,
                );
              },
            ),
          );
        },
        loading: () => const LoadingWidget(message: 'Loading timetable...'),
        error: (error, stack) => AppErrorWidget(
          message: error.toString(),
          onRetry: () {
            ref.invalidate(timetableProvider);
          },
        ),
      ),
      bottomNavigationBar: const StudentNavigationBar(currentIndex: 1),
    );
  }
}

class _DayCard extends StatelessWidget {
  final String day;
  final List<TimetableEntry> entries;

  const _DayCard({
    required this.day,
    required this.entries,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Day Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: colorScheme.onPrimaryContainer,
                  size: 20,
                ),
                const SizedBox(width: AppSpacing.smd),
                Text(
                  _formatDayName(day),
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                const Spacer(),
                Text(
                  '${entries.length} class${entries.length > 1 ? 'es' : ''}',
                  style: textTheme.labelMedium?.copyWith(
                    color:
                        colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),

          // Classes List
          ...entries.map((entry) => _ClassTile(entry: entry)),
        ],
      ),
    );
  }

  String _formatDayName(String day) {
    return day[0].toUpperCase() + day.substring(1).toLowerCase();
  }
}

class _ClassTile extends StatelessWidget {
  final TimetableEntry entry;

  const _ClassTile({required this.entry});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outlineVariant,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Time Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppDateUtils.formatTime(entry.startTime),
                style: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                AppDateUtils.formatTime(entry.endTime),
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),

          const SizedBox(width: AppSpacing.md),

          // Divider Line
          Container(
            width: 3,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          const SizedBox(width: AppSpacing.md),

          // Subject Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.subjectEnrollment.subject.name,
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  entry.subjectEnrollment.subject.code,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 14,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        entry.subjectEnrollment.teacher.fullName,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                if (entry.room != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.room_outlined,
                        size: 14,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Room ${entry.room}',
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

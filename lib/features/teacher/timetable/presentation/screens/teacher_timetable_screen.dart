import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/widgets/empty_state_widget.dart';
import '../../../../../core/utils/date_utils.dart';
import '../../data/models/timetable_model.dart';
import '../providers/timetable_provider.dart';

class TeacherTimetableScreen extends ConsumerWidget {
  const TeacherTimetableScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timetableAsync = ref.watch(teacherTimetableProvider);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('My Timetable'),
            Text(
              'All your scheduled classes',
              style: textTheme.labelSmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(teacherTimetableProvider);
            },
          ),
        ],
      ),
      body: timetableAsync.when(
        data: (entries) {
          if (entries.isEmpty) {
            return EmptyStateWidget(
              message: 'No timetable entries yet',
              icon: Icons.calendar_month_outlined,
              actionText: 'Create Entry',
              onAction: () {
                context.push('/teacher/timetable/create');
              },
            );
          }

          final groupedByDay = <String, List<TimetableEntryModel>>{};
          for (var entry in entries) {
            if (!groupedByDay.containsKey(entry.dayOfWeek)) {
              groupedByDay[entry.dayOfWeek] = [];
            }
            groupedByDay[entry.dayOfWeek]!.add(entry);
          }

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
              ref.invalidate(teacherTimetableProvider);
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: sortedDays.length,
              itemBuilder: (context, index) {
                final day = sortedDays[index];
                final dayEntries = groupedByDay[day]!;

                dayEntries.sort((a, b) => a.startTime.compareTo(b.startTime));

                return _DayCard(
                  day: day,
                  entries: dayEntries,
                );
              },
            ),
          );
        },
        loading: () => const LoadingWidget(message: 'Loading timetable...'),
        error: (error, stack) => AppErrorWidget(
          message: error.toString(),
          onRetry: () {
            ref.invalidate(teacherTimetableProvider);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/teacher/timetable/create');
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Class'),
      ),
    );
  }
}

class _DayCard extends StatelessWidget {
  final String day;
  final List<TimetableEntryModel> entries;

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
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
          ...entries.map((entry) => _ClassTile(entry: entry)),
        ],
      ),
    );
  }

  String _formatDayName(String day) {
    return day[0].toUpperCase() + day.substring(1).toLowerCase();
  }
}

class _ClassTile extends ConsumerWidget {
  final TimetableEntryModel entry;

  const _ClassTile({required this.entry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        context.push('/teacher/timetable/${entry.id}', extra: entry);
      },
      child: Container(
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
            Container(
              width: 3,
              height: 40,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.enrollment.subject.name,
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          entry.enrollment.subject.code,
                          style: textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Icon(
                        Icons.school_outlined,
                        size: 12,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        entry.enrollment.batch.code,
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
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
                          size: 12,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Room ${entry.room}',
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}

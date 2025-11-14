import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_colors.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/widgets/empty_state_widget.dart';
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
          final sortedDays = daysOrder
              .where((day) => groupedByDay.containsKey(day))
              .toList();

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(timetableProvider);
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            context.go('/student');
          } else if (index == 2) {
            context.push('/student/profile');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Timetable',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
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
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Day Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha((0.1 * 255).round()),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: AppColors.primary,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Text(
                  _formatDayName(day),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const Spacer(),
                Text(
                  '${entries.length} class${entries.length > 1 ? 'es' : ''}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Classes List
          // ignore: unnecessary_to_list_in_spreads
          ...entries.map((entry) => _ClassTile(entry: entry)).toList(),
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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
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
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                AppDateUtils.formatTime(entry.endTime),
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),

          const SizedBox(width: 16),

          // Divider Line
          Container(
            width: 3,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          const SizedBox(width: 16),

          // Subject Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.subjectEnrollment.subject.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  entry.subjectEnrollment.subject.code,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      entry.subjectEnrollment.teacher.fullName,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                if (entry.room != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.room,
                        size: 14,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Room ${entry.room}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
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

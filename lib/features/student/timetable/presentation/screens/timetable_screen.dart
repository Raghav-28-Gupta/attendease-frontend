import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: timetableAsync.when(
        data: (timetable) {
          if (timetable.timetable.isEmpty) {
            return CustomScrollView(
              slivers: [
                _buildAppBar(colorScheme, textTheme, 0),
                const SliverFillRemaining(
                  child: EmptyStateWidget(
                    message: 'No timetable available',
                    subtitle: 'Your class schedule will appear here',
                    icon: Icons.calendar_today_outlined,
                  ),
                ),
              ],
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
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                _buildAppBar(
                    colorScheme, textTheme, timetable.timetable.length),

                // Day Cards
                SliverPadding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final day = sortedDays[index];
                        final entries = groupedByDay[day]!;
                        entries
                            .sort((a, b) => a.startTime.compareTo(b.startTime));

                        return _DayCard(
                          day: day,
                          entries: entries,
                        )
                            .animate(delay: (index * 100).ms)
                            .fadeIn(duration: 400.ms)
                            .slideY(begin: 0.1, end: 0);
                      },
                      childCount: sortedDays.length,
                    ),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 80)),
              ],
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

  SliverAppBar _buildAppBar(
      ColorScheme colorScheme, TextTheme textTheme, int classCount) {
    return SliverAppBar.large(
      expandedHeight: 180,
      pinned: true,
      stretch: true,
      backgroundColor: colorScheme.surface,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primaryContainer,
                colorScheme.secondaryContainer,
              ],
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: colorScheme.surface.withValues(alpha: 0.1),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: AppSpacing.lg,
                  bottom: 60,
                  right: AppSpacing.lg,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          Icons.calendar_month,
                          color: colorScheme.onPrimary,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Weekly Schedule',
                            style: textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onPrimaryContainer,
                            ),
                          ),
                          Text(
                            '$classCount classes this week',
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onPrimaryContainer
                                  .withValues(alpha: 0.8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        collapseMode: CollapseMode.parallax,
      ),
      title: Text(
        'Timetable',
        style: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isToday = _isCurrentDay(day);

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
              color: isToday
                  ? colorScheme.tertiaryContainer
                  : colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  isToday ? Icons.today : Icons.calendar_today_outlined,
                  color: isToday
                      ? colorScheme.onTertiaryContainer
                      : colorScheme.onPrimaryContainer,
                  size: 20,
                ),
                const SizedBox(width: AppSpacing.smd),
                Text(
                  _formatDayName(day),
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isToday
                        ? colorScheme.onTertiaryContainer
                        : colorScheme.onPrimaryContainer,
                  ),
                ),
                if (isToday) ...[
                  const SizedBox(width: AppSpacing.sm),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'TODAY',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onTertiary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                const Spacer(),
                Text(
                  '${entries.length} class${entries.length > 1 ? 'es' : ''}',
                  style: textTheme.labelMedium?.copyWith(
                    color: isToday
                        ? colorScheme.onTertiaryContainer.withValues(alpha: 0.8)
                        : colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
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

  bool _isCurrentDay(String day) {
    final now = DateTime.now();
    final weekdays = [
      'MONDAY',
      'TUESDAY',
      'WEDNESDAY',
      'THURSDAY',
      'FRIDAY',
      'SATURDAY',
      'SUNDAY'
    ];
    return weekdays[now.weekday - 1] == day;
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
          Container(
            width: 56,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  AppDateUtils.formatTime(entry.startTime),
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  height: 12,
                  width: 1,
                  color: colorScheme.outline,
                ),
                Text(
                  AppDateUtils.formatTime(entry.endTime),
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: AppSpacing.md),

          // Divider Line
          Container(
            width: 4,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colorScheme.primary,
                  colorScheme.tertiary,
                ],
              ),
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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    entry.subjectEnrollment.subject.code,
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
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

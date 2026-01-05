import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/config/theme/app_semantic_colors.dart';
import '../../../dashboard/data/models/student_dashboard_model.dart';

/// M3-styled subject details screen with Warm Earth theme.
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
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // ─────────────────────────────────────────────────────────────────────
          // HERO SECTION
          // ─────────────────────────────────────────────────────────────────────
          SliverAppBar.large(
            expandedHeight: 200,
            pinned: true,
            stretch: true,
            backgroundColor: colorScheme.surface,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildHeroBackground(context, colorScheme, textTheme),
              collapseMode: CollapseMode.parallax,
            ),
            title: Text(
              subject.subjectCode,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // ─────────────────────────────────────────────────────────────────────
          // STATS CARD
          // ─────────────────────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: _buildStatsSection(context)
                  .animate()
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: 0.2, end: 0),
            ),
          ),

          // ─────────────────────────────────────────────────────────────────────
          // PROGRESS SECTION
          // ─────────────────────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: _buildProgressSection(context)
                  .animate(delay: 100.ms)
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: 0.2, end: 0),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.lg)),

          // ─────────────────────────────────────────────────────────────────────
          // BREAKDOWN SECTION
          // ─────────────────────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: _buildBreakdownSection(context)
                  .animate(delay: 200.ms)
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: 0.2, end: 0),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
    );
  }

  Widget _buildHeroBackground(
    BuildContext context,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    final stats = subject.stats;
    final statusColor = _getStatusColor(colorScheme, stats.status);

    return Container(
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
            // Glassmorphism overlay
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

            // Content
            Positioned(
              left: AppSpacing.lg,
              bottom: 60,
              right: AppSpacing.lg,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.book_outlined,
                      color: colorScheme.onPrimary,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          subject.subjectName,
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onPrimaryContainer,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: statusColor.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                stats.status,
                                style: textTheme.labelSmall?.copyWith(
                                  color: statusColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Text(
                              'Sem ${subject.semester}',
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

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.mlg),
        child: Column(
          children: [
            // Circular Progress
            SizedBox(
              height: 160,
              width: 160,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: CircularProgressIndicator(
                      value: stats.percentage / 100,
                      strokeWidth: 14,
                      backgroundColor: colorScheme.surfaceContainerHighest,
                      valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                      strokeCap: StrokeCap.round,
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
                        'Attendance',
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
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
              children: [
                Expanded(
                  child: _buildStatColumn(
                    context,
                    'Total',
                    stats.totalSessions.toString(),
                    Icons.event_outlined,
                    colorScheme.primary,
                  ),
                ),
                Expanded(
                  child: _buildStatColumn(
                    context,
                    'Attended',
                    stats.attended.toString(),
                    Icons.check_circle_outline,
                    colorScheme.tertiary,
                  ),
                ),
                Expanded(
                  child: _buildStatColumn(
                    context,
                    'Missed',
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
    );
  }

  Widget _buildProgressSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final stats = subject.stats;

    if (stats.percentage >= 75) {
      return Card(
        color: colorScheme.tertiaryContainer,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.celebration,
                  color: colorScheme.onTertiary,
                  size: 28,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Excellent Work! 🎉',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onTertiaryContainer,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'You have maintained great attendance',
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
      );
    }

    final statusColor = _getStatusColor(colorScheme, stats.status);
    final sessionsNeeded =
        ((75 * stats.totalSessions) / 100).ceil() - stats.attended;

    return Card(
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
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: stats.status == 'CRITICAL'
                        ? colorScheme.error
                        : colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    stats.status == 'CRITICAL'
                        ? Icons.error_outline
                        : Icons.warning_amber_outlined,
                    color: stats.status == 'CRITICAL'
                        ? colorScheme.onError
                        : colorScheme.onSecondary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      const SizedBox(height: 2),
                      Text(
                        'Need $sessionsNeeded more ${sessionsNeeded > 1 ? 'classes' : 'class'} for 75%',
                        style: textTheme.bodySmall?.copyWith(
                          color: stats.status == 'CRITICAL'
                              ? colorScheme.onErrorContainer
                              : colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: (stats.percentage / 75).clamp(0.0, 1.0),
                minHeight: 8,
                backgroundColor: colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation<Color>(statusColor),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              '${(stats.percentage / 75 * 100).toStringAsFixed(0)}% to target',
              style: textTheme.labelMedium?.copyWith(
                color: stats.status == 'CRITICAL'
                    ? colorScheme.onErrorContainer
                    : colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreakdownSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final semanticColors = Theme.of(context).extension<SemanticColors>()!;
    final stats = subject.stats;

    return Column(
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
    );
  }

  Widget _buildStatColumn(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 20, color: color),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          value,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
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
          borderRadius: BorderRadius.circular(10),
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../dashboard/data/models/teacher_dashboard_model.dart';

class EnrollmentDetailsScreen extends ConsumerWidget {
  final EnrollmentInfo enrollment;

  const EnrollmentDetailsScreen({
    super.key,
    required this.enrollment,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enrollment Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              context.push(
                '/teacher/attendance-history/${enrollment.id}',
                extra: {
                  'id': enrollment.id,
                  'name':
                      '${enrollment.subject.code} - ${enrollment.batch.code}',
                },
              );
            },
            tooltip: 'View Full History',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          _buildHeaderCard(context),
          const SizedBox(height: AppSpacing.lg),
          _buildQuickActions(context),
          const SizedBox(height: AppSpacing.lg),
          _buildStatsOverview(context),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/teacher/create-session');
        },
        icon: const Icon(Icons.add),
        label: const Text('New Session'),
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.mlg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.book_outlined,
                    color: colorScheme.onPrimaryContainer,
                    size: 28,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        enrollment.subject.code,
                        style: textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        enrollment.subject.name,
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Divider(color: colorScheme.outlineVariant),
            const SizedBox(height: AppSpacing.md),
            _buildInfoRow(
              context,
              Icons.school_outlined,
              'Batch',
              '${enrollment.batch.code} - ${enrollment.batch.name}',
            ),
            const SizedBox(height: AppSpacing.smd),
            _buildInfoRow(
              context,
              Icons.calendar_today_outlined,
              'Semester',
              enrollment.subject.semester ?? 'N/A',
            ),
            const SizedBox(height: AppSpacing.smd),
            _buildInfoRow(
              context,
              Icons.groups_outlined,
              'Students',
              '${enrollment.batch.studentCount} enrolled',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
      BuildContext context, IconData icon, String label, String value) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(icon, size: 20, color: colorScheme.onSurfaceVariant),
        const SizedBox(width: AppSpacing.smd),
        Text(
          '$label: ',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: _ActionCard(
            icon: Icons.add_circle_outline,
            label: 'Take Attendance',
            color: colorScheme.tertiary,
            onTap: () => context.push('/teacher/create-session'),
          ),
        ),
        const SizedBox(width: AppSpacing.smd),
        Expanded(
          child: _ActionCard(
            icon: Icons.history,
            label: 'View History',
            color: colorScheme.primary,
            onTap: () {
              context.push(
                '/teacher/attendance-history/${enrollment.id}',
                extra: {
                  'id': enrollment.id,
                  'name':
                      '${enrollment.subject.code} - ${enrollment.batch.code}',
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStatsOverview(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Statistics',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: _StatItem(
                    icon: Icons.event_outlined,
                    label: 'Sessions',
                    value: enrollment.stats.sessionsHeld.toString(),
                    color: colorScheme.primary,
                  ),
                ),
                Expanded(
                  child: _StatItem(
                    icon: Icons.trending_up,
                    label: 'Avg. Attendance',
                    value:
                        '${enrollment.stats.averageAttendance.toStringAsFixed(1)}%',
                    color: colorScheme.tertiary,
                  ),
                ),
              ],
            ),
            if (enrollment.stats.lastSession != null) ...[
              const SizedBox(height: AppSpacing.md),
              Divider(color: colorScheme.outlineVariant),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    'Last session: ${_formatDate(enrollment.stats.lastSession!)}',
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(height: AppSpacing.smd),
              Text(
                label,
                textAlign: TextAlign.center,
                style: textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: AppSpacing.sm),
        Text(
          value,
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

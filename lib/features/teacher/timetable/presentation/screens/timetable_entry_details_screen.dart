import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/utils/date_utils.dart';
import '../../../../../core/utils/snackbar_utils.dart';
import '../../data/models/timetable_model.dart';
import '../providers/timetable_provider.dart';

class TimetableEntryDetailsScreen extends ConsumerWidget {
  final TimetableEntryModel entry;

  const TimetableEntryDetailsScreen({
    super.key,
    required this.entry,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable Entry'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Edit',
            onPressed: () {
              context.push('/teacher/timetable/edit/${entry.id}', extra: entry);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, color: colorScheme.error),
            tooltip: 'Delete',
            onPressed: () => _confirmDelete(context, ref),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.calendar_today_outlined,
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
                              _formatDayName(entry.dayOfWeek),
                              style: textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 16,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${AppDateUtils.formatTime(entry.startTime)} - ${AppDateUtils.formatTime(entry.endTime)}',
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.smd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Subject Details', style: textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.sm),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.book_outlined),
                    title: const Text('Subject'),
                    trailing: Text(entry.enrollment.subject.name),
                  ),
                  Divider(height: 1, color: colorScheme.outlineVariant),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.label_outline),
                    title: const Text('Subject Code'),
                    trailing: Text(entry.enrollment.subject.code),
                  ),
                  Divider(height: 1, color: colorScheme.outlineVariant),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.calendar_month_outlined),
                    title: const Text('Semester'),
                    trailing:
                        Text('Semester ${entry.enrollment.subject.semester}'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.smd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Batch Details', style: textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.sm),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.school_outlined),
                    title: const Text('Batch'),
                    trailing: Text(entry.enrollment.batch.name),
                  ),
                  Divider(height: 1, color: colorScheme.outlineVariant),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.label_outline),
                    title: const Text('Batch Code'),
                    trailing: Text(entry.enrollment.batch.code),
                  ),
                  Divider(height: 1, color: colorScheme.outlineVariant),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.calendar_today_outlined),
                    title: const Text('Academic Year'),
                    trailing:
                        Text(entry.enrollment.batch.academicYear ?? 'N/A'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.smd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Additional Information', style: textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.sm),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.person_outline),
                    title: const Text('Teacher'),
                    trailing: Text(entry.enrollment.teacher.fullName),
                  ),
                  if (entry.room != null) ...[
                    Divider(height: 1, color: colorScheme.outlineVariant),
                    ListTile(
                      dense: true,
                      leading: const Icon(Icons.room_outlined),
                      title: const Text('Room'),
                      trailing: Text(entry.room!),
                    ),
                  ],
                  Divider(height: 1, color: colorScheme.outlineVariant),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.access_time),
                    title: const Text('Created'),
                    trailing:
                        Text(AppDateUtils.formatDateTime(entry.createdAt)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    context.push(
                      '/teacher/timetable/edit/${entry.id}',
                      extra: entry,
                    );
                  },
                  icon: const Icon(Icons.edit_outlined),
                  label: const Text('Edit Entry'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(AppSpacing.md),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.smd),
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => _confirmDelete(context, ref),
                  icon: const Icon(Icons.delete_outline),
                  label: const Text('Delete'),
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.error,
                    foregroundColor: colorScheme.onError,
                    padding: const EdgeInsets.all(AppSpacing.md),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDayName(String day) {
    return day[0].toUpperCase() + day.substring(1).toLowerCase();
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final colorScheme = Theme.of(context).colorScheme;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(Icons.delete_outline, color: colorScheme.error),
        title: const Text('Delete Timetable Entry?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Are you sure you want to delete this timetable entry?'),
            const SizedBox(height: AppSpacing.smd),
            Container(
              padding: const EdgeInsets.all(AppSpacing.smd),
              decoration: BoxDecoration(
                color: colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning_amber_outlined,
                      color: colorScheme.onErrorContainer, size: 20),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      'This action cannot be undone.',
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.onErrorContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(
              backgroundColor: colorScheme.error,
              foregroundColor: colorScheme.onError,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      final success = await ref
          .read(timetableOperationsProvider.notifier)
          .deleteEntry(entry.id);

      if (context.mounted) {
        if (success) {
          SnackbarUtils.showSuccess(
            context,
            'Timetable entry deleted successfully',
          );
          context.pop();
        } else {
          final error = ref.read(timetableOperationsProvider).error;
          SnackbarUtils.showError(
            context,
            error?.toString() ?? 'Failed to delete entry',
          );
        }
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_colors.dart';
import '../../../../../core/utils/date_utils.dart';
import '../../../../../core/utils/snackbar_utils.dart';
import '../../../../../core/widgets/info_card.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable Entry'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit',
            onPressed: () {
              context.push('/teacher/timetable/edit/${entry.id}', extra: entry);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Delete',
            onPressed: () => _confirmDelete(context, ref),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Day & Time Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.calendar_today,
                          color: AppColors.primary,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _formatDayName(entry.dayOfWeek),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  size: 16,
                                  color: AppColors.textSecondary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${AppDateUtils.formatTime(entry.startTime)} - ${AppDateUtils.formatTime(entry.endTime)}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColors.textSecondary,
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

          const SizedBox(height: 16),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Subject Details',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.book),
                    title: const Text('Subject'),
                    trailing: Text(entry.enrollment.subject.name),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.label),
                    title: const Text('Subject Code'),
                    trailing: Text(entry.enrollment.subject.code),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.calendar_month),
                    title: const Text('Semester'),
                    trailing:
                        Text('Semester ${entry.enrollment.subject.semester}'),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Batch Details',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.school),
                    title: const Text('Batch'),
                    trailing: Text(entry.enrollment.batch.name),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.label),
                    title: const Text('Batch Code'),
                    trailing: Text(entry.enrollment.batch.code),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.calendar_today),
                    title: const Text('Academic Year'),
                    trailing: Text(entry.enrollment.batch.academicYear ?? 'N/A'),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Additional Information',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.person),
                    title: const Text('Teacher'),
                    trailing: Text(entry.enrollment.teacher.fullName),
                  ),
                  if (entry.room != null) ...[
                    const Divider(height: 1),
                    ListTile(
                      dense: true,
                      leading: const Icon(Icons.room),
                      title: const Text('Room'),
                      trailing: Text(entry.room!),
                    ),
                  ],
                  const Divider(height: 1),
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

          const SizedBox(height: 24),

          // Action Buttons
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
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit Entry'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _confirmDelete(context, ref),
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.error,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
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
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Timetable Entry?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Are you sure you want to delete this timetable entry?'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.error.withOpacity(0.3),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning, color: AppColors.error, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'This action cannot be undone.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red[900],
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
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
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
          context.pop(); // Go back to list
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

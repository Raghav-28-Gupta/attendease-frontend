import 'package:attendease_frontend/features/teacher/dashboard/presentation/providers/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/config/theme/app_semantic_colors.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/utils/snackbar_utils.dart';
import '../../../../../core/extensions/datetime_extensions.dart';
import '../../data/models/attendance_session_model.dart';
import '../providers/session_history_provider.dart';
import '../providers/attendance_provider.dart';

class SessionDetailsScreen extends ConsumerWidget {
  final String sessionId;

  const SessionDetailsScreen({
    super.key,
    required this.sessionId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsAsync = ref.watch(sessionDetailsProvider(sessionId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Session Details'),
      ),
      body: detailsAsync.when(
        data: (details) {
          final session = details;
          final records = (details['records'] as List?)
                  ?.map((r) => AttendanceRecordDetail.fromJson(
                      r as Map<String, dynamic>))
                  .toList() ??
              [];

          return _buildDetails(context, ref, session, records);
        },
        loading: () => const LoadingWidget(message: 'Loading details...'),
        error: (error, stack) => AppErrorWidget(
          message: error.toString(),
          onRetry: () {
            ref.invalidate(sessionDetailsProvider(sessionId));
          },
        ),
      ),
    );
  }

  Widget _buildDetails(
    BuildContext context,
    WidgetRef ref,
    Map<String, dynamic> session,
    List<AttendanceRecordDetail> records,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final semanticColors = Theme.of(context).extension<SemanticColors>()!;

    final dateString = session['date'] as String?;
    if (dateString == null) {
      return const Center(child: Text('Invalid session data'));
    }

    final date = DateTime.parse(session['date']);
    final startTime = session['startTime'] as String;
    final endTime = session['endTime'] as String;

    final presentCount = records.where((r) => r.status == 'PRESENT').length;
    final absentCount = records.where((r) => r.status == 'ABSENT').length;
    final lateCount = records.where((r) => r.status == 'LATE').length;
    final excusedCount = records.where((r) => r.status == 'EXCUSED').length;

    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(AppSpacing.md),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.mlg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date.format('EEEE, dd MMMM yyyy'),
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    Icon(Icons.access_time,
                        size: 16, color: colorScheme.onSurfaceVariant),
                    const SizedBox(width: 6),
                    Text(
                      '${_formatTime(startTime)} - ${_formatTime(endTime)}',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatColumn(context, 'Present', presentCount,
                        semanticColors.present, semanticColors.onPresent),
                    _buildStatColumn(context, 'Absent', absentCount,
                        semanticColors.absent, semanticColors.onAbsent),
                    _buildStatColumn(context, 'Late', lateCount,
                        semanticColors.late, semanticColors.onLate),
                    _buildStatColumn(context, 'Excused', excusedCount,
                        semanticColors.excused, semanticColors.onExcused),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: records.isEmpty
              ? Center(
                  child: Text(
                    'No records found',
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                )
              : ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  itemCount: records.length,
                  itemBuilder: (context, index) {
                    final record = records[index];
                    return _buildStudentTile(context, ref, record);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildStatColumn(BuildContext context, String label, int count,
      Color bgColor, Color fgColor) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          count.toString(),
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: fgColor,
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

  Widget _buildStudentTile(
    BuildContext context,
    WidgetRef ref,
    AttendanceRecordDetail record,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final semanticColors = Theme.of(context).extension<SemanticColors>()!;
    final (bgColor, fgColor) = _getStatusColors(semanticColors, record.status);

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: bgColor,
          child: Text(
            record.student.firstName[0].toUpperCase(),
            style: textTheme.titleSmall?.copyWith(
              color: fgColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          record.student.fullName,
          style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          'ID: ${record.student.studentId}',
          style: textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.smd,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                record.status,
                style: textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: fgColor,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit_outlined,
                  size: 20, color: colorScheme.onSurfaceVariant),
              onPressed: () => _showEditDialog(context, ref, record),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(
    BuildContext context,
    WidgetRef ref,
    AttendanceRecordDetail record,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    String selectedStatus = record.status;
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          icon: Icon(Icons.edit_outlined, color: colorScheme.primary),
          title: Text('Edit - ${record.student.fullName}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Select Status:',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: AppSpacing.smd),
              ...['PRESENT', 'ABSENT', 'LATE', 'EXCUSED'].map((status) {
                return RadioListTile<String>(
                  value: status,
                  groupValue: selectedStatus,
                  title: Text(status),
                  onChanged: (value) {
                    setState(() => selectedStatus = value!);
                  },
                );
              }),
              const SizedBox(height: AppSpacing.md),
              TextField(
                controller: reasonController,
                decoration: const InputDecoration(
                  labelText: 'Reason (optional)',
                  hintText: 'Enter reason for change',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                Navigator.pop(context);
                await _handleUpdateRecord(
                  context,
                  ref,
                  record.id,
                  selectedStatus,
                  reasonController.text.trim(),
                );
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleUpdateRecord(
    BuildContext context,
    WidgetRef ref,
    String recordId,
    String status,
    String? reason,
  ) async {
    final repository = ref.read(attendanceRepositoryProvider);

    final result = await repository.updateAttendanceRecord(
      recordId: recordId,
      status: status,
      reason: reason,
    );

    result.fold(
      (error) {
        SnackbarUtils.showError(
          context,
          'Failed to update: ${error.toString()}',
        );
      },
      (data) {
        SnackbarUtils.showSuccess(context, 'Attendance updated successfully');
        ref.invalidate(sessionDetailsProvider(sessionId));
        ref.invalidate(teacherDashboardProvider);
      },
    );
  }

  (Color, Color) _getStatusColors(
      SemanticColors semanticColors, String status) {
    return switch (status) {
      'PRESENT' => (semanticColors.present, semanticColors.onPresent),
      'ABSENT' => (semanticColors.absent, semanticColors.onAbsent),
      'LATE' => (semanticColors.late, semanticColors.onLate),
      'EXCUSED' => (semanticColors.excused, semanticColors.onExcused),
      _ => (semanticColors.present, semanticColors.onPresent),
    };
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

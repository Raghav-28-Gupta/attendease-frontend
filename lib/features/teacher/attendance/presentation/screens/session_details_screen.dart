import 'package:attendease_frontend/features/teacher/dashboard/presentation/providers/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/theme/app_colors.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/widgets/status_chip.dart';
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
          final session = details['session'];
          final records = (details['records'] as List?)
              ?.map((r) => AttendanceRecordDetail.fromJson(r))
              .toList() ?? [];

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
    final date = DateTime.parse(session['date']);
    final startTime = session['startTime'] as String;
    final endTime = session['endTime'] as String;

    // Calculate stats
    final presentCount = records.where((r) => r.status == 'PRESENT').length;
    final absentCount = records.where((r) => r.status == 'ABSENT').length;
    final lateCount = records.where((r) => r.status == 'LATE').length;
    final excusedCount = records.where((r) => r.status == 'EXCUSED').length;

    return Column(
      children: [
        // Session Info Card
        Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date.format('EEEE, dd MMMM yyyy'),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      '${_formatTime(startTime)} - ${_formatTime(endTime)}',
                      style: const TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Stats Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatColumn('Present', presentCount, AppColors.present),
                    _buildStatColumn('Absent', absentCount, AppColors.absent),
                    _buildStatColumn('Late', lateCount, AppColors.late),
                    _buildStatColumn('Excused', excusedCount, AppColors.excused),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Students List
        Expanded(
          child: records.isEmpty
              ? const Center(child: Text('No records found'))
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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

  Widget _buildStatColumn(String label, int count, Color color) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
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
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(record.status),
          child: Text(
            record.student.firstName[0].toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          record.student.fullName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text('ID: ${record.student.studentId}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _getStatusColor(record.status).withAlpha((0.1 * 255).round()),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _getStatusColor(record.status).withAlpha((0.3 * 255).round()),
                ),
              ),
              child: Text(
                record.status,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: _getStatusColor(record.status),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit, size: 20),
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
    String selectedStatus = record.status;
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text('Edit Attendance - ${record.student.fullName}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Select Status:', style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 12),
              
              // Status Radio Buttons
              ...['PRESENT', 'ABSENT', 'LATE', 'EXCUSED'].map((status) {
                return RadioListTile<String>(
                  value: status,
                  // ignore: deprecated_member_use
                  groupValue: selectedStatus,
                  title: Text(status),
                  // ignore: deprecated_member_use
                  onChanged: (value) {
                    setState(() => selectedStatus = value!);
                  },
                );
              }).toList(),

              const SizedBox(height: 16),
              
              // Reason TextField
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
            ElevatedButton(
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

  Color _getStatusColor(String status) {
    switch (status) {
      case 'PRESENT':
        return AppColors.present;
      case 'ABSENT':
        return AppColors.absent;
      case 'LATE':
        return AppColors.late;
      case 'EXCUSED':
        return AppColors.excused;
      default:
        return AppColors.textSecondary;
    }
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

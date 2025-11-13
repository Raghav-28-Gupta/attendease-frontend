import 'package:attendease_frontend/features/teacher/dashboard/presentation/providers/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_colors.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/widgets/status_chip.dart';
import '../../../../../core/utils/snackbar_utils.dart';
import '../../data/models/attendance_session_model.dart';
import '../providers/attendance_provider.dart';

class MarkAttendanceScreen extends ConsumerStatefulWidget {
  final String sessionId;

  const MarkAttendanceScreen({
    super.key,
    required this.sessionId,
  });

  @override
  ConsumerState<MarkAttendanceScreen> createState() =>
      _MarkAttendanceScreenState();
}

class _MarkAttendanceScreenState extends ConsumerState<MarkAttendanceScreen> {
  final Map<String, String> _attendanceMap = {};
  String _filterStatus = 'ALL';
  String _searchQuery = '';
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final studentsAsync = ref.watch(sessionStudentsProvider(widget.sessionId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mark Attendance'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_circle_outline),
            tooltip: 'Mark All Present',
            onPressed: () => _markAllPresent(),
          ),
        ],
      ),
      body: studentsAsync.when(
        data: (students) {
          // Initialize attendance map
          if (_attendanceMap.isEmpty) {
            for (var student in students) {
              _attendanceMap[student.student.id] = 
                  student.status.isEmpty ? 'PRESENT' : student.status;
            }
          }

          // Filter students
          final filteredStudents = students.where((student) {
            final matchesSearch = _searchQuery.isEmpty ||
                student.student.fullName
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase()) ||
                student.student.studentId
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase());

            final matchesFilter = _filterStatus == 'ALL' ||
                _attendanceMap[student.student.id] == _filterStatus;

            return matchesSearch && matchesFilter;
          }).toList();

          return Column(
            children: [
              // Search & Filter Bar
              _buildSearchAndFilter(),

              // Summary Bar
              _buildSummaryBar(students),

              // Student List
              Expanded(
                child: filteredStudents.isEmpty
                    ? const Center(
                        child: Text('No students found'),
                      )
                    : ListView.builder(
                        itemCount: filteredStudents.length,
                        itemBuilder: (context, index) {
                          final studentData = filteredStudents[index];
                          return _buildStudentTile(studentData);
                        },
                      ),
              ),

              // Submit Button
              _buildSubmitButton(students),
            ],
          );
        },
        loading: () => const LoadingWidget(message: 'Loading students...'),
        error: (error, stack) => AppErrorWidget(
          message: error.toString(),
          onRetry: () {
            ref.invalidate(sessionStudentsProvider(widget.sessionId));
          },
        ),
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.05 * 255).round()),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Search by name or student ID...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            onChanged: (value) {
              setState(() => _searchQuery = value);
            },
          ),

          const SizedBox(height: 12),

          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip('ALL', 'All'),
                const SizedBox(width: 8),
                _buildFilterChip('PRESENT', 'Present'),
                const SizedBox(width: 8),
                _buildFilterChip('ABSENT', 'Absent'),
                const SizedBox(width: 8),
                _buildFilterChip('LATE', 'Late'),
                const SizedBox(width: 8),
                _buildFilterChip('EXCUSED', 'Excused'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String value, String label) {
    final isSelected = _filterStatus == value;

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() => _filterStatus = value);
      },
      selectedColor: AppColors.primary.withAlpha((0.2 * 255).round()),
      checkmarkColor: AppColors.primary,
    );
  }

  Widget _buildSummaryBar(List<StudentAttendanceModel> students) {
    final present = _attendanceMap.values.where((s) => s == 'PRESENT').length;
    final absent = _attendanceMap.values.where((s) => s == 'ABSENT').length;
    final late = _attendanceMap.values.where((s) => s == 'LATE').length;
    final excused = _attendanceMap.values.where((s) => s == 'EXCUSED').length;

    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSummaryStat('Present', present, AppColors.present),
          _buildSummaryStat('Absent', absent, AppColors.absent),
          _buildSummaryStat('Late', late, AppColors.late),
          _buildSummaryStat('Excused', excused, AppColors.excused),
        ],
      ),
    );
  }

  Widget _buildSummaryStat(String label, int count, Color color) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 24,
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

  Widget _buildStudentTile(StudentAttendanceModel studentData) {
    final student = studentData.student;
    final currentStatus = _attendanceMap[student.id] ?? 'PRESENT';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(currentStatus),
          child: Text(
            student.firstName[0].toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          student.fullName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          'ID: ${student.studentId}',
          style: const TextStyle(fontSize: 12),
        ),
        trailing: PopupMenuButton<String>(
          initialValue: currentStatus,
          onSelected: (value) {
            setState(() {
              _attendanceMap[student.id] = value;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _getStatusColor(currentStatus).withAlpha((0.1 * 255).round()),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _getStatusColor(currentStatus).withAlpha((0.3 * 255).round()),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _getStatusIcon(currentStatus),
                  size: 16,
                  color: _getStatusColor(currentStatus),
                ),
                const SizedBox(width: 6),
                Text(
                  currentStatus,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: _getStatusColor(currentStatus),
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_drop_down,
                  size: 16,
                  color: _getStatusColor(currentStatus),
                ),
              ],
            ),
          ),
          itemBuilder: (context) => [
            _buildStatusMenuItem('PRESENT', 'Present', Icons.check_circle),
            _buildStatusMenuItem('ABSENT', 'Absent', Icons.cancel),
            _buildStatusMenuItem('LATE', 'Late', Icons.access_time),
            _buildStatusMenuItem('EXCUSED', 'Excused', Icons.description),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildStatusMenuItem(
    String value,
    String label,
    IconData icon,
  ) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 18, color: _getStatusColor(value)),
          const SizedBox(width: 12),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(List<StudentAttendanceModel> students) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.05 * 255).round()),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: AppButton(
          text: 'Submit Attendance (${students.length} students)',
          onPressed: _isSubmitting ? null : () => _handleSubmit(students),
          isLoading: _isSubmitting,
        ),
      ),
    );
  }

  void _markAllPresent() {
    setState(() {
      for (var key in _attendanceMap.keys) {
        _attendanceMap[key] = 'PRESENT';
      }
    });
    SnackbarUtils.showInfo(context, 'All students marked present');
  }

  Future<void> _handleSubmit(List<StudentAttendanceModel> students) async {
    // Confirm submission
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Submit Attendance'),
        content: Text(
          'Are you sure you want to submit attendance for ${students.length} students?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Submit'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _isSubmitting = true);

    final records = _attendanceMap.entries
        .map((entry) => AttendanceRecord(
              studentId: entry.key,
              status: entry.value,
            ))
        .toList();

    final request = MarkAttendanceRequest(
      sessionId: widget.sessionId,
      records: records,
    );

    final success = await ref
        .read(markAttendanceProvider.notifier)
        .markAttendance(request);

    if (mounted) {
      setState(() => _isSubmitting = false);

      if (success) {
        SnackbarUtils.showSuccess(
          context,
          'Attendance submitted successfully! 🎉',
        );

        // Refresh dashboard
        ref.invalidate(teacherDashboardProvider);

        // Navigate back
        context.go('/teacher');
      } else {
        final error = ref.read(markAttendanceProvider).error;
        SnackbarUtils.showError(
          context,
          error?.toString() ?? 'Failed to submit attendance',
        );
      }
    }
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

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'PRESENT':
        return Icons.check_circle;
      case 'ABSENT':
        return Icons.cancel;
      case 'LATE':
        return Icons.access_time;
      case 'EXCUSED':
        return Icons.description;
      default:
        return Icons.help;
    }
  }
}

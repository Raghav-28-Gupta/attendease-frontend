import 'package:attendease_frontend/features/teacher/dashboard/presentation/providers/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/config/theme/app_semantic_colors.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
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
    final colorScheme = Theme.of(context).colorScheme;

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
          if (_attendanceMap.isEmpty) {
            for (var student in students) {
              _attendanceMap[student.student.id] =
                  student.status.isEmpty ? 'PRESENT' : student.status;
            }
          }

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
              _buildSearchAndFilter(colorScheme),
              _buildSummaryBar(students),
              Expanded(
                child: filteredStudents.isEmpty
                    ? Center(
                        child: Text(
                          'No students found',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredStudents.length,
                        itemBuilder: (context, index) {
                          final studentData = filteredStudents[index];
                          return _buildStudentTile(studentData);
                        },
                      ),
              ),
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

  Widget _buildSearchAndFilter(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          bottom: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search by name or student ID...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            ),
            onChanged: (value) {
              setState(() => _searchQuery = value);
            },
          ),
          const SizedBox(height: AppSpacing.smd),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip('ALL', 'All'),
                const SizedBox(width: AppSpacing.sm),
                _buildFilterChip('PRESENT', 'Present'),
                const SizedBox(width: AppSpacing.sm),
                _buildFilterChip('ABSENT', 'Absent'),
                const SizedBox(width: AppSpacing.sm),
                _buildFilterChip('LATE', 'Late'),
                const SizedBox(width: AppSpacing.sm),
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
    );
  }

  Widget _buildSummaryBar(List<StudentAttendanceModel> students) {
    final colorScheme = Theme.of(context).colorScheme;
    final semanticColors = Theme.of(context).extension<SemanticColors>()!;

    final present = _attendanceMap.values.where((s) => s == 'PRESENT').length;
    final absent = _attendanceMap.values.where((s) => s == 'ABSENT').length;
    final late = _attendanceMap.values.where((s) => s == 'LATE').length;
    final excused = _attendanceMap.values.where((s) => s == 'EXCUSED').length;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      color: colorScheme.surfaceContainerLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSummaryStat('Present', present, semanticColors.present,
              semanticColors.onPresent),
          _buildSummaryStat(
              'Absent', absent, semanticColors.absent, semanticColors.onAbsent),
          _buildSummaryStat(
              'Late', late, semanticColors.late, semanticColors.onLate),
          _buildSummaryStat('Excused', excused, semanticColors.excused,
              semanticColors.onExcused),
        ],
      ),
    );
  }

  Widget _buildSummaryStat(
      String label, int count, Color bgColor, Color fgColor) {
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

  Widget _buildStudentTile(StudentAttendanceModel studentData) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final semanticColors = Theme.of(context).extension<SemanticColors>()!;
    final student = studentData.student;
    final currentStatus = _attendanceMap[student.id] ?? 'PRESENT';
    final (bgColor, fgColor) = _getStatusColors(semanticColors, currentStatus);

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: bgColor,
          child: Text(
            student.firstName[0].toUpperCase(),
            style: textTheme.titleSmall?.copyWith(
              color: fgColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          student.fullName,
          style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          'ID: ${student.studentId}',
          style: textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        trailing: PopupMenuButton<String>(
          initialValue: currentStatus,
          onSelected: (value) {
            setState(() {
              _attendanceMap[student.id] = value;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.smd,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _getStatusIcon(currentStatus),
                  size: 16,
                  color: fgColor,
                ),
                const SizedBox(width: 6),
                Text(
                  currentStatus,
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: fgColor,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.arrow_drop_down, size: 16, color: fgColor),
              ],
            ),
          ),
          itemBuilder: (context) => [
            _buildStatusMenuItem(
                semanticColors, 'PRESENT', 'Present', Icons.check_circle),
            _buildStatusMenuItem(
                semanticColors, 'ABSENT', 'Absent', Icons.cancel),
            _buildStatusMenuItem(
                semanticColors, 'LATE', 'Late', Icons.access_time),
            _buildStatusMenuItem(
                semanticColors, 'EXCUSED', 'Excused', Icons.description),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildStatusMenuItem(
    SemanticColors semanticColors,
    String value,
    String label,
    IconData icon,
  ) {
    final (_, fgColor) = _getStatusColors(semanticColors, value);
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 18, color: fgColor),
          const SizedBox(width: AppSpacing.smd),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(List<StudentAttendanceModel> students) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          top: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      child: SafeArea(
        child: AppButton.filled(
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
    final colorScheme = Theme.of(context).colorScheme;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(Icons.check_circle_outline, color: colorScheme.primary),
        title: const Text('Submit Attendance'),
        content: Text(
          'Are you sure you want to submit attendance for ${students.length} students?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
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

    final success =
        await ref.read(markAttendanceProvider.notifier).markAttendance(request);

    if (mounted) {
      setState(() => _isSubmitting = false);

      if (success) {
        SnackbarUtils.showSuccess(
          context,
          'Attendance submitted successfully! 🎉',
        );
        ref.invalidate(teacherDashboardProvider);
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

  IconData _getStatusIcon(String status) {
    return switch (status) {
      'PRESENT' => Icons.check_circle,
      'ABSENT' => Icons.cancel,
      'LATE' => Icons.access_time,
      'EXCUSED' => Icons.description,
      _ => Icons.help,
    };
  }
}

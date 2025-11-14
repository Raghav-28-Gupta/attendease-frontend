import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/theme/app_colors.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../dashboard/data/models/student_dashboard_model.dart';

class SubjectDetailsScreen extends ConsumerWidget {
  final SubjectAttendanceInfo subject;

  const SubjectDetailsScreen({
    super.key,
    required this.subject,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Note: For now, we'll use the subject data passed.
    // In production, you'd fetch detailed data from API using subject code

    return Scaffold(
      appBar: AppBar(
        title: Text(subject.subjectCode),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subject Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject.subjectName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Code: ${subject.subjectCode}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withAlpha((0.9 * 255).round()),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Semester: ${subject.semester}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withAlpha((0.8 * 255).round()),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Attendance Stats
            _buildStatsSection(),

            const SizedBox(height: 24),

            // Progress Section
            _buildProgressSection(),

            const SizedBox(height: 24),

            // Attendance Breakdown
            _buildBreakdownSection(),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection() {
    final stats = subject.stats;
    final statusColor = _getStatusColor(stats.status);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Circular Progress
              SizedBox(
                height: 150,
                width: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: CircularProgressIndicator(
                        value: stats.percentage / 100,
                        strokeWidth: 12,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${stats.percentage.toStringAsFixed(1)}%',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: statusColor,
                          ),
                        ),
                        Text(
                          stats.status,
                          style: TextStyle(
                            fontSize: 12,
                            color: statusColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Stats Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatColumn(
                    'Total',
                    stats.totalSessions.toString(),
                    Icons.event,
                  ),
                  _buildStatColumn(
                    'Attended',
                    stats.attended.toString(),
                    Icons.check_circle,
                    AppColors.success,
                  ),
                  _buildStatColumn(
                    'Missed',
                    stats.absent.toString(),
                    Icons.cancel,
                    AppColors.error,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressSection() {
    final stats = subject.stats;

    if (stats.percentage >= 75) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Card(
          color: AppColors.success.withAlpha((0.1 * 255).round()),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Great Job! 🎉',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.success,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'You have excellent attendance',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final statusColor = _getStatusColor(stats.status);
    final sessionsNeeded = ((75 * stats.totalSessions) / 100).ceil() - stats.attended;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        color: statusColor.withAlpha((0.1 * 255).round()),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    stats.status == 'CRITICAL' ? Icons.error : Icons.warning,
                    color: statusColor,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    stats.status == 'CRITICAL'
                        ? 'Critical Alert!'
                        : 'Attention Needed',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: statusColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'You need to attend at least $sessionsNeeded more ${sessionsNeeded > 1 ? 'classes' : 'class'} to reach 75% attendance.',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: stats.percentage / 75,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(statusColor),
              ),
              const SizedBox(height: 8),
              Text(
                '${(stats.percentage / 75 * 100).toStringAsFixed(0)}% to target',
                style: TextStyle(
                  fontSize: 12,
                  color: statusColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBreakdownSection() {
    final stats = subject.stats;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Attendance Breakdown',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                _buildBreakdownTile(
                  'Present',
                  stats.present,
                  stats.totalSessions,
                  Icons.check_circle,
                  AppColors.present,
                ),
                const Divider(height: 1),
                _buildBreakdownTile(
                  'Absent',
                  stats.absent,
                  stats.totalSessions,
                  Icons.cancel,
                  AppColors.absent,
                ),
                const Divider(height: 1),
                _buildBreakdownTile(
                  'Late',
                  stats.late,
                  stats.totalSessions,
                  Icons.access_time,
                  AppColors.late,
                ),
                const Divider(height: 1),
                _buildBreakdownTile(
                  'Excused',
                  stats.excused,
                  stats.totalSessions,
                  Icons.description,
                  AppColors.excused,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(
    String label,
    String value,
    IconData icon, [
    Color? color,
  ]) {
    return Column(
      children: [
        Icon(icon, size: 20, color: color ?? AppColors.textSecondary),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color ?? AppColors.textPrimary,
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

  Widget _buildBreakdownTile(
    String label,
    int count,
    int total,
    IconData icon,
    Color color,
  ) {
    final percentage = total > 0 ? (count / total * 100) : 0.0;

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withAlpha((0.1 * 255).round()),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(label),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '(${percentage.toStringAsFixed(1)}%)',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toUpperCase()) {
      case 'GOOD':
        return AppColors.success;
      case 'WARNING':
        return AppColors.warning;
      case 'CRITICAL':
        return AppColors.error;
      default:
        return AppColors.textSecondary;
    }
  }
}

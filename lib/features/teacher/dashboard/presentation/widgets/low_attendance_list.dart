import 'package:flutter/material.dart';
import '../../../../../core/config/theme/app_colors.dart';
import '../../data/models/teacher_dashboard_model.dart';

class LowAttendanceList extends StatelessWidget {
  final List<LowAttendanceStudent> students;

  const LowAttendanceList({
    super.key,
    required this.students,
  });

  @override
  Widget build(BuildContext context) {
    if (students.isEmpty) {
      return const Card(
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 48,
                color: AppColors.success,
              ),
              SizedBox(height: 12),
              Text(
                'All students have good attendance!',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: students.map((student) {
          final isCritical = student.percentage < 65;

          return ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  isCritical ? AppColors.error : AppColors.warning,
              child: Text(
                student.name.substring(0, 1).toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              student.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              '${student.subjectCode} • ${student.batchCode}',
              style: const TextStyle(fontSize: 12),
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: (isCritical ? AppColors.error : AppColors.warning)
                    .withAlpha((0.1 * 255).round()),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${student.percentage.toStringAsFixed(1)}%',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isCritical ? AppColors.error : AppColors.warning,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

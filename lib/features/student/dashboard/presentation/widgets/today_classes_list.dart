import 'package:flutter/material.dart';
import '../../../../../core/config/theme/app_colors.dart';
import '../../../../../core/utils/date_utils.dart';
import '../../data/models/student_dashboard_model.dart';

class TodayClassesWidget extends StatelessWidget {
  final List<TodayClassInfo> classes;

  const TodayClassesWidget({
    super.key,
    required this.classes,
  });

  @override
  Widget build(BuildContext context) {
    if (classes.isEmpty) {
      return const Card(
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Icon(
                Icons.event_available,
                size: 48,
                color: AppColors.success,
              ),
              SizedBox(height: 12),
              Text(
                'No classes today! 🎉',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Enjoy your day off!',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: classes.map((classInfo) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha((0.1 * 255).round()),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.schedule,
                color: AppColors.primary,
              ),
            ),
            title: Text(
              classInfo.subjectName,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  '${AppDateUtils.formatTime(classInfo.startTime)} - '
                  '${AppDateUtils.formatTime(classInfo.endTime)}',
                  style: const TextStyle(fontSize: 13),
                ),
                if (classInfo.room != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    'Room: ${classInfo.room}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  classInfo.subjectCode,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  classInfo.teacherName,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

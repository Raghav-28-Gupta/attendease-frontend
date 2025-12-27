import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_colors.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/widgets/section_header.dart';
import '../../../dashboard/data/models/teacher_dashboard_model.dart';
import '../../../attendance/presentation/providers/session_history_provider.dart';
import '../../../students/presentation/providers/student_provider.dart';

class EnrollmentDetailsScreen extends ConsumerWidget {
  final EnrollmentInfo enrollment;

  const EnrollmentDetailsScreen({
    super.key,
    required this.enrollment,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(enrollmentSessionsProvider(enrollment.id));
    final studentsAsync = ref.watch(enrollmentStudentsProvider(enrollment.id));

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
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(enrollmentSessionsProvider(enrollment.id));
          ref.invalidate(enrollmentStudentsProvider(enrollment.id));
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Header Card
            _buildHeaderCard(),
            const SizedBox(height: 24),

            // Quick Actions
            _buildQuickActions(context),
            const SizedBox(height: 24),

            // Stats Overview
            _buildStatsOverview(),
            const SizedBox(height: 24),

            // Recent Sessions
            const SectionHeader(
              title: 'Recent Sessions',
              subtitle: 'Last 5 attendance sessions',
            ),
            const SizedBox(height: 12),
            sessionsAsync.when(
              data: (sessions) {
                if (sessions.isEmpty) {
                  return const Card(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Center(
                        child: Text('No sessions yet'),
                      ),
                    ),
                  );
                }
                return Column(
                  children: sessions.take(5).map((session) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.event,
                            color: AppColors.primary,
                          ),
                        ),
                        title: Text(
                          _formatDate(session.date),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          '${session.count?.records ?? 0} students marked',
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          context.push(
                            '/teacher/session-details/${session.id}',
                          );
                        },
                      ),
                    );
                  }).toList(),
                );
              },
              loading: () => const LoadingWidget(),
              error: (err, _) => AppErrorWidget(
                message: err.toString(),
                onRetry: () =>
                    ref.invalidate(enrollmentSessionsProvider(enrollment.id)),
              ),
            ),

            const SizedBox(height: 24),

            // Enrolled Students
            const SectionHeader(
              title: 'Enrolled Students',
              subtitle: 'Students in this class',
            ),
            const SizedBox(height: 12),
            studentsAsync.when(
              data: (students) {
                if (students.isEmpty) {
                  return const Card(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Center(
                        child: Text('No students enrolled in this batch'),
                      ),
                    ),
                  );
                }
                return Column(
                  children: students.map((student) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColors.primary.withOpacity(0.1),
                          child: Text(
                            student.firstName[0].toUpperCase(),
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          '${student.firstName} ${student.lastName}',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(student.studentId),
                      ),
                    );
                  }).toList(),
                );
              },
              loading: () => const LoadingWidget(),
              error: (err, _) => AppErrorWidget(
                message: err.toString(),
                onRetry: () =>
                    ref.invalidate(enrollmentStudentsProvider(enrollment.id)),
              ),
            ),
          ],
        ),
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

  Widget _buildHeaderCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.book,
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
                        enrollment.subject.code,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        enrollment.subject.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            _buildInfoRow(
              Icons.school,
              'Batch',
              '${enrollment.batch.code} - ${enrollment.batch.name}',
            ),
            const SizedBox(height: 12),
            _buildInfoRow(
              Icons.calendar_today,
              'Semester',
              enrollment.subject.semester ?? 'N/A',
            ),
            const SizedBox(height: 12),
            _buildInfoRow(
              Icons.groups,
              'Students',
              '${enrollment.batch.studentCount} enrolled',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.textSecondary),
        const SizedBox(width: 12),
        Text(
          '$label: ',
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionCard(
            icon: Icons.add_circle,
            label: 'Take Attendance',
            color: AppColors.success,
            onTap: () => context.push('/teacher/create-session'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ActionCard(
            icon: Icons.history,
            label: 'View History',
            color: AppColors.info,
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

  Widget _buildStatsOverview() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Statistics',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _StatItem(
                    icon: Icons.event,
                    label: 'Sessions',
                    value: enrollment.stats.sessionsHeld.toString(),
                    color: AppColors.primary,
                  ),
                ),
                Expanded(
                  child: _StatItem(
                    icon: Icons.trending_up,
                    label: 'Avg. Attendance',
                    value:
                        '${enrollment.stats.averageAttendance.toStringAsFixed(1)}%',
                    color: AppColors.success,
                  ),
                ),
              ],
            ),
            if (enrollment.stats.lastSession != null) ...[
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 16,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Last session: ${_formatDate(enrollment.stats.lastSession!)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
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
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(height: 12),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
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
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
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
}

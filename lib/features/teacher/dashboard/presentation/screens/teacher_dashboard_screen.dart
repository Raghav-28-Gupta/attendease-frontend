import 'package:attendease_frontend/core/providers/socket_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_colors.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/widgets/empty_state_widget.dart';
import '../../../../../core/widgets/section_header.dart';
import '../../../../../core/widgets/connection_status_widget.dart';
import '../../../../../core/utils/logger.dart';
import '../../../../../core/services/socket_service.dart';
import '../../../../../core/services/class_reminder_service.dart';
import '../../../../../core/services/firebase_service.dart';
import '../../../../auth/presentation/providers/auth_provider.dart';
import '../providers/dashboard_provider.dart';
import '../providers/dashboard_state.dart';
import '../widgets/enrollment_card.dart';
import '../widgets/stats_card.dart';
import '../widgets/low_attendance_list.dart';
import '../../../../../core/providers/firebase_provider.dart';
import '../../../attendance/presentation/providers/attendance_socket_provider.dart';

class TeacherDashboardScreen extends ConsumerStatefulWidget {
  const TeacherDashboardScreen({super.key});

  @override
  ConsumerState<TeacherDashboardScreen> createState() =>
      _TeacherDashboardScreenState();
}

class _TeacherDashboardScreenState
    extends ConsumerState<TeacherDashboardScreen> {
  bool _remindersInitialized = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(teacherDashboardProvider.notifier).refresh();
      _initializeClassReminders();
    });
  }

  /// Initialize class reminders for today
  Future<void> _initializeClassReminders() async {
    if (_remindersInitialized) return;
    _remindersInitialized = true;

    try {
      // Register teacher FCM token
      final firebaseService = ref.read(firebaseServiceProvider);
      await firebaseService.registerTeacherFCMToken();
      AppLogger.info('✅ Teacher FCM token registered');

      // Initialize and schedule class reminders
      final reminderService = ref.read(classReminderServiceProvider);
      await reminderService.initialize();
      final count = await reminderService.scheduleRemindersForToday();

      if (count > 0) {
        AppLogger.info('✅ Scheduled $count class reminders for today');
        // Optionally show a snackbar
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('📚 Scheduled $count class reminders for today'),
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }

      // Check for pending navigation from notification tap
      final pendingNav = await reminderService.checkPendingNavigation();
      if (pendingNav != null && pendingNav['action'] == 'CREATE_SESSION') {
        if (mounted) {
          context.push('/teacher/create-session', extra: {
            'enrollmentId': pendingNav['enrollmentId'],
            'subjectCode': pendingNav['subjectCode'],
            'subjectName': pendingNav['subjectName'],
            'batchCode': pendingNav['batchCode'],
          });
        }
      }
    } catch (e) {
      AppLogger.error('❌ Failed to initialize class reminders', e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final dashboardState = ref.watch(teacherDashboardProvider);

    final user = authState.maybeWhen(
      authenticated: (u) => u,
      orElse: () => null,
    );

    ref.listen(initializeSocketProvider, (previous, next) {
      next.when(
        data: (_) {
          if (user != null) {
            AppLogger.info('✅ Socket initialized, joining teacher room');
            final socketNotifier = ref.read(attendanceSocketProvider);
            socketNotifier.joinTeacherRoom(user.id);
          }
        },
        loading: () {
          AppLogger.info('🔄 Initializing socket connection...');
        },
        error: (error, stack) {
          AppLogger.error('❌ Socket initialization failed', error);
        },
      );
    });

    ref.listen(initializeFirebaseProvider, (previous, next) {
      next.when(
        data: (_) {
          AppLogger.info('✅ Firebase ready for notifications');
        },
        loading: () {},
        error: (error, stack) {
          AppLogger.error('Firebase initialization failed', error);
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(teacherDashboardProvider.notifier).refresh();
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                _showLogoutDialog(context);
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, size: 20),
                    SizedBox(width: 12),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          const ConnectionStatusWidget(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await ref.read(teacherDashboardProvider.notifier).refresh();
              },
              child: dashboardState.when(
                initial: () =>
                    const LoadingWidget(message: 'Loading dashboard...'),
                loading: () =>
                    const LoadingWidget(message: 'Loading dashboard...'),
                loaded: (data) =>
                    _buildDashboard(context, data, user?.displayName),
                error: (message) => AppErrorWidget(
                  message: message,
                  onRetry: () {
                    ref.read(teacherDashboardProvider.notifier).refresh();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: dashboardState.maybeWhen(
        loaded: (_) => FloatingActionButton.extended(
          onPressed: () {
            context.push('/teacher/create-session');
          },
          icon: const Icon(Icons.add),
          label: const Text('New Session'),
        ),
        orElse: () => null,
      ),
    );
  }

  Widget _buildDashboard(
    BuildContext context,
    dynamic data,
    String? userName,
  ) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 80), // Add padding for FAB
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Section
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
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back,',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userName ?? 'Teacher',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Let\'s take attendance today! 📝',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Quick Stats
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              // CHANGED: Reduced from 1.3 to 1.1 to give cards more height
              childAspectRatio: 1.1,
              children: [
                StatsCard(
                  title: 'Enrollments',
                  value: data.stats.totalEnrollments.toString(),
                  icon: Icons.book,
                  color: AppColors.primary,
                ),
                StatsCard(
                  title: 'Total Students',
                  value: data.stats.totalStudents.toString(),
                  icon: Icons.groups,
                  color: AppColors.secondary,
                ),
                StatsCard(
                  title: 'Sessions Held',
                  value: data.stats.totalSessions.toString(),
                  icon: Icons.event,
                  color: AppColors.info,
                ),
                StatsCard(
                  title: 'Avg. Attendance',
                  value: '${data.stats.averageAttendance.toStringAsFixed(1)}%',
                  icon: Icons.trending_up,
                  color: AppColors.success,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Management Section
          const SectionHeader(
            title: 'Management',
            subtitle: 'Setup & Configuration',
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              // CHANGED: Reduced from 1.3 to 1.1 to match StatsCard
              childAspectRatio: 1.1,
              children: [
                _ManagementCard(
                  title: 'Batches',
                  icon: Icons.school,
                  color: Colors.blue,
                  count: '${data.stats.totalBatchesTeaching}',
                  onTap: () => context.push('/teacher/batches'),
                ),
                _ManagementCard(
                  title: 'Subjects',
                  icon: Icons.book,
                  color: Colors.orange,
                  count: '${data.stats.totalSubjects}',
                  onTap: () => context.push('/teacher/subjects'),
                ),
                _ManagementCard(
                  title: 'Enrollments',
                  icon: Icons.link,
                  color: Colors.purple,
                  count: '${data.stats.totalEnrollments}',
                  onTap: () => context.push('/teacher/enrollments'),
                ),
                _ManagementCard(
                  title: 'Timetable',
                  icon: Icons.calendar_month,
                  color: Colors.teal,
                  count: '${data.stats.totalTimetableEntries ?? 0}',
                  onTap: () => context.push('/teacher/timetable'),
                ),
                _ManagementCard(
                  title: 'Import Students',
                  icon: Icons.upload_file,
                  color: Colors.green,
                  count: 'CSV',
                  onTap: () => context.push('/teacher/students/import'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // My Enrollments
          SectionHeader(
            title: 'My Enrollments',
            subtitle: '${data.enrollments.length} active subjects',
            action: TextButton(
              onPressed: () {
                // TODO: Navigate to all enrollments
              },
              child: const Text('View All'),
            ),
          ),

          if (data.enrollments.isEmpty)
            const Padding(
              padding: EdgeInsets.all(24),
              child: EmptyStateWidget(
                message: 'No enrollments found',
                icon: Icons.book_outlined,
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                  horizontal: 16), // Added horizontal padding
              itemCount:
                  data.enrollments.length > 3 ? 3 : data.enrollments.length,
              itemBuilder: (context, index) {
                final enrollment = data.enrollments[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      bottom: 12.0), // Spacing between items
                  child: EnrollmentCard(
                    enrollment: enrollment,
                    onTap: () {
                      context.push(
                        '/teacher/enrollment/${enrollment.id}',
                        extra: enrollment,
                      );
                    },
                  ),
                );
              },
            ),

          const SizedBox(height: 24),

          // Low Attendance Alerts
          if (data.lowAttendanceStudents.isNotEmpty) ...[
            SectionHeader(
              title: 'Low Attendance Alerts',
              subtitle:
                  '${data.lowAttendanceStudents.length} students need attention',
            ),
            LowAttendanceList(students: data.lowAttendanceStudents),
          ],

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(authProvider.notifier).logout();
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }
}

class _ManagementCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String count;
  final VoidCallback onTap;

  const _ManagementCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  count,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

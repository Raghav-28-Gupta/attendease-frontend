import 'package:attendease_frontend/core/providers/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_colors.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/widgets/section_header.dart';
import '../../../../../core/widgets/info_card.dart';
import '../../../../../core/utils/logger.dart';
import '../../../../../core/providers/socket_provider.dart';
import '../../../../auth/presentation/providers/auth_provider.dart';
import '../providers/dashboard_provider.dart';
import '../providers/dashboard_state.dart';
import '../widgets/subject_attendance_card.dart';
import '../widgets/today_classes_list.dart';
import '../providers/student_socket_provider.dart';

class StudentDashboardScreen extends ConsumerStatefulWidget {
  const StudentDashboardScreen({super.key});

  @override
  ConsumerState<StudentDashboardScreen> createState() =>
      _StudentDashboardScreenState();
}

class _StudentDashboardScreenState
    extends ConsumerState<StudentDashboardScreen> {
  @override
  void initState() {
    super.initState();
    // Load dashboard data on init
    Future.microtask(() {
      ref.read(studentDashboardProvider.notifier).loadDashboard();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(studentDashboardProvider);

    // Initialize socket connection and listen for real-time updates
    ref.listen(initializeSocketProvider, (previous, next) {
      next.when(
        data: (_) {
          dashboardState.maybeWhen(
            loaded: (data) {
              // Join student room for real-time attendance updates
              final socketNotifier = ref.read(studentSocketProvider);
              socketNotifier.joinStudentRoom(data.student.id);
              AppLogger.info('📡 Joined student room: ${data.student.id}');
            },
            orElse: () {},
          );
        },
        loading: () {
          AppLogger.info('🔄 Initializing socket connection...');
        },
        error: (error, stack) {
          AppLogger.error('❌ Socket initialization failed', error);
        },
      );
    });

    // Initialize Firebase
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
        title: const Text('My Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(studentDashboardProvider.notifier).loadDashboard();
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'profile') {
                context.push('/student/profile');
              } else if (value == 'timetable') {
                context.push('/student/timetable');
              } else if (value == 'logout') {
                _showLogoutDialog(context);
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    Icon(Icons.person, size: 20),
                    SizedBox(width: 12),
                    Text('Profile'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'timetable',
                child: Row(
                  children: [
                    Icon(Icons.calendar_month, size: 20),
                    SizedBox(width: 12),
                    Text('Timetable'),
                  ],
                ),
              ),
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
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(studentDashboardProvider.notifier).loadDashboard();
        },
        child: dashboardState.when(
          initial: () => const LoadingWidget(message: 'Loading dashboard...'),
          loading: () => const LoadingWidget(message: 'Loading dashboard...'),
          loaded: (data) => _buildDashboard(context, data),
          error: (message) => AppErrorWidget(
            message: message,
            onRetry: () {
              ref.read(studentDashboardProvider.notifier).loadDashboard();
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            context.push('/student/timetable');
          } else if (index == 2) {
            context.push('/student/profile');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Timetable',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildDashboard(BuildContext context, dynamic data) {
    final overview = data.overview;
    final lowAttendanceCount = data.subjects
        .where(
            (s) => s.stats.status == 'WARNING' || s.stats.status == 'CRITICAL')
        .length;

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      // Added padding at the bottom to ensure content isn't obscured
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Header
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
                    'Hello, ${data.student.firstName}! 👋',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Student ID: ${data.student.studentId}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Batch: ${data.student.batch.code}',
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
              // CHANGED: Reduced from 1.5 to 1.1 to give cards more vertical space
              childAspectRatio: 1.1,
              children: [
                InfoCard(
                  title: 'Overall Attendance',
                  value: '${overview.overallAttendance.toStringAsFixed(1)}%',
                  icon: Icons.trending_up,
                  color: _getAttendanceColor(overview.overallAttendance),
                ),
                InfoCard(
                  title: 'Total Subjects',
                  value: overview.totalSubjects.toString(),
                  icon: Icons.book,
                  color: AppColors.primary,
                ),
                InfoCard(
                  title: 'Classes Attended',
                  value:
                      '${overview.classesAttended}/${overview.totalSessions}',
                  icon: Icons.check_circle,
                  color: AppColors.success,
                ),
                InfoCard(
                  title: 'Alerts',
                  value: lowAttendanceCount.toString(),
                  icon: Icons.warning,
                  color: lowAttendanceCount > 0
                      ? AppColors.error
                      : AppColors.success,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Today's Classes
          SectionHeader(
            title: 'Today\'s Classes',
            subtitle: data.todayClasses.isEmpty
                ? 'No classes today'
                : '${data.todayClasses.length} class${data.todayClasses.length > 1 ? 'es' : ''}',
          ),
          TodayClassesWidget(classes: data.todayClasses),

          const SizedBox(height: 24),

          // My Subjects
          SectionHeader(
            title: 'My Subjects',
            subtitle: '${data.subjects.length} enrolled',
          ),

          if (data.subjects.isEmpty)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Center(
                child: Text('No subjects enrolled'),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: data.subjects.length,
              itemBuilder: (context, index) {
                final subject = data.subjects[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SubjectAttendanceCard(
                    subject: subject,
                    onTap: () {
                      context.push(
                        '/student/subject/${subject.subjectCode}',
                        extra: subject,
                      );
                    },
                  ),
                );
              },
            ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Color _getAttendanceColor(double percentage) {
    if (percentage >= 75) return AppColors.success;
    if (percentage >= 65) return AppColors.warning;
    return AppColors.error;
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
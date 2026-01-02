import 'package:attendease_frontend/core/providers/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/widgets/section_header.dart';
import '../../../../../core/widgets/info_card.dart';
import '../../../../../core/widgets/student_navigation_bar.dart';
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
    Future.microtask(() {
      ref.read(studentDashboardProvider.notifier).loadDashboard();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(studentDashboardProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Initialize socket connection
    ref.listen(initializeSocketProvider, (previous, next) {
      next.when(
        data: (_) {
          dashboardState.maybeWhen(
            loaded: (data) {
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
        data: (_) => AppLogger.info('✅ Firebase ready for notifications'),
        loading: () {},
        error: (error, stack) =>
            AppLogger.error('Firebase initialization failed', error),
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
                _showLogoutDialog(context, colorScheme);
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    Icon(Icons.person_outline, size: 20),
                    SizedBox(width: AppSpacing.smd),
                    Text('Profile'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'timetable',
                child: Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, size: 20),
                    SizedBox(width: AppSpacing.smd),
                    Text('Timetable'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, size: 20, color: colorScheme.error),
                    const SizedBox(width: AppSpacing.smd),
                    Text('Logout', style: TextStyle(color: colorScheme.error)),
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
      bottomNavigationBar: const StudentNavigationBar(currentIndex: 0),
    );
  }

  Widget _buildDashboard(BuildContext context, dynamic data) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final overview = data.overview;
    final lowAttendanceCount = data.subjects
        .where(
            (s) => s.stats.status == 'WARNING' || s.stats.status == 'CRITICAL')
        .length;

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Header - M3 styled
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.mlg),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
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
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Student ID: ${data.student.studentId}',
                    style: textTheme.bodyMedium?.copyWith(
                      color:
                          colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Batch: ${data.student.batch.code}',
                    style: textTheme.bodyMedium?.copyWith(
                      color:
                          colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Quick Stats
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: AppSpacing.smd,
              crossAxisSpacing: AppSpacing.smd,
              childAspectRatio: 1.1,
              children: [
                InfoCard(
                  title: 'Overall Attendance',
                  value: '${overview.overallAttendance.toStringAsFixed(1)}%',
                  icon: Icons.trending_up,
                  color: _getAttendanceColor(
                      colorScheme, overview.overallAttendance),
                ),
                InfoCard(
                  title: 'Total Subjects',
                  value: overview.totalSubjects.toString(),
                  icon: Icons.book_outlined,
                  color: colorScheme.primary,
                ),
                InfoCard(
                  title: 'Classes Attended',
                  value:
                      '${overview.classesAttended}/${overview.totalSessions}',
                  icon: Icons.check_circle_outline,
                  color: colorScheme.tertiary,
                ),
                InfoCard(
                  title: 'Alerts',
                  value: lowAttendanceCount.toString(),
                  icon: Icons.warning_amber_outlined,
                  color: lowAttendanceCount > 0
                      ? colorScheme.error
                      : colorScheme.tertiary,
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Today's Classes
          SectionHeader(
            title: "Today's Classes",
            subtitle: data.todayClasses.isEmpty
                ? 'No classes today'
                : '${data.todayClasses.length} class${data.todayClasses.length > 1 ? 'es' : ''}',
          ),
          TodayClassesWidget(classes: data.todayClasses),

          const SizedBox(height: AppSpacing.lg),

          // My Subjects
          SectionHeader(
            title: 'My Subjects',
            subtitle: '${data.subjects.length} enrolled',
          ),

          if (data.subjects.isEmpty)
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Center(
                child: Text(
                  'No subjects enrolled',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              itemCount: data.subjects.length,
              itemBuilder: (context, index) {
                final subject = data.subjects[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
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

          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }

  Color _getAttendanceColor(ColorScheme colorScheme, double percentage) {
    if (percentage >= 75) return colorScheme.tertiary;
    if (percentage >= 65) return colorScheme.secondary;
    return colorScheme.error;
  }

  void _showLogoutDialog(BuildContext context, ColorScheme colorScheme) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(Icons.logout, color: colorScheme.error),
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: colorScheme.error,
              foregroundColor: colorScheme.onError,
            ),
            onPressed: () {
              Navigator.pop(context);
              ref.read(authProvider.notifier).logout();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

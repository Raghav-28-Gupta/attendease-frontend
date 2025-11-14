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
  
  @override
  void initState() {
    super.initState();
    // Load dashboard data on init
    Future.microtask(() {
      ref.read(teacherDashboardProvider.notifier).refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final dashboardState = ref.watch(teacherDashboardProvider);
    
    // Extract user from auth state
    final user = authState.maybeWhen(
      authenticated: (u) => u,
      orElse: () => null,
    );

    // Initialize socket connection and listen for real-time updates
    ref.listen(initializeSocketProvider, (previous, next) {
      next.when(
        data: (_) {
          if (user != null) {
            AppLogger.info('✅ Socket initialized, joining teacher room');
            // Join teacher room for real-time updates
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

    // Initialize Firebase (NEW)
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
          // Connection status indicator
          const ConnectionStatusWidget(),
          
          // Main dashboard content
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await ref.read(teacherDashboardProvider.notifier).refresh();
              },
              child: dashboardState.when(
                initial: () => const LoadingWidget(message: 'Loading dashboard...'),
                loading: () => const LoadingWidget(message: 'Loading dashboard...'),
                loaded: (data) => _buildDashboard(context, data, user?.displayName),
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
            // Navigate to create session screen
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
                      color: Colors.white.withAlpha((0.9 * 255).round()),
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
                      color: Colors.white.withAlpha((0.9 * 255).round()),
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
              childAspectRatio: 1.5,
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
              itemCount: data.enrollments.length > 3 ? 3 : data.enrollments.length,
              itemBuilder: (context, index) {
                final enrollment = data.enrollments[index];
                return EnrollmentCard(
                  enrollment: enrollment,
                  onTap: () {
                    // Navigate to enrollment details
                    context.push(
                      '/teacher/enrollment/${enrollment.id}',
                      extra: enrollment,
                    );
                  },
                );
              },
            ),

          const SizedBox(height: 24),

          // Low Attendance Alerts
          if (data.lowAttendanceStudents.isNotEmpty) ...[
            SectionHeader(
              title: 'Low Attendance Alerts',
              subtitle: '${data.lowAttendanceStudents.length} students need attention',
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
import 'dart:ui';
import 'package:attendease_frontend/core/providers/socket_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/widgets/connection_status_widget.dart';
import '../../../../../core/utils/logger.dart';
import '../../../../../core/services/class_reminder_service.dart';
import '../../../../../core/services/firebase_service.dart';
import '../../../../auth/presentation/providers/auth_provider.dart';
import '../providers/dashboard_provider.dart';
import '../providers/dashboard_state.dart';
import '../widgets/enrollment_card.dart';
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

  Future<void> _initializeClassReminders() async {
    if (_remindersInitialized) return;
    _remindersInitialized = true;

    try {
      final firebaseService = ref.read(firebaseServiceProvider);
      await firebaseService.registerTeacherFCMToken();
      AppLogger.info('✅ Teacher FCM token registered');

      final reminderService = ref.read(classReminderServiceProvider);
      await reminderService.initialize();
      final count = await reminderService.scheduleRemindersForToday();

      if (count > 0) {
        AppLogger.info('✅ Scheduled $count class reminders for today');
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
    final colorScheme = Theme.of(context).colorScheme;

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
        loading: () => AppLogger.info('🔄 Initializing socket connection...'),
        error: (error, stack) =>
            AppLogger.error('❌ Socket initialization failed', error),
      );
    });

    ref.listen(initializeFirebaseProvider, (previous, next) {
      next.when(
        data: (_) => AppLogger.info('✅ Firebase ready for notifications'),
        loading: () {},
        error: (error, stack) =>
            AppLogger.error('Firebase initialization failed', error),
      );
    });

    return Scaffold(
      body: Column(
        children: [
          const ConnectionStatusWidget(),
          Expanded(
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
        ],
      ),
      floatingActionButton: dashboardState.maybeWhen(
        loaded: (_) => FloatingActionButton.extended(
          onPressed: () => _showQuickActionsSheet(context),
          icon: const Icon(Icons.bolt),
          label: const Text('Quick Actions'),
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(teacherDashboardProvider.notifier).refresh();
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // ─────────────────────────────────────────────────────────────────────
          // HERO SECTION - SliverAppBar with glassmorphism
          // ─────────────────────────────────────────────────────────────────────
          SliverAppBar.large(
            expandedHeight: 200,
            pinned: true,
            stretch: true,
            backgroundColor: colorScheme.surface,
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
                    _showLogoutDialog(context, colorScheme);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'logout',
                    child: Row(
                      children: [
                        Icon(Icons.logout, size: 20, color: colorScheme.error),
                        const SizedBox(width: AppSpacing.smd),
                        Text('Logout',
                            style: TextStyle(color: colorScheme.error)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: _buildHeroBackground(
                  context, colorScheme, textTheme, userName),
              collapseMode: CollapseMode.parallax,
            ),
            title: Text(
              'Dashboard',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // ─────────────────────────────────────────────────────────────────────
          // BENTO GRID - Stats Cards
          // ─────────────────────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main Attendance Health Card
                  _AttendanceHealthCard(
                    percentage: data.stats.averageAttendance,
                    totalSessions: data.stats.totalSessions,
                  )
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .slideY(begin: 0.2, end: 0),

                  const SizedBox(height: AppSpacing.md),

                  // Sparkline Stats Row
                  Row(
                    children: [
                      Expanded(
                        child: _SparklineCard(
                          title: 'Active Students',
                          value: data.stats.totalStudents.toString(),
                          icon: Icons.groups_outlined,
                          color: colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: _SparklineCard(
                          title: 'Total Sessions',
                          value: data.stats.totalSessions.toString(),
                          icon: Icons.event_outlined,
                          color: colorScheme.tertiary,
                        ),
                      ),
                    ],
                  )
                      .animate(delay: 100.ms)
                      .fadeIn(duration: 400.ms)
                      .slideY(begin: 0.2, end: 0),

                  const SizedBox(height: AppSpacing.md),

                  // Quick Stats Row
                  Row(
                    children: [
                      Expanded(
                        child: _CompactStatCard(
                          title: 'Enrollments',
                          value: data.stats.totalEnrollments.toString(),
                          icon: Icons.book_outlined,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.smd),
                      Expanded(
                        child: _CompactStatCard(
                          title: 'Batches',
                          value: data.stats.totalBatchesTeaching.toString(),
                          icon: Icons.school_outlined,
                          color: colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.smd),
                      Expanded(
                        child: _CompactStatCard(
                          title: 'Subjects',
                          value: data.stats.totalSubjects.toString(),
                          icon: Icons.library_books_outlined,
                          color: colorScheme.tertiary,
                        ),
                      ),
                    ],
                  )
                      .animate(delay: 200.ms)
                      .fadeIn(duration: 400.ms)
                      .slideY(begin: 0.2, end: 0),
                ],
              ),
            ),
          ),

          // ─────────────────────────────────────────────────────────────────────
          // MANAGEMENT QUICK ACCESS
          // ─────────────────────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Access',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.smd),
                  SizedBox(
                    height: 90,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _QuickAccessChip(
                          label: 'Batches',
                          icon: Icons.school_outlined,
                          onTap: () => context.push('/teacher/batches'),
                        ),
                        _QuickAccessChip(
                          label: 'Subjects',
                          icon: Icons.book_outlined,
                          onTap: () => context.push('/teacher/subjects'),
                        ),
                        _QuickAccessChip(
                          label: 'Enrollments',
                          icon: Icons.link,
                          onTap: () => context.push('/teacher/enrollments'),
                        ),
                        _QuickAccessChip(
                          label: 'Timetable',
                          icon: Icons.calendar_month_outlined,
                          onTap: () => context.push('/teacher/timetable'),
                        ),
                        _QuickAccessChip(
                          label: 'Import CSV',
                          icon: Icons.upload_file_outlined,
                          onTap: () => context.push('/teacher/students/import'),
                        ),
                      ],
                    ),
                  )
                      .animate(delay: 300.ms)
                      .fadeIn(duration: 400.ms)
                      .slideX(begin: 0.1, end: 0),
                ],
              ),
            ),
          ),

          // ─────────────────────────────────────────────────────────────────────
          // ENROLLMENTS SECTION
          // ─────────────────────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Classes',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${data.enrollments.length} active',
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Enrollment List or Empty State
          if (data.enrollments.isEmpty)
            SliverToBoxAdapter(
              child: _EmptyState(
                icon: Icons.school_outlined,
                message: 'No classes yet',
                subtitle: 'Create enrollments to start taking attendance',
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index >= data.enrollments.length) return null;
                  final enrollment = data.enrollments[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.xs,
                    ),
                    child: EnrollmentCard(
                      enrollment: enrollment,
                      onTap: () {
                        context.push(
                          '/teacher/enrollment/${enrollment.id}',
                          extra: enrollment,
                        );
                      },
                    )
                        .animate(delay: (400 + (index * 50)).ms)
                        .fadeIn(duration: 300.ms)
                        .slideX(begin: 0.1, end: 0),
                  );
                },
                childCount:
                    data.enrollments.length > 5 ? 5 : data.enrollments.length,
              ),
            ),

          // ─────────────────────────────────────────────────────────────────────
          // LOW ATTENDANCE ALERTS
          // ─────────────────────────────────────────────────────────────────────
          if (data.lowAttendanceStudents.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    Icon(Icons.warning_amber_rounded,
                        color: colorScheme.error, size: 20),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      'Attention Required',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.error,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: LowAttendanceList(students: data.lowAttendanceStudents),
              ),
            ),
          ],

          // Bottom spacing for FAB
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroBackground(
    BuildContext context,
    ColorScheme colorScheme,
    TextTheme textTheme,
    String? userName,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primaryContainer,
            colorScheme.secondaryContainer,
          ],
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            // Glassmorphism overlay
            Positioned.fill(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: colorScheme.surface.withValues(alpha: 0.1),
                  ),
                ),
              ),
            ),

            // Content
            Positioned(
              left: AppSpacing.lg,
              bottom: 60,
              right: AppSpacing.lg,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: colorScheme.primary,
                    child: Text(
                      (userName ?? 'T')[0].toUpperCase(),
                      style: textTheme.titleLarge?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Welcome back,',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onPrimaryContainer
                                .withValues(alpha: 0.8),
                          ),
                        ),
                        Text(
                          userName ?? 'Teacher',
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showQuickActionsSheet(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.add_circle_outline,
                    color: colorScheme.onPrimaryContainer),
              ),
              title: const Text('Create Session'),
              subtitle: const Text('Start taking attendance now'),
              onTap: () {
                Navigator.pop(context);
                context.push('/teacher/create-session');
              },
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.person_add_outlined,
                    color: colorScheme.onSecondaryContainer),
              ),
              title: const Text('Import Students'),
              subtitle: const Text('Add students via CSV'),
              onTap: () {
                Navigator.pop(context);
                context.push('/teacher/students/import');
              },
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.calendar_month_outlined,
                    color: colorScheme.onTertiaryContainer),
              ),
              title: const Text('Manage Timetable'),
              subtitle: const Text('View and edit your schedule'),
              onTap: () {
                Navigator.pop(context);
                context.push('/teacher/timetable');
              },
            ),
          ],
        ),
      ),
    );
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

// ─────────────────────────────────────────────────────────────────────────────
// BENTO GRID WIDGETS
// ─────────────────────────────────────────────────────────────────────────────

class _AttendanceHealthCard extends StatelessWidget {
  final double percentage;
  final int totalSessions;

  const _AttendanceHealthCard({
    required this.percentage,
    required this.totalSessions,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.mlg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.favorite_outline, color: colorScheme.tertiary),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Attendance Health',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${percentage.toStringAsFixed(1)}%',
                  style: textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.tertiary,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'average',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: percentage / 100,
                minHeight: 8,
                backgroundColor: colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation<Color>(colorScheme.tertiary),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              '$totalSessions sessions conducted',
              style: textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SparklineCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _SparklineCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: color),
                const Spacer(),
                Container(
                  width: 40,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: CustomPaint(
                    painter: _SparklinePainter(color: color),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              value,
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              title,
              style: textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final Color color;

  _SparklinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: 0.6)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height * 0.7);
    path.lineTo(size.width * 0.25, size.height * 0.4);
    path.lineTo(size.width * 0.5, size.height * 0.6);
    path.lineTo(size.width * 0.75, size.height * 0.2);
    path.lineTo(size.width, size.height * 0.3);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _CompactStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _CompactStatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.smd),
        child: Column(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(height: AppSpacing.xs),
            Text(
              value,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAccessChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _QuickAccessChip({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(right: AppSpacing.smd),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 80,
          padding: const EdgeInsets.all(AppSpacing.smd),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child:
                    Icon(icon, size: 18, color: colorScheme.onPrimaryContainer),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                label,
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String message;
  final String subtitle;

  const _EmptyState({
    required this.icon,
    required this.message,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xxl),
      child: Column(
        children: [
          Icon(icon, size: 80, color: colorScheme.outline),
          const SizedBox(height: AppSpacing.md),
          Text(
            message,
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            subtitle,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.outline,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

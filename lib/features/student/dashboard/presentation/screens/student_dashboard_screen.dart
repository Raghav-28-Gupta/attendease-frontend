import 'dart:ui';
import 'package:attendease_frontend/core/providers/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
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
      body: dashboardState.when(
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

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(studentDashboardProvider.notifier).loadDashboard();
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // ─────────────────────────────────────────────────────────────────────
          // HERO SECTION - SliverAppBar with glassmorphism
          // ─────────────────────────────────────────────────────────────────────
          SliverAppBar.large(
            expandedHeight: 220,
            pinned: true,
            stretch: true,
            backgroundColor: colorScheme.surface,
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
                        Text('Logout',
                            style: TextStyle(color: colorScheme.error)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: _buildHeroBackground(context, colorScheme, textTheme,
                  data.student.firstName, data.student.studentId),
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
          // ATTENDANCE HEALTH CARD
          // ─────────────────────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main Attendance Health Card
                  _AttendanceHealthCard(
                    percentage: overview.overallAttendance,
                    attended: overview.classesAttended,
                    total: overview.totalSessions,
                  )
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .slideY(begin: 0.2, end: 0),

                  const SizedBox(height: AppSpacing.md),

                  // Stats Row
                  Row(
                    children: [
                      Expanded(
                        child: _SparklineCard(
                          title: 'Subjects',
                          value: overview.totalSubjects.toString(),
                          icon: Icons.book_outlined,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: _SparklineCard(
                          title: 'Alerts',
                          value: lowAttendanceCount.toString(),
                          icon: Icons.warning_amber_outlined,
                          color: lowAttendanceCount > 0
                              ? colorScheme.error
                              : colorScheme.tertiary,
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
                          title: 'Present',
                          value: overview.classesAttended.toString(),
                          icon: Icons.check_circle_outline,
                          color: colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.smd),
                      Expanded(
                        child: _CompactStatCard(
                          title: 'Absent',
                          value: (overview.totalSessions -
                                  overview.classesAttended)
                              .toString(),
                          icon: Icons.cancel_outlined,
                          color: colorScheme.error,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.smd),
                      Expanded(
                        child: _CompactStatCard(
                          title: 'Sessions',
                          value: overview.totalSessions.toString(),
                          icon: Icons.event_outlined,
                          color: colorScheme.secondary,
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
          // TODAY'S CLASSES
          // ─────────────────────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today's Classes",
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        data.todayClasses.isEmpty
                            ? 'No classes'
                            : '${data.todayClasses.length} class${data.todayClasses.length > 1 ? 'es' : ''}',
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.smd),
                  TodayClassesWidget(classes: data.todayClasses),
                ],
              )
                  .animate(delay: 300.ms)
                  .fadeIn(duration: 400.ms)
                  .slideX(begin: 0.1, end: 0),
            ),
          ),

          // ─────────────────────────────────────────────────────────────────────
          // MY SUBJECTS SECTION
          // ─────────────────────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Subjects',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${data.subjects.length} enrolled',
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Subjects List or Empty State
          if (data.subjects.isEmpty)
            SliverToBoxAdapter(
              child: _EmptyState(
                icon: Icons.book_outlined,
                message: 'No subjects enrolled',
                subtitle: 'Your enrolled subjects will appear here',
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index >= data.subjects.length) return null;
                  final subject = data.subjects[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.xs,
                    ),
                    child: SubjectAttendanceCard(
                      subject: subject,
                      onTap: () {
                        context.push(
                          '/student/subject/${subject.subjectCode}',
                          extra: subject,
                        );
                      },
                    )
                        .animate(delay: (400 + (index * 50)).ms)
                        .fadeIn(duration: 300.ms)
                        .slideX(begin: 0.1, end: 0),
                  );
                },
                childCount: data.subjects.length,
              ),
            ),

          // Bottom spacing
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
    String firstName,
    String studentId,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primaryContainer,
            colorScheme.tertiaryContainer,
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
                    radius: 32,
                    backgroundColor: colorScheme.primary,
                    child: Text(
                      firstName[0].toUpperCase(),
                      style: textTheme.headlineSmall?.copyWith(
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
                          'Hello, $firstName! 👋',
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'ID: $studentId',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onPrimaryContainer
                                .withValues(alpha: 0.8),
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
  final int attended;
  final int total;

  const _AttendanceHealthCard({
    required this.percentage,
    required this.attended,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final healthColor = _getHealthColor(colorScheme, percentage);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.mlg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.favorite_outline, color: healthColor),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Attendance Health',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: healthColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _getHealthLabel(percentage),
                    style: textTheme.labelSmall?.copyWith(
                      color: healthColor,
                      fontWeight: FontWeight.w600,
                    ),
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
                    color: healthColor,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'overall',
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
                minHeight: 10,
                backgroundColor: colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation<Color>(healthColor),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              '$attended of $total sessions attended',
              style: textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getHealthColor(ColorScheme colorScheme, double percentage) {
    if (percentage >= 75) return colorScheme.tertiary;
    if (percentage >= 65) return colorScheme.secondary;
    return colorScheme.error;
  }

  String _getHealthLabel(double percentage) {
    if (percentage >= 85) return 'Excellent';
    if (percentage >= 75) return 'Good';
    if (percentage >= 65) return 'Warning';
    return 'Critical';
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

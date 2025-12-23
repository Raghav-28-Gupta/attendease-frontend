import 'package:attendease_frontend/core/utils/logger.dart';
import 'package:attendease_frontend/features/teacher/attendance/presentation/screens/attendance_history_screen.dart';
import 'package:attendease_frontend/features/teacher/attendance/presentation/screens/session_details_screen.dart';
import 'package:attendease_frontend/features/teacher/batch/data/models/batch_model.dart';
import 'package:attendease_frontend/features/teacher/batch/presentation/screens/batch_form_screen.dart';
import 'package:attendease_frontend/features/teacher/batch/presentation/screens/batches_screen.dart';
import 'package:attendease_frontend/features/teacher/enrollment/presentation/screens/enrollment_form_screen.dart';
import 'package:attendease_frontend/features/teacher/enrollment/presentation/screens/enrollments_screen.dart';
import 'package:attendease_frontend/features/teacher/students/presentation/screens/import_students_screen.dart';
import 'package:attendease_frontend/features/teacher/subject/data/models/subject_model.dart';
import 'package:attendease_frontend/features/teacher/subject/presentation/screens/subject_form_screen.dart';
import 'package:attendease_frontend/features/teacher/subject/presentation/screens/subjects_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../features/auth/presentation/screens/splash_screen.dart';
import '../../../features/auth/presentation/screens/login_screen.dart';
import '../../../features/auth/presentation/screens/change_password_screen.dart';
import '../../../features/teacher/dashboard/presentation/screens/teacher_dashboard_screen.dart';
import '../../../features/teacher/attendance/presentation/screens/create_session_screen.dart';
import '../../../features/teacher/attendance/presentation/screens/mark_attendance_screen.dart';
import '../../../features/student/dashboard/presentation/screens/student_dashboard_screen.dart';
import '../../../features/student/timetable/presentation/screens/timetable_screen.dart';
import '../../../features/student/profile/presentation/screens/profile_screen.dart';
import '../../../features/student/subject/presentation/screens/subject_details_screen.dart';
import '../../../features/student/dashboard/data/models/student_dashboard_model.dart';
import '../../../features/teacher/timetable/presentation/screens/teacher_timetable_screen.dart';
import '../../../features/teacher/timetable/presentation/screens/create_timetable_screen.dart';
import '../../../features/teacher/timetable/presentation/screens/timetable_entry_details_screen.dart';
import '../../../features/teacher/timetable/data/models/timetable_model.dart';


final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final currentPath = state.matchedLocation;
      
      // Log current state for debugging
      AppLogger.info('🚦 Router redirect - path: $currentPath, authState: ${authState.runtimeType}');
      
      final isAuthenticated = authState.maybeWhen(
        authenticated: (_) => true,
        orElse: () => false,
      );
      final isLoading = authState.maybeWhen(
        loading: () => true,
        initial: () => true,
        orElse: () => false,
      );
      final isUnauthenticated = authState.maybeWhen(
        unauthenticated: () => true,
        error: (_) => true,
        orElse: () => false,
      );
      final isLoginRoute = state.matchedLocation == '/login';
      final isSplashRoute = state.matchedLocation == '/';

      // Stay on splash while loading (but only if already on splash)
      if (isLoading) {
        AppLogger.info('⏳ Auth loading - staying on splash');
        return isSplashRoute ? null : '/';
      }

      // If unauthenticated, go to login
      if (isUnauthenticated) {
        AppLogger.info('🔓 Unauthenticated - redirecting to login');
        return isLoginRoute ? null : '/login';
      }

      // If authenticated, redirect away from splash/login
      if (isAuthenticated) {
        if (isLoginRoute || isSplashRoute) {
          final user = authState.maybeWhen(
            authenticated: (u) => u,
            orElse: () => null,
          );
          if (user != null) {
            final destination = user.isTeacher ? '/teacher' : '/student';
            AppLogger.info('✅ Authenticated - redirecting to $destination');
            return destination;
          }
        }
        return null; // Stay on current route
      }

      return null;
    },
    routes: [
      // Splash Screen
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),

      // Auth Routes
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/change-password',
        builder: (context, state) => const ChangePasswordScreen(),
      ),

      // Teacher Routes
      GoRoute(
        path: '/teacher',
        builder: (context, state) => const TeacherDashboardScreen(),
        routes: [
          // Create Session
          GoRoute(
            path: 'create-session',
            builder: (context, state) => const CreateSessionScreen(),
          ),
          
          // Mark Attendance
          GoRoute(
            path: 'mark-attendance/:sessionId',
            builder: (context, state) {
              final sessionId = state.pathParameters['sessionId']!;
              return MarkAttendanceScreen(sessionId: sessionId);
            },
          ),

          // Enrollment Details (TODO: implement later)
          GoRoute(
            path: 'enrollment/:enrollmentId',
            builder: (context, state) {
              // final enrollmentId = state.pathParameters['enrollmentId']!;
              return const Scaffold(
                body: Center(child: Text('Enrollment Details Coming Soon')),
              );
            },
          ),

          // Attendance History
          GoRoute(
            path: 'attendance-history/:enrollmentId',
            builder: (context, state) {
              final enrollmentId = state.pathParameters['enrollmentId']!;
              final extra = state.extra as Map<String, dynamic>?;
              final enrollmentName = extra?['name'] ?? 'Attendance History';
              
              return AttendanceHistoryScreen(
                enrollmentId: enrollmentId,
                enrollmentName: enrollmentName,
              );
            },
          ),

          // Session Details
          GoRoute(
            path: 'session-details/:sessionId',
            builder: (context, state) {
              final sessionId = state.pathParameters['sessionId']!;
              return SessionDetailsScreen(sessionId: sessionId);
            },
          ),

          // Batches
          GoRoute(
            path: 'batches',
            builder: (context, state) => const BatchesScreen(),
            routes: [
              GoRoute(
                path: 'create',
                builder: (context, state) => const BatchFormScreen(),
              ),
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final batch = state.extra; // pass BatchModel when navigating
                  return BatchFormScreen(batch: batch as BatchModel?);
                },
              ),
            ],
          ),

          // Subjects
          GoRoute(
            path: 'subjects',
            builder: (context, state) => const SubjectsScreen(),
            routes: [
              GoRoute(
                path: 'create',
                builder: (context, state) => const SubjectFormScreen(),
              ),
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final subject = state.extra;
                  return SubjectFormScreen(subject: subject as SubjectModel?);
                },
              ),
            ],
          ),

          // Enrollments
          GoRoute(
            path: 'enrollments',
            builder: (context, state) => const EnrollmentsScreen(),
            routes: [
              GoRoute(
                path: 'create',
                builder: (context, state) => const EnrollmentFormScreen(),
              ),
            ],
          ),

          // Timetable Routes
          GoRoute(
            path: 'timetable',
            builder: (context, state) => const TeacherTimetableScreen(),
            routes: [
              GoRoute(
                path: 'create',
                builder: (context, state) => const CreateTimetableScreen(),
              ),
              GoRoute(
                path: 'edit/:id',
                builder: (context, state) {
                  final entry = state.extra as TimetableEntryModel?;
                  return CreateTimetableScreen(entry: entry);
                },
              ),
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final entry = state.extra as TimetableEntryModel;
                  return TimetableEntryDetailsScreen(entry: entry);
                },
              ),
            ],
          ),

          // Import students
          GoRoute(
            path: 'students/import',
            builder: (context, state) => const ImportStudentsScreen(),
          ),
        ],
      ),

      // Student Routes
      GoRoute(
        path: '/student',
        builder: (context, state) => const StudentDashboardScreen(),
        routes: [
          // Timetable
          GoRoute(
            path: 'timetable',
            builder: (context, state) => const TimetableScreen(),
          ),
          
          // Profile
          GoRoute(
            path: 'profile',
            builder: (context, state) => const ProfileScreen(),
          ),
          
          // Subject Details
          GoRoute(
            path: 'subject/:subjectCode',
            builder: (context, state) {
              final subject = state.extra as SubjectAttendanceInfo;
              return SubjectDetailsScreen(subject: subject);
            },
          ),
        ],
      ),
    ],

    // Error page
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error: ${state.error}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
});

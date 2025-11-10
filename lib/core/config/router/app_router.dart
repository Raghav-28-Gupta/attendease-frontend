import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../features/auth/presentation/screens/splash_screen.dart';
import '../../../features/auth/presentation/screens/login_screen.dart';
import '../../../features/auth/presentation/screens/change_password_screen.dart';
import '../../../features/teacher/dashboard/presentation/screens/teacher_dashboard_screen.dart';
import '../../../features/student/dashboard/presentation/screens/student_dashboard_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isAuthenticated = authState.maybeWhen(
        authenticated: (_) => true,
        orElse: () => false,
      );
      final isLoading = authState.maybeWhen(
        loading: () => true,
        initial: () => true,
        orElse: () => false,
      );
      final isLoginRoute = state.matchedLocation == '/login';
      final isSplashRoute = state.matchedLocation == '/';

      // Show splash while checking auth
      if (isLoading && !isSplashRoute) {
        return '/';
      }

      // Redirect to login if not authenticated
      if (!isAuthenticated && !isLoginRoute && !isSplashRoute) {
        return '/login';
      }

      // Redirect to appropriate dashboard if already logged in
      if (isAuthenticated && (isLoginRoute || isSplashRoute)) {
        final user = authState.maybeWhen(
          authenticated: (u) => u,
          orElse: () => null,
        );
        if(user != null)
        return user.isTeacher ? '/teacher' : '/student';
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
          // Add teacher sub-routes here later
          // GoRoute(
          //   path: 'attendance',
          //   builder: (context, state) => AttendanceScreen(),
          // ),
        ],
      ),

      // Student Routes
      GoRoute(
        path: '/student',
        builder: (context, state) => const StudentDashboardScreen(),
        routes: [
          // Add student sub-routes here later
          // GoRoute(
          //   path: 'timetable',
          //   builder: (context, state) => TimetableScreen(),
          // ),
        ],
      ),
    ],

    // Error page
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ),
  );
});

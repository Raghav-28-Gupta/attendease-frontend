import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/services/socket_service.dart';
import '../../../../../core/config/socket_config.dart';
import '../../../../../core/utils/logger.dart';
import './dashboard_provider.dart';

// Student socket events provider
final studentSocketProvider = Provider<StudentSocketNotifier>((ref) {
  final socketService = ref.watch(socketServiceProvider);
  final dashboardNotifier = ref.read(studentDashboardProvider.notifier);
  
  return StudentSocketNotifier(
    socketService: socketService,
    dashboardNotifier: dashboardNotifier,
  );
});

class StudentSocketNotifier {
  final SocketService socketService;
  final StudentDashboardNotifier dashboardNotifier;

  StudentSocketNotifier({
    required this.socketService,
    required this.dashboardNotifier,
  });

  /// Join student's room for real-time updates
  void joinStudentRoom(String studentId) {
    socketService.joinRoom('student:$studentId');
    _setupListeners();
  }

  /// Leave student's room
  void leaveStudentRoom(String studentId) {
    socketService.leaveRoom('student:$studentId');
    _removeListeners();
  }

  /// Setup event listeners
  void _setupListeners() {
    // Listen to attendance marked event
    socketService.on(SocketConfig.eventAttendanceMarked, (data) {
      AppLogger.info('📢 Student: Attendance marked event received');
      _handleAttendanceMarked(data);
    });

    // Listen to low attendance alert
    socketService.on(SocketConfig.eventLowAttendanceAlert, (data) {
      AppLogger.info('📢 Student: Low attendance alert received: $data');
      _handleLowAttendanceAlert(data);
    });
  }

  /// Remove event listeners
  void _removeListeners() {
    socketService.off(SocketConfig.eventAttendanceMarked);
    socketService.off(SocketConfig.eventLowAttendanceAlert);
  }

  /// Handle attendance marked event
  void _handleAttendanceMarked(dynamic data) {
    // Refresh dashboard to show updated attendance
    dashboardNotifier.refresh();
  }

  /// Handle low attendance alert
  void _handleLowAttendanceAlert(dynamic data) {
    // Show notification or update UI
    dashboardNotifier.refresh();
    
    // You can also show a local notification here
    AppLogger.warning('⚠️ Low attendance alert: $data');
  }
}

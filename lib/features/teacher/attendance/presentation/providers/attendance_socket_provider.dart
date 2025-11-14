import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/services/socket_service.dart';
import '../../../../../core/config/socket_config.dart';
import '../../../../../core/utils/logger.dart';
import '../../../dashboard/presentation/providers/dashboard_provider.dart';

// Attendance socket events provider
final attendanceSocketProvider = Provider<AttendanceSocketNotifier>((ref) {
  final socketService = ref.watch(socketServiceProvider);
  final dashboardNotifier = ref.read(teacherDashboardProvider.notifier);
  
  return AttendanceSocketNotifier(
    socketService: socketService,
    dashboardNotifier: dashboardNotifier,
  );
});

class AttendanceSocketNotifier {
  final SocketService socketService;
  final DashboardNotifier dashboardNotifier;

  AttendanceSocketNotifier({
    required this.socketService,
    required this.dashboardNotifier,
  });

  /// Join teacher's room for real-time updates
  void joinTeacherRoom(String teacherId) {
    socketService.joinRoom('teacher:$teacherId');
    _setupListeners();
  }

  /// Leave teacher's room
  void leaveTeacherRoom(String teacherId) {
    socketService.leaveRoom('teacher:$teacherId');
    _removeListeners();
  }

  /// Join session room for marking attendance
  void joinSessionRoom(String sessionId) {
    socketService.joinRoom('session:$sessionId');
    AppLogger.info('Joined session room: $sessionId');
  }

  /// Leave session room
  void leaveSessionRoom(String sessionId) {
    socketService.leaveRoom('session:$sessionId');
    AppLogger.info('Left session room: $sessionId');
  }

  /// Setup event listeners
  void _setupListeners() {
    // Listen to attendance marked event
    socketService.on(SocketConfig.eventAttendanceMarked, (data) {
      AppLogger.info('📢 Attendance marked event received: $data');
      _handleAttendanceMarked(data);
    });

    // Listen to attendance updated event
    socketService.on(SocketConfig.eventAttendanceUpdated, (data) {
      AppLogger.info('📢 Attendance updated event received: $data');
      _handleAttendanceUpdated(data);
    });

    // Listen to session created event
    socketService.on(SocketConfig.eventSessionCreated, (data) {
      AppLogger.info('📢 Session created event received: $data');
      _handleSessionCreated(data);
    });
  }

  /// Remove event listeners
  void _removeListeners() {
    socketService.off(SocketConfig.eventAttendanceMarked);
    socketService.off(SocketConfig.eventAttendanceUpdated);
    socketService.off(SocketConfig.eventSessionCreated);
  }

  /// Handle attendance marked event
  void _handleAttendanceMarked(dynamic data) {
    // Refresh dashboard to show updated stats
    dashboardNotifier.refresh();
  }

  /// Handle attendance updated event
  void _handleAttendanceUpdated(dynamic data) {
    // Refresh dashboard
    dashboardNotifier.refresh();
  }

  /// Handle session created event
  void _handleSessionCreated(dynamic data) {
    // Refresh dashboard to show new session
    dashboardNotifier.refresh();
  }
}

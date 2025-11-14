import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/services/socket_service.dart';
import '../../../../../core/config/socket_config.dart';
import '../../../../../core/utils/logger.dart';
import '../../../dashboard/presentation/providers/dashboard_provider.dart';
import '../../../../../core/providers/notification_provider.dart';
import '../../../../../core/models/app_notification.dart';


// Attendance socket events provider
final attendanceSocketProvider = Provider<AttendanceSocketNotifier>((ref) {
  final socketService = ref.watch(socketServiceProvider);
  final dashboardNotifier = ref.read(teacherDashboardProvider.notifier);
  final notificationNotifier = ref.read(notificationsProvider.notifier);
  
  return AttendanceSocketNotifier(
    socketService: socketService,
    dashboardNotifier: dashboardNotifier,
    notificationNotifier: notificationNotifier,
  );
});

class AttendanceSocketNotifier {
  final SocketService socketService;
  final DashboardNotifier dashboardNotifier;
  final NotificationNotifier notificationNotifier;


  AttendanceSocketNotifier({
    required this.socketService,
    required this.dashboardNotifier,
    required this.notificationNotifier,
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
    AppLogger.info('📢 Attendance marked event received: $data');
    // Show notification
    notificationNotifier.addNotification(
      AppNotification(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: 'Attendance Marked',
        message: 'Attendance has been successfully marked for the session',
        type: NotificationType.success,
        timestamp: DateTime.now(),
        data: data as Map<String, dynamic>?,
      ),
    );
    
    // Refresh dashboard
    dashboardNotifier.refresh();
  }

  /// Handle attendance updated event
  void _handleAttendanceUpdated(dynamic data) {
    AppLogger.info('📢 Attendance updated event received: $data');
    
    // Show notification
    notificationNotifier.addNotification(
      AppNotification(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: 'Attendance Updated',
        message: 'An attendance record has been modified',
        type: NotificationType.info,
        timestamp: DateTime.now(),
        data: data as Map<String, dynamic>?,
      ),
    );
    
    // Refresh dashboard
    dashboardNotifier.refresh();
  }

  /// Handle session created event
  void _handleSessionCreated(dynamic data) {
    AppLogger.info('📢 Session created event received: $data');
    
    // Show notification
    notificationNotifier.addNotification(
      AppNotification(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: 'New Session Created',
        message: 'A new attendance session has been created',
        type: NotificationType.success,
        timestamp: DateTime.now(),
        data: data as Map<String, dynamic>?,
      ),
    );
    
    // Refresh dashboard
    dashboardNotifier.refresh();
  }
}

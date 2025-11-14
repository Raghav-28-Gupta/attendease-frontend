import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/services/socket_service.dart';
import '../../../../../core/config/socket_config.dart';
import '../../../../../core/utils/logger.dart';
import '../../../../../core/providers/notification_provider.dart';
import '../../../../../core/models/app_notification.dart';
import './dashboard_provider.dart';

// Student socket events provider
final studentSocketProvider = Provider<StudentSocketNotifier>((ref) {
  final socketService = ref.watch(socketServiceProvider);
  final dashboardNotifier = ref.read(studentDashboardProvider.notifier);
  final notificationNotifier = ref.read(notificationsProvider.notifier);
  
  return StudentSocketNotifier(
    socketService: socketService,
    dashboardNotifier: dashboardNotifier,
    notificationNotifier: notificationNotifier,
  );
});

class StudentSocketNotifier {
  final SocketService socketService;
  final StudentDashboardNotifier dashboardNotifier;
  final NotificationNotifier notificationNotifier;


  StudentSocketNotifier({
    required this.socketService,
    required this.dashboardNotifier,
    required this.notificationNotifier,
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
    AppLogger.info('📢 Student: Attendance marked event received');
    
    // Show notification
    notificationNotifier.addNotification(
      AppNotification(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: 'Attendance Updated',
        message: 'Your attendance has been marked for today\'s class',
        type: NotificationType.info,
        timestamp: DateTime.now(),
        data: data as Map<String, dynamic>?,
      ),
    );
    
    // Refresh dashboard
    dashboardNotifier.refresh();
  }

  /// Handle low attendance alert
  void _handleLowAttendanceAlert(dynamic data) {
    AppLogger.info('📢 Student: Low attendance alert received: $data');
    
    final message = data is Map 
        ? data['message'] as String? ?? 'Your attendance is below required percentage'
        : 'Your attendance is below required percentage';
    
    // Show warning notification
    notificationNotifier.addNotification(
      AppNotification(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: '⚠️ Low Attendance Alert',
        message: message,
        type: NotificationType.warning,
        timestamp: DateTime.now(),
        data: data as Map<String, dynamic>?,
      ),
    );
    
    // Refresh dashboard
    dashboardNotifier.refresh();
  }
}

class SocketConfig {
  static const String socketUrl = 'http://10.0.2.2:5000'; // Android emulator
  // For iOS simulator: http://localhost:5000
  // For physical device: http://YOUR_IP:5000
  
  static const int reconnectionAttempts = 5;
  static const int reconnectionDelay = 1000; // milliseconds
  static const int timeout = 10000; // 10 seconds
  
  // Socket Events
  static const String eventConnect = 'connect';
  static const String eventDisconnect = 'disconnect';
  static const String eventConnectError = 'connect_error';
  static const String eventConnectTimeout = 'connect_timeout';
  
  // Custom Events
  static const String eventJoinRoom = 'join-room';
  static const String eventLeaveRoom = 'leave-room';
  static const String eventAttendanceMarked = 'attendance-marked';
  static const String eventAttendanceUpdated = 'attendance-updated';
  static const String eventSessionCreated = 'session-created';
  static const String eventLowAttendanceAlert = 'low-attendance-alert';
}

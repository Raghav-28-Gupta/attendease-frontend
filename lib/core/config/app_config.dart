class AppConfig {
  // API Configuration
  static const String baseUrl = 'http://192.168.1.8:5000/api';
  static const String socketUrl = 'http://192.168.1.8:5000';
  
  // Timeouts
  static const int connectTimeout = 45000; // 30 seconds
  static const int receiveTimeout = 45000;
  
  // Storage Keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
  static const String fcmTokenKey = 'fcm_token';
  
  // App Info
  static const String appName = 'AttendEase';
  static const String appVersion = '1.0.0';
  
  // Pagination
  static const int defaultPageSize = 20;
  
  // Cache Duration
  static const Duration cacheDuration = Duration(minutes: 5);
}

class AppConfig {
  // API Configuration
  static const String baseUrl = 'https://attendease-backend-e27g.onrender.com/api';
  static const String socketUrl = 'https://attendease-backend-e27g.onrender.com';
  
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

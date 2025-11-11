class AppConstants {
  // App Info
  static const String appName = 'AttendEase';
  static const String appVersion = '1.0.0';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Attendance Thresholds
  static const double minimumAttendance = 75.0;
  static const double warningThreshold = 74.9;
  static const double criticalThreshold = 64.9;

  // Time Formats
  static const String dateFormat = 'dd MMM yyyy';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'dd MMM yyyy, HH:mm';

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // Debounce Duration
  static const Duration debounceDuration = Duration(milliseconds: 500);
}

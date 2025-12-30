class ApiEndpoints {
  // Base
  static const String baseUrl = 'http://192.168.1.8:5000/api';
  // static const String baseUrl = 'http://10.0.2.2:5000/api'; // Android emulator
  // For iOS simulator use: http://localhost:5000/api
  // For physical device use: http://YOUR_IP:5000/api

  // Auth
  static const String login = '/auth/login';
  static const String signup = '/auth/signup';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh-token';
  static const String changePassword = '/auth/change-password';
  static const String verifyEmail = '/auth/verify-email';

  // Teacher - Dashboard
  static const String teacherDashboard = '/dashboard/teacher';

  // Teacher - Subjects
  static const String subjects = '/subjects';
  static String subjectById(String id) => '/subjects/$id';
  static const String mySubjects = '/subjects/my-subjects';

  // Teacher - Enrollments
  static const String enrollments = '/enrollments';
  static const String myEnrollments = '/enrollments'; // (alias for clarity)
  static String enrollmentById(String id) => '/enrollments/$id';
  static String subjectEnrollments(String subjectId) =>
      '/enrollments/subjects/$subjectId';
  static String batchSubjects(String batchId) =>
      '/enrollments/batches/$batchId/subjects';
  static String enrollmentStudents(String enrollmentId) =>
      '/enrollments/$enrollmentId/students';

  // Teacher - Batches
  static const String batches = '/batches';
  static String batchById(String id) => '/batches/$id';
  static String batchStudents(String id) => '/batches/$id/students';
  static String importStudents(String batchId) =>
      '/batches/$batchId/students/import';

  // Teacher - Students
  static String studentById(String id) => '/students/$id';

  // Teacher - Attendance
  static const String attendanceSessions = '/attendance/sessions';
  static String sessionById(String id) => '/attendance/sessions/$id';
  static String sessionStudents(String id) =>
      '/attendance/sessions/$id/students';
  static const String markAttendance = '/attendance/mark';
  static String updateRecord(String recordId) =>
      '/attendance/records/$recordId';
  static const String teacherSessions = '/attendance/sessions';
  static String enrollmentSessions(String id) =>
      '/attendance/enrollments/$id/sessions';
  static String enrollmentSummary(String id) =>
      '/attendance/enrollments/$id/summary';

  // Teacher - Timetable
  static const String timetable = '/timetable';
  static const String teacherTimetable = '/timetable/teacher';
  static String timetableEntry(String id) => '/timetable/$id';
  static String batchTimetable(String batchId) => '/batches/$batchId/timetable';
  static String bulkTimetable(String batchId) =>
      '/batches/$batchId/timetable/bulk';
  static String enrollmentTimetable(String enrollmentId) =>
      '/timetable/enrollments/$enrollmentId';

  // Student - Dashboard
  static const String studentDashboard = '/dashboard/student';

  // Student - Profile
  static const String myProfile = '/students/me';
  static const String myBatch = '/students/me/batch';
  static const String myTimetable = '/students/me/timetable';
  static const String todayClasses = '/students/me/today';
  static String subjectAttendance(String subjectCode) =>
      '/attendance/subjects/$subjectCode/my-attendance';

  // Student - Attendance
  static String studentStats(String studentId) =>
      '/attendance/students/$studentId/stats';

  // Notifications
  static const String registerFCM = '/notifications/fcm/register';
  static const String unregisterFCM = '/notifications/fcm/unregister';
  static const String testNotification = '/notifications/test';

  // Teacher Notifications
  static const String registerTeacherFCM =
      '/notifications/fcm/teacher/register';
  static const String teacherTodayClasses =
      '/notifications/teacher/today-classes';
  static const String testTeacherNotification = '/notifications/teacher/test';
}

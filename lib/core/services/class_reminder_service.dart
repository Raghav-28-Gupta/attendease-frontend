import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;
import '../storage/secure_storage.dart';
import '../config/app_config.dart';
import '../network/api_endpoints.dart';
import '../utils/logger.dart';

final classReminderServiceProvider = Provider<ClassReminderService>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return ClassReminderService(secureStorage);
});

/// Service for scheduling class reminder notifications for teachers
class ClassReminderService {
  final SecureStorage _secureStorage;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static const String _classReminderChannelId = 'class_reminder_channel';
  static const String _classReminderChannelName = 'Class Reminders';
  static const int _reminderMinutesBefore = 5;

  ClassReminderService(this._secureStorage);

  /// Initialize the reminder service
  Future<void> initialize() async {
    try {
      // Initialize timezone data
      tz_data.initializeTimeZones();

      // Set local timezone (India Standard Time)
      tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));

      // Initialize local notifications
      const androidSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const iosSettings = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );

      const settings = InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      );

      await _localNotifications.initialize(
        settings,
        onDidReceiveNotificationResponse: _onNotificationTapped,
      );

      // Create notification channel for Android
      const androidChannel = AndroidNotificationChannel(
        _classReminderChannelId,
        _classReminderChannelName,
        description: 'Reminders before class starts',
        importance: Importance.high,
      );

      await _localNotifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(androidChannel);

      AppLogger.info('✅ Class Reminder Service initialized');
    } catch (e) {
      AppLogger.error('❌ Failed to initialize Class Reminder Service', e);
    }
  }

  /// Schedule reminders for today's classes
  Future<int> scheduleRemindersForToday() async {
    try {
      final accessToken = await _secureStorage.read(AppConfig.accessTokenKey);
      if (accessToken == null || accessToken.isEmpty) {
        AppLogger.warning('⚠️ Not authenticated - skipping class reminders');
        return 0;
      }

      // Cancel any existing reminders first
      await cancelAllReminders();

      // Fetch today's classes from backend
      final classes = await _fetchTodayClasses(accessToken);

      if (classes.isEmpty) {
        AppLogger.info('📚 No classes scheduled for today');
        return 0;
      }

      int scheduledCount = 0;
      final now = DateTime.now();

      for (final classInfo in classes) {
        // Skip if session already exists
        if (classInfo['hasExistingSession'] == true) {
          AppLogger.info(
              '⏭️ Skipping ${classInfo['subjectCode']} - session already exists');
          continue;
        }

        // Parse start time
        final startTimeStr = classInfo['startTime'] as String;
        final timeParts = startTimeStr.split(':');
        final classTime = DateTime(
          now.year,
          now.month,
          now.day,
          int.parse(timeParts[0]),
          int.parse(timeParts[1]),
        );

        // Calculate reminder time (5 minutes before)
        final reminderTime = classTime.subtract(
          const Duration(minutes: _reminderMinutesBefore),
        );

        // Only schedule if reminder time is in the future
        if (reminderTime.isAfter(now)) {
          await _scheduleNotification(
            id: scheduledCount,
            scheduledTime: reminderTime,
            classInfo: classInfo,
          );
          scheduledCount++;
          AppLogger.info(
              '⏰ Scheduled reminder for ${classInfo['subjectCode']} at ${reminderTime.hour}:${reminderTime.minute}');
        } else {
          AppLogger.info(
              '⏭️ Skipping ${classInfo['subjectCode']} - class already started or reminder time passed');
        }
      }

      AppLogger.info('✅ Scheduled $scheduledCount class reminders for today');
      return scheduledCount;
    } catch (e) {
      AppLogger.error('❌ Failed to schedule class reminders', e);
      return 0;
    }
  }

  /// Fetch today's classes from backend
  Future<List<Map<String, dynamic>>> _fetchTodayClasses(
      String accessToken) async {
    try {
      final dio = Dio(BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
      ));

      final response = await dio.get(ApiEndpoints.teacherTodayClasses);

      if (response.statusCode == 200 && response.data['success'] == true) {
        final classes = response.data['classes'] as List<dynamic>?;
        return classes?.map((c) => c as Map<String, dynamic>).toList() ?? [];
      }

      return [];
    } on DioException catch (e) {
      AppLogger.error('❌ Failed to fetch today\'s classes: ${e.message}', e);
      return [];
    }
  }

  /// Schedule a local notification
  Future<void> _scheduleNotification({
    required int id,
    required DateTime scheduledTime,
    required Map<String, dynamic> classInfo,
  }) async {
    final subjectCode = classInfo['subjectCode'] as String;
    final subjectName = classInfo['subjectName'] as String;
    final batchCode = classInfo['batchCode'] as String;
    final startTime = classInfo['startTime'] as String;
    final enrollmentId = classInfo['enrollmentId'] as String;

    const androidDetails = AndroidNotificationDetails(
      _classReminderChannelId,
      _classReminderChannelName,
      channelDescription: 'Reminders before class starts',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
      enableVibration: true,
      playSound: true,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // Create payload for deep linking
    final payload =
        'CREATE_SESSION|$enrollmentId|$subjectCode|$subjectName|$batchCode|$startTime';

    // Convert to TZDateTime
    final tzScheduledTime = tz.TZDateTime.from(scheduledTime, tz.local);

    await _localNotifications.zonedSchedule(
      id,
      '📚 Class Reminder: $subjectCode',
      '$subjectName for $batchCode starts at $startTime. Don\'t forget to take attendance!',
      tzScheduledTime,
      details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: payload,
    );
  }

  /// Handle notification tap
  void _onNotificationTapped(NotificationResponse response) {
    AppLogger.info('👆 Class reminder tapped: ${response.payload}');

    if (response.payload != null &&
        response.payload!.startsWith('CREATE_SESSION')) {
      final parts = response.payload!.split('|');
      if (parts.length >= 6) {
        final enrollmentId = parts[1];
        final subjectCode = parts[2];
        final subjectName = parts[3];
        final batchCode = parts[4];
        final startTime = parts[5];

        // Store navigation intent for deep linking
        _storeNavigationIntent(
          enrollmentId: enrollmentId,
          subjectCode: subjectCode,
          subjectName: subjectName,
          batchCode: batchCode,
          startTime: startTime,
        );
      }
    }
  }

  /// Store navigation intent for deep linking when app opens
  Future<void> _storeNavigationIntent({
    required String enrollmentId,
    required String subjectCode,
    required String subjectName,
    required String batchCode,
    required String startTime,
  }) async {
    // Store the intent in secure storage for the app to pick up
    await _secureStorage.write(
      'pending_navigation',
      'CREATE_SESSION|$enrollmentId|$subjectCode|$subjectName|$batchCode|$startTime',
    );
    AppLogger.info('📍 Navigation intent stored for Create Session');
  }

  /// Check and clear pending navigation intent
  Future<Map<String, String>?> checkPendingNavigation() async {
    try {
      final pending = await _secureStorage.read('pending_navigation');
      if (pending != null && pending.startsWith('CREATE_SESSION')) {
        // Clear the intent
        await _secureStorage.delete('pending_navigation');

        final parts = pending.split('|');
        if (parts.length >= 6) {
          return {
            'action': 'CREATE_SESSION',
            'enrollmentId': parts[1],
            'subjectCode': parts[2],
            'subjectName': parts[3],
            'batchCode': parts[4],
            'startTime': parts[5],
          };
        }
      }
    } catch (e) {
      AppLogger.error('❌ Error checking pending navigation', e);
    }
    return null;
  }

  /// Cancel all scheduled reminders
  Future<void> cancelAllReminders() async {
    await _localNotifications.cancelAll();
    AppLogger.info('🗑️ All class reminders cancelled');
  }
}

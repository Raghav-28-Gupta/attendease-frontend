import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../storage/secure_storage.dart';
import '../config/app_config.dart';
import '../network/api_endpoints.dart';
import '../utils/logger.dart';

// Background message handler (must be top-level function)
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  AppLogger.info('🔔 Background message: ${message.notification?.title}');
}

final firebaseServiceProvider = Provider<FirebaseService>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return FirebaseService(secureStorage);
});

class FirebaseService {
  final SecureStorage _secureStorage;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  FirebaseService(this._secureStorage);

  /// Initialize Firebase Messaging (Firebase.initializeApp() already called in main.dart)
  Future<void> initialize() async {
    try {
      // ✅ REMOVED: Firebase.initializeApp() - already called in main.dart

      // Request permission
      final settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        AppLogger.info('✅ Notification permission granted');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        AppLogger.info('⚠️ Notification permission granted provisionally');
      } else {
        AppLogger.warning('❌ Notification permission denied');
        return; // ✅ Exit early if no permission
      }

      // Initialize local notifications
      await _initializeLocalNotifications();

      // Get FCM token
      await _getFCMToken();

      // Setup message handlers
      _setupMessageHandlers();

      AppLogger.info('✅ Firebase Messaging initialized');
    } catch (e) {
      AppLogger.error('❌ Firebase Messaging initialization error', e);
      // Don't rethrow - app should work without notifications
    }
  }

  /// Initialize local notifications
  Future<void> _initializeLocalNotifications() async {
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
      'attendease_channel',
      'AttendEase Notifications',
      description: 'Notifications for attendance updates',
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);

    AppLogger.info('✅ Local notifications initialized');
  }

  /// Get FCM token and register with backend
  Future<void> _getFCMToken() async {
    try {
      final token = await _messaging.getToken();
      if (token != null) {
        AppLogger.info('📱 FCM Token: ${token.substring(0, 20)}...');

        // Save token locally
        await _secureStorage.write(AppConfig.fcmTokenKey, token);

        // ✅ Only register if user is authenticated
        final accessToken = await _secureStorage.read(AppConfig.accessTokenKey);
        if (accessToken != null && accessToken.isNotEmpty) {
          await _registerTokenWithBackend(token, accessToken);
        } else {
          AppLogger.warning(
              '⚠️ User not authenticated - skipping FCM registration');
        }

        // Listen for token refresh
        _messaging.onTokenRefresh.listen((newToken) async {
          AppLogger.info('🔄 FCM Token refreshed');
          await _secureStorage.write(AppConfig.fcmTokenKey, newToken);
          final token = await _secureStorage.read(AppConfig.accessTokenKey);
          if (token != null) {
            _registerTokenWithBackend(newToken, token);
          }
        });
      }
    } catch (e) {
      AppLogger.error('❌ Error getting FCM token', e);
    }
  }

  /// Register FCM token with backend
  Future<void> _registerTokenWithBackend(
      String token, String accessToken) async {
    try {
      final dio = Dio(BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
        validateStatus: (status) {
          // ✅ Accept 200-299 and 404 (endpoint might not exist yet)
          return status != null &&
              (status >= 200 && status < 300 || status == 404);
        },
      ));

      final response = await dio.post(
        ApiEndpoints.registerFCM,
        data: {'token': token},
      );

      if (response.statusCode == 404) {
        AppLogger.warning(
            '⚠️ FCM registration endpoint not found - continuing without notifications');
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogger.info('✅ FCM token registered with backend');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        AppLogger.warning(
            '⚠️ FCM registration forbidden - user may not have permission');
      } else if (e.response?.statusCode == 404) {
        AppLogger.warning('⚠️ FCM registration endpoint not found');
      } else {
        AppLogger.error(
            '❌ Failed to register FCM token: ${e.response?.statusCode}', e);
      }
      // ✅ Don't throw - app should work without FCM
    } catch (e) {
      AppLogger.error('❌ Failed to register FCM token', e);
    }
  }

  /// Register FCM token for teacher with backend
  Future<void> registerTeacherFCMToken() async {
    try {
      final token = await _secureStorage.read(AppConfig.fcmTokenKey);
      final accessToken = await _secureStorage.read(AppConfig.accessTokenKey);

      if (token == null || accessToken == null) {
        AppLogger.warning(
            '⚠️ Missing token or access token for teacher FCM registration');
        return;
      }

      final dio = Dio(BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
        validateStatus: (status) {
          return status != null &&
              (status >= 200 && status < 300 || status == 404);
        },
      ));

      final response = await dio.post(
        ApiEndpoints.registerTeacherFCM,
        data: {'token': token},
      );

      if (response.statusCode == 404) {
        AppLogger.warning('⚠️ Teacher FCM registration endpoint not found');
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        AppLogger.info('✅ Teacher FCM token registered with backend');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        AppLogger.warning('⚠️ Teacher FCM registration forbidden');
      } else {
        AppLogger.error(
            '❌ Failed to register teacher FCM token: ${e.response?.statusCode}',
            e);
      }
    } catch (e) {
      AppLogger.error('❌ Failed to register teacher FCM token', e);
    }
  }

  /// Setup message handlers
  void _setupMessageHandlers() {
    // Foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Background messages
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

    // Check initial message
    _checkInitialMessage();
  }

  /// Handle foreground message
  void _handleForegroundMessage(RemoteMessage message) {
    AppLogger.info('🔔 Foreground message: ${message.notification?.title}');

    final notification = message.notification;
    if (notification != null) {
      _showLocalNotification(
        title: notification.title ?? 'AttendEase',
        body: notification.body ?? '',
        payload: message.data.toString(),
      );
    }
  }

  /// Handle message opened app
  void _handleMessageOpenedApp(RemoteMessage message) {
    AppLogger.info('👆 Notification tapped: ${message.notification?.title}');
    _handleNotificationAction(message.data);
  }

  /// Check initial message
  Future<void> _checkInitialMessage() async {
    final message = await _messaging.getInitialMessage();
    if (message != null) {
      AppLogger.info('📬 Initial message: ${message.notification?.title}');
      _handleNotificationAction(message.data);
    }
  }

  /// Show local notification
  Future<void> _showLocalNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'attendease_channel',
      'AttendEase Notifications',
      channelDescription: 'Notifications for attendance updates',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
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

    await _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      details,
      payload: payload,
    );
  }

  /// Handle notification tap
  void _onNotificationTapped(NotificationResponse response) {
    AppLogger.info('👆 Local notification tapped: ${response.payload}');
  }

  /// Handle notification action
  void _handleNotificationAction(Map<String, dynamic> data) {
    AppLogger.info('🎯 Handling notification action: $data');

    final type = data['type'] as String?;

    switch (type) {
      case 'attendance_marked':
        // Navigate to attendance screen
        break;
      case 'session_started':
        // Navigate to session details
        break;
      default:
        AppLogger.info('Unknown notification type: $type');
    }
  }

  /// Delete FCM token on logout
  Future<void> deleteToken() async {
    try {
      await _messaging.deleteToken();
      await _secureStorage.delete(AppConfig.fcmTokenKey);
      AppLogger.info('🗑️ FCM token deleted');
    } catch (e) {
      AppLogger.error('❌ Failed to delete FCM token', e);
    }
  }
}

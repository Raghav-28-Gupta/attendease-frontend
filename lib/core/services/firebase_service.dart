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

  /// Initialize Firebase and notifications
  Future<void> initialize() async {
    try {
      // Initialize Firebase
      await Firebase.initializeApp();
      AppLogger.info('✅ Firebase initialized');

      // Request permission
      await _requestPermission();

      // Initialize local notifications
      await _initializeLocalNotifications();

      // Get FCM token
      await _getFCMToken();

      // Setup message handlers
      _setupMessageHandlers();

      AppLogger.info('✅ Firebase service initialized');
    } catch (e) {
      AppLogger.error('❌ Firebase initialization error', e);
    }
  }

  /// Request notification permission
  Future<void> _requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      AppLogger.info('✅ Notification permission granted');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      AppLogger.info('⚠️ Notification permission granted provisionally');
    } else {
      AppLogger.warning('❌ Notification permission denied');
    }
  }

  /// Initialize local notifications
  Future<void> _initializeLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
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
      'attendance_channel',
      'Attendance Notifications',
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
        AppLogger.info('📱 FCM Token: $token');
        
        // Save token locally
        await _secureStorage.write(AppConfig.fcmTokenKey, token);
        
        // Register token with backend
        await _registerTokenWithBackend(token);
      }

      // Listen for token refresh
      _messaging.onTokenRefresh.listen((newToken) {
        AppLogger.info('🔄 FCM Token refreshed: $newToken');
        _secureStorage.write(AppConfig.fcmTokenKey, newToken);
        _registerTokenWithBackend(newToken);
      });
    } catch (e) {
      AppLogger.error('❌ Error getting FCM token', e);
    }
  }

  /// Register FCM token with backend
  Future<void> _registerTokenWithBackend(String token) async {
    try {
      final accessToken = await _secureStorage.read(AppConfig.accessTokenKey);
      if (accessToken == null) return;

      final dio = Dio(BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
      ));

      await dio.post(
        ApiEndpoints.registerFCM,
        data: {'token': token},
      );

      AppLogger.info('✅ FCM token registered with backend');
    } catch (e) {
      AppLogger.error('❌ Failed to register FCM token', e);
    }
  }

  /// Setup message handlers
  void _setupMessageHandlers() {
    // Foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Background messages (when app is in background but not terminated)
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

    // Terminated state (when app is completely closed)
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

  /// Check initial message (app opened from terminated state)
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
      'attendance_channel',
      'Attendance Notifications',
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
    // Handle navigation based on payload
  }

  /// Handle notification action
  void _handleNotificationAction(Map<String, dynamic> data) {
    AppLogger.info('🎯 Handling notification action: $data');
    
    final type = data['type'] as String?;
    
    switch (type) {
      case 'attendance_marked':
        // Navigate to attendance screen
        break;
      case 'low_attendance':
        // Navigate to subject details
        break;
      case 'session_created':
        // Navigate to session details
        break;
      default:
        AppLogger.info('Unknown notification type: $type');
    }
  }

  /// Unregister FCM token from backend
  Future<void> unregisterToken() async {
    try {
      final token = await _secureStorage.read(AppConfig.fcmTokenKey);
      if (token == null) return;

      final accessToken = await _secureStorage.read(AppConfig.accessTokenKey);
      if (accessToken == null) return;

      final dio = Dio(BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
      ));

      await dio.post(
        ApiEndpoints.unregisterFCM,
        data: {'token': token},
      );

      await _secureStorage.delete(AppConfig.fcmTokenKey);
      AppLogger.info('✅ FCM token unregistered');
    } catch (e) {
      AppLogger.error('❌ Failed to unregister FCM token', e);
    }
  }
}

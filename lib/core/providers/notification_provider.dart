import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/app_notification.dart';
import '../utils/logger.dart';

// Notifications state provider
final notificationsProvider =
    StateNotifierProvider<NotificationNotifier, List<AppNotification>>((ref) {
  return NotificationNotifier();
});

class NotificationNotifier extends StateNotifier<List<AppNotification>> {
  NotificationNotifier() : super([]);

  /// Add a notification
  void addNotification(AppNotification notification) {
    state = [notification, ...state];
    AppLogger.info('📬 Notification added: ${notification.title}');

    // Auto-dismiss after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      removeNotification(notification.id);
    });
  }

  /// Remove a notification
  void removeNotification(String id) {
    state = state.where((n) => n.id != id).toList();
  }

  /// Mark notification as read
  void markAsRead(String id) {
    state = state.map((n) {
      if (n.id == id) {
        return n.copyWith(isRead: true);
      }
      return n;
    }).toList();
  }

  /// Clear all notifications
  void clearAll() {
    state = [];
  }

  /// Get unread count
  int get unreadCount => state.where((n) => !n.isRead).length;
}

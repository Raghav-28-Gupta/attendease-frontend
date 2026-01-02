import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/app_notification.dart';
import '../providers/notification_provider.dart';
import '../config/theme/app_spacing.dart';

/// M3-styled notification banner overlay.
class NotificationBanner extends ConsumerWidget {
  const NotificationBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationsProvider);

    if (notifications.isEmpty) {
      return const SizedBox.shrink();
    }

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Column(
          children: notifications.take(3).map((notification) {
            return _NotificationCard(notification: notification);
          }).toList(),
        ),
      ),
    );
  }
}

class _NotificationCard extends ConsumerWidget {
  final AppNotification notification;

  const _NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Use M3 container colors based on notification type
    final (bgColor, fgColor) = _getColors(colorScheme, notification);

    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.horizontal,
      onDismissed: (_) {
        ref.read(notificationsProvider.notifier).removeNotification(
              notification.id,
            );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              ref.read(notificationsProvider.notifier).markAsRead(
                    notification.id,
                  );
              _handleNotificationTap(context, notification);
            },
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                children: [
                  Icon(
                    notification.icon,
                    color: fgColor,
                    size: 24,
                  ),
                  const SizedBox(width: AppSpacing.smd),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification.title,
                          style: textTheme.titleSmall?.copyWith(
                            color: fgColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          notification.message,
                          style: textTheme.bodySmall?.copyWith(
                            color: fgColor,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: fgColor, size: 20),
                    onPressed: () {
                      ref
                          .read(notificationsProvider.notifier)
                          .removeNotification(
                            notification.id,
                          );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  (Color, Color) _getColors(
      ColorScheme colorScheme, AppNotification notification) {
    // If notification has a custom color, use it with appropriate contrast
    if (notification.color != null) {
      return (notification.color!, Colors.white);
    }
    // Default to inverse surface (like snackbar)
    return (colorScheme.inverseSurface, colorScheme.onInverseSurface);
  }

  void _handleNotificationTap(
      BuildContext context, AppNotification notification) {
    final data = notification.data;
    if (data == null) return;

    // Add navigation logic based on notification type
  }
}

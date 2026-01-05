import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/socket_provider.dart';
import '../config/theme/app_motion.dart';
import '../config/theme/app_spacing.dart';

/// M3-styled connection status indicator.
class ConnectionStatusWidget extends ConsumerWidget {
  const ConnectionStatusWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socketState = ref.watch(socketStateProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Don't show anything if connected
    if (socketState == SocketConnectionState.connected) {
      return const SizedBox.shrink();
    }

    final (bgColor, fgColor) = _getColors(colorScheme, socketState);

    return AnimatedContainer(
      duration: AppMotion.medium2,
      curve: AppMotion.standard,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.sm,
        horizontal: AppSpacing.md,
      ),
      color: bgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: socketState == SocketConnectionState.connecting
                ? CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(fgColor),
                  )
                : Icon(
                    _getStatusIcon(socketState),
                    color: fgColor,
                    size: 16,
                  ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            _getStatusMessage(socketState),
            style: textTheme.labelMedium?.copyWith(
              color: fgColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  (Color, Color) _getColors(
      ColorScheme colorScheme, SocketConnectionState state) {
    return switch (state) {
      SocketConnectionState.connecting => (
          colorScheme.tertiaryContainer,
          colorScheme.onTertiaryContainer
        ),
      SocketConnectionState.disconnected => (
          colorScheme.surfaceContainerHighest,
          colorScheme.onSurfaceVariant
        ),
      SocketConnectionState.error => (
          colorScheme.errorContainer,
          colorScheme.onErrorContainer
        ),
      SocketConnectionState.connected => (
          colorScheme.primaryContainer,
          colorScheme.onPrimaryContainer
        ),
    };
  }

  IconData _getStatusIcon(SocketConnectionState state) {
    return switch (state) {
      SocketConnectionState.connecting => Icons.sync,
      SocketConnectionState.disconnected => Icons.cloud_off_outlined,
      SocketConnectionState.error => Icons.error_outline,
      SocketConnectionState.connected => Icons.cloud_done_outlined,
    };
  }

  String _getStatusMessage(SocketConnectionState state) {
    return switch (state) {
      SocketConnectionState.connecting => 'Connecting to server...',
      SocketConnectionState.disconnected => 'No connection',
      SocketConnectionState.error => 'Connection error',
      SocketConnectionState.connected => 'Connected',
    };
  }
}

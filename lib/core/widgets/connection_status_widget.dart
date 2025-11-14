import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/theme/app_colors.dart';
import '../providers/socket_provider.dart';

class ConnectionStatusWidget extends ConsumerWidget {
  const ConnectionStatusWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socketState = ref.watch(socketStateProvider);

    // Don't show anything if connected
    if (socketState == SocketConnectionState.connected) {
      return const SizedBox.shrink();
    }
    
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: _getStatusColor(socketState),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: socketState == SocketConnectionState.connecting
                ? const CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Icon(
                    _getStatusIcon(socketState),
                    color: Colors.white,
                    size: 16,
                  ),
          ),
          const SizedBox(width: 8),
          Text(
            _getStatusMessage(socketState),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(SocketConnectionState state) {
    switch (state) {
      case SocketConnectionState.connecting:
        return AppColors.warning;
      case SocketConnectionState.disconnected:
        return AppColors.textSecondary;
      case SocketConnectionState.error:
        return AppColors.error;
      case SocketConnectionState.connected:
        return AppColors.success;
    }
  }

  IconData _getStatusIcon(SocketConnectionState state) {
    switch (state) {
      case SocketConnectionState.connecting:
        return Icons.sync;
      case SocketConnectionState.disconnected:
        return Icons.cloud_off;
      case SocketConnectionState.error:
        return Icons.error;
      case SocketConnectionState.connected:
        return Icons.cloud_done;
    }
  }

  String _getStatusMessage(SocketConnectionState state) {
    switch (state) {
      case SocketConnectionState.connecting:
        return 'Connecting to server...';
      case SocketConnectionState.disconnected:
        return 'No connection';
      case SocketConnectionState.error:
        return 'Connection error';
      case SocketConnectionState.connected:
        return 'Connected';
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/socket_service.dart';
import '../utils/logger.dart';

// Socket connection state
enum SocketConnectionState {
  disconnected,
  connecting,
  connected,
  error,
}

// Socket state provider
final socketStateProvider = StateProvider<SocketConnectionState>((ref) {
  return SocketConnectionState.disconnected;
});

// Initialize socket connection
final initializeSocketProvider = FutureProvider<void>((ref) async {
  final socketService = ref.watch(socketServiceProvider);
  ref.read(socketStateProvider.notifier).state = SocketConnectionState.connecting;

  try {
    await socketService.connect();
    
    // Wait a bit for connection to establish
    await Future.delayed(const Duration(seconds: 1));
    
    if (socketService.isConnected) {
      ref.read(socketStateProvider.notifier).state = SocketConnectionState.connected;
      AppLogger.info('Socket initialized successfully');
    } else {
      ref.read(socketStateProvider.notifier).state = SocketConnectionState.error;
      AppLogger.error('Socket failed to connect');
    }
  } catch (e) {
    ref.read(socketStateProvider.notifier).state = SocketConnectionState.error;
    AppLogger.error('Socket initialization error', e);
  }
});

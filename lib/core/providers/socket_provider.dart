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

// ✅ FIX: Use a separate notifier that doesn't modify state during build
final initializeSocketProvider = FutureProvider.autoDispose<void>((ref) async {
  final socketService = ref.watch(socketServiceProvider);
  
  // ✅ Use Future.microtask to defer state modification
  Future.microtask(() {
    ref.read(socketStateProvider.notifier).state = SocketConnectionState.connecting;
  });

  try {
    await socketService.connect();
    
    // Wait a bit for connection to establish
    await Future.delayed(const Duration(seconds: 1));
    
    if (socketService.isConnected) {
      Future.microtask(() {
        ref.read(socketStateProvider.notifier).state = SocketConnectionState.connected;
      });
      AppLogger.info('✅ Socket initialized successfully');
    } else {
      Future.microtask(() {
        ref.read(socketStateProvider.notifier).state = SocketConnectionState.disconnected;
      });
      AppLogger.warning('⚠️ Socket failed to connect - continuing without real-time updates');
    }
  } catch (e) {
    Future.microtask(() {
      ref.read(socketStateProvider.notifier).state = SocketConnectionState.error;
    });
    AppLogger.error('❌ Socket initialization error', e);
    // Don't rethrow - app should work without socket
  }
});
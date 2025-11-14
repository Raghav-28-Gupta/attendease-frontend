import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/socket_config.dart';
import '../storage/secure_storage.dart';
import '../utils/logger.dart';

final socketServiceProvider = Provider<SocketService>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return SocketService(secureStorage);
});

class SocketService {
  final SecureStorage _secureStorage;
  IO.Socket? _socket;
  bool _isConnected = false;

  SocketService(this._secureStorage);

  bool get isConnected => _isConnected;
  IO.Socket? get socket => _socket;

  /// Initialize socket connection
  Future<void> connect() async {
    if (_socket != null && _isConnected) {
      AppLogger.info('Socket already connected');
      return;
    }

    try {
      // Get auth token
      final token = await _secureStorage.read('access_token');
      if (token == null) {
        AppLogger.error('No auth token found, cannot connect socket');
        return;
      }

      // Initialize socket
      _socket = IO.io(
        SocketConfig.socketUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .setAuth({'token': 'Bearer $token'})
            .setReconnectionAttempts(SocketConfig.reconnectionAttempts)
            .setReconnectionDelay(SocketConfig.reconnectionDelay)
            .setTimeout(SocketConfig.timeout)
            .enableAutoConnect()
            .build(),
      );

      _setupListeners();
      _socket!.connect();

      AppLogger.info('🔌 Socket connecting to ${SocketConfig.socketUrl}');
    } catch (e) {
      AppLogger.error('❌ Socket connection error', e);
    }
  }

  /// Setup socket event listeners
  void _setupListeners() {
    _socket?.on(SocketConfig.eventConnect, (_) {
      _isConnected = true;
      AppLogger.info('✅ Socket connected');
    });

    _socket?.on(SocketConfig.eventDisconnect, (_) {
      _isConnected = false;
      AppLogger.warning('⚠️ Socket disconnected');
    });

    _socket?.on(SocketConfig.eventConnectError, (data) {
      _isConnected = false;
      AppLogger.error('❌ Socket connection error: $data');
    });

    _socket?.on(SocketConfig.eventConnectTimeout, (_) {
      _isConnected = false;
      AppLogger.error('⏱️ Socket connection timeout');
    });
  }

  /// Join a room
  void joinRoom(String roomName) {
    if (!_isConnected || _socket == null) {
      AppLogger.warning('Cannot join room, socket not connected');
      return;
    }

    _socket!.emit(SocketConfig.eventJoinRoom, roomName);
    AppLogger.info('📥 Joined room: $roomName');
  }

  /// Leave a room
  void leaveRoom(String roomName) {
    if (!_isConnected || _socket == null) return;

    _socket!.emit(SocketConfig.eventLeaveRoom, roomName);
    AppLogger.info('📤 Left room: $roomName');
  }

  /// Listen to custom event
  void on(String event, Function(dynamic) callback) {
    _socket?.on(event, callback);
  }

  /// Remove listener
  void off(String event) {
    _socket?.off(event);
  }

  /// Disconnect socket
  void disconnect() {
    if (_socket != null) {
      _socket!.disconnect();
      _socket!.dispose();
      _socket = null;
      _isConnected = false;
      AppLogger.info('🔌 Socket disconnected and disposed');
    }
  }

  /// Reconnect socket
  Future<void> reconnect() async {
    disconnect();
    await Future.delayed(const Duration(seconds: 1));
    await connect();
  }
}

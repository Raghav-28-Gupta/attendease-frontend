import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../config/socket_config.dart';
import '../storage/secure_storage.dart';
import '../network/api_endpoints.dart';
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

  /// Initialize socket connection with token refresh
  Future<void> connect() async {
    if (_socket != null && _isConnected) {
      AppLogger.info('Socket already connected');
      return;
    }

    try {
      // ✅ Get and validate token
      String? token = await _secureStorage.read('access_token');
      
      if (token == null) {
        AppLogger.error('No auth token found, cannot connect socket');
        return;
      }

      // ✅ Check if token is expired and refresh if needed
      token = await _ensureValidToken(token);
      
      if (token == null) {
        AppLogger.error('Failed to get valid token, cannot connect socket');
        return;
      }

      // Initialize socket with fresh token
      _socket = IO.io(
        SocketConfig.socketUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .setAuth({'token': token})
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

  /// ✅ Ensure token is valid, refresh if expired
  Future<String?> _ensureValidToken(String token) async {
    try {
      // Decode JWT to check expiry (basic check without verification)
      final parts = token.split('.');
      if (parts.length != 3) {
        AppLogger.warning('⚠️ Invalid token format');
        return await _refreshToken();
      }

      // Decode payload
      final payload = parts[1];
      final normalized = base64.normalize(payload);
      final decoded = utf8.decode(base64.decode(normalized));
      final Map<String, dynamic> data = json.decode(decoded);

      // Check expiry (exp is in seconds since epoch)
      final exp = data['exp'] as int?;
      if (exp == null) {
        AppLogger.warning('⚠️ Token has no expiry, refreshing');
        return await _refreshToken();
      }

      final expiryTime = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
      final now = DateTime.now();
      
      // If token expires in less than 1 minute, refresh it
      if (expiryTime.isBefore(now.add(const Duration(minutes: 1)))) {
        AppLogger.info('🔄 Token expiring soon, refreshing...');
        return await _refreshToken();
      }

      AppLogger.info('✅ Token is valid');
      return token;
    } catch (e) {
      AppLogger.error('❌ Error checking token validity', e);
      return await _refreshToken();
    }
  }

  /// ✅ Refresh access token
  Future<String?> _refreshToken() async {
    try {
      final refreshToken = await _secureStorage.read('refresh_token');
      
      if (refreshToken == null) {
        AppLogger.error('❌ No refresh token found');
        return null;
      }

      AppLogger.info('🔄 Refreshing access token...');

      final dio = Dio(BaseOptions(
        baseUrl: ApiEndpoints.baseUrl.replaceAll('/api', ''), // Remove /api
      ));

      final response = await dio.post(
        '${ApiEndpoints.baseUrl}/auth/refresh-token',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        final newAccessToken = response.data['accessToken'] as String;
        
        // Save new token
        await _secureStorage.write('access_token', newAccessToken);
        
        AppLogger.info('✅ Token refreshed successfully');
        return newAccessToken;
      } else {
        AppLogger.error('❌ Token refresh failed: ${response.data}');
        return null;
      }
    } catch (e) {
      AppLogger.error('❌ Token refresh error', e);
      return null;
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
      
      // ✅ If token expired error, try to reconnect with new token
      if (data.toString().contains('expired') || 
          data.toString().contains('Invalid token')) {
        AppLogger.info('🔄 Token expired during connection, reconnecting...');
        reconnect();
      }
    });

    _socket?.on(SocketConfig.eventConnectTimeout, (_) {
      _isConnected = false;
      AppLogger.error('❌ Socket connection timeout');
    });

    _socket?.on('error', (data) {
      AppLogger.error('❌ Socket error: $data');
    });
  }

  /// ✅ NEW: Join a socket room
  void joinRoom(String room) {
    if (_isConnected && _socket != null) {
      _socket!.emit(SocketConfig.eventJoinRoom, {'room': room});
      AppLogger.info('🚪 Joining room: $room');
    } else {
      AppLogger.warning('⚠️ Cannot join room $room - socket not connected');
    }
  }

  /// ✅ NEW: Leave a socket room
  void leaveRoom(String room) {
    if (_isConnected && _socket != null) {
      _socket!.emit(SocketConfig.eventLeaveRoom, {'room': room});
      AppLogger.info('🚪 Leaving room: $room');
    } else {
      AppLogger.warning('⚠️ Cannot leave room $room - socket not connected');
    }
  }

  /// Emit event to server
  void emit(String event, dynamic data) {
    if (_isConnected && _socket != null) {
      _socket!.emit(event, data);
      AppLogger.info('📤 Emitted: $event');
    } else {
      AppLogger.warning('⚠️ Cannot emit $event - socket not connected');
    }
  }

  /// Listen to event from server
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

  /// Reconnect socket with fresh token
  Future<void> reconnect() async {
    disconnect();
    await Future.delayed(const Duration(seconds: 2));
    await connect();
  }
}
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/app_config.dart';
import '../storage/secure_storage.dart';
import '../utils/logger.dart';
import 'api_endpoints.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(milliseconds: AppConfig.connectTimeout),
      receiveTimeout: const Duration(milliseconds: AppConfig.receiveTimeout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // Add interceptors
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Add access token to headers
        final token = await ref
            .read(secureStorageProvider)
            .read(AppConfig.accessTokenKey);
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        AppLogger.info('🌐 REQUEST[${options.method}] => ${options.path}');
        AppLogger.info('📦 DATA => ${options.data}');

        return handler.next(options);
      },
      onResponse: (response, handler) {
        AppLogger.info(
          '✅ RESPONSE[${response.statusCode}] => ${response.requestOptions.path}',
        );
        return handler.next(response);
      },
      onError: (error, handler) async {
        AppLogger.error(
          '❌ ERROR[${error.response?.statusCode}] => ${error.requestOptions.path}',
        );
        AppLogger.error('❌ MESSAGE => ${error.message}');

        // Handle 401 Unauthorized (token expired)
        if (error.response?.statusCode == 401) {
          // Try to refresh token
          final refreshed = await _refreshToken(dio, ref);
          if (refreshed) {
            // Retry original request
            return handler.resolve(await _retry(error.requestOptions, dio));
          } else {
            // Logout user
            await ref.read(secureStorageProvider).deleteAll();
            // Navigate to login (handled in auth provider)
          }
        }

        return handler.next(error);
      },
    ),
  );

  // Add logging interceptor in debug mode
  if (AppConfig.baseUrl.contains('localhost')) {
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
    ));
  }

  return dio;
});

// Refresh token logic
Future<bool> _refreshToken(Dio dio, ProviderRef ref) async {
  try {
    final refreshToken = await ref.read(secureStorageProvider).read(AppConfig.refreshTokenKey,);

    if (refreshToken == null) {
      print('❌ No refresh token found');
      return false;
    }

    print('🔄 Attempting token refresh...');

    
    final response = await dio.post(
      ApiEndpoints.refreshToken,
      data: {'refreshToken': refreshToken},
    );

    if (response.statusCode == 200) {
      final newAccessToken = response.data['accessToken'];
      final newRefreshToken = response.data['refreshToken'];

      // Save new tokens
      await ref.read(secureStorageProvider).write(
            AppConfig.accessTokenKey,
            newAccessToken,
          );
      await ref.read(secureStorageProvider).write(
            AppConfig.refreshTokenKey,
            newRefreshToken,
          );

      AppLogger.info('🔄 Token refreshed successfully');
      return true;
    }

    return false;
  } catch (e) {
    AppLogger.error('❌ Token refresh failed: $e');
    return false;
  }
}

// Retry failed request with new token
Future<Response<dynamic>> _retry(
  RequestOptions requestOptions,
  Dio dio,
) async {
  final options = Options(
    method: requestOptions.method,
    headers: requestOptions.headers,
  );

  return dio.request<dynamic>(
    requestOptions.path,
    data: requestOptions.data,
    queryParameters: requestOptions.queryParameters,
    options: options,
  );
}

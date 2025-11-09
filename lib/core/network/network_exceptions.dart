import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';

part 'network_exceptions.freezed.dart';

@freezed
class NetworkException with _$NetworkException {
  const factory NetworkException.requestCancelled() = RequestCancelled;
  const factory NetworkException.unauthorizedRequest() = UnauthorizedRequest;
  const factory NetworkException.badRequest(String message) = BadRequest;
  const factory NetworkException.notFound(String reason) = NotFound;
  const factory NetworkException.methodNotAllowed() = MethodNotAllowed;
  const factory NetworkException.notAcceptable() = NotAcceptable;
  const factory NetworkException.requestTimeout() = RequestTimeout;
  const factory NetworkException.sendTimeout() = SendTimeout;
  const factory NetworkException.conflict() = Conflict;
  const factory NetworkException.internalServerError() = InternalServerError;
  const factory NetworkException.notImplemented() = NotImplemented;
  const factory NetworkException.serviceUnavailable() = ServiceUnavailable;
  const factory NetworkException.noInternetConnection() = NoInternetConnection;
  const factory NetworkException.formatException() = FormatException;
  const factory NetworkException.unableToProcess() = UnableToProcess;
  const factory NetworkException.defaultError(String error) = DefaultError;
  const factory NetworkException.unexpectedError() = UnexpectedError;

  static NetworkException handleResponse(Response? response) {
    final statusCode = response?.statusCode ?? 0;
    switch (statusCode) {
      case 400:
        return NetworkException.badRequest(
          response?.data['message'] ?? 'Bad request',
        );
      case 401:
        return const NetworkException.unauthorizedRequest();
      case 403:
        return const NetworkException.unauthorizedRequest();
      case 404:
        return NetworkException.notFound(
          response?.data['message'] ?? 'Not found',
        );
      case 409:
        return const NetworkException.conflict();
      case 408:
        return const NetworkException.requestTimeout();
      case 500:
        return const NetworkException.internalServerError();
      case 503:
        return const NetworkException.serviceUnavailable();
      default:
        return NetworkException.defaultError(
          response?.data['message'] ?? 'Something went wrong',
        );
    }
  }

  static NetworkException getDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return const NetworkException.requestCancelled();
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException.requestTimeout();
      case DioExceptionType.sendTimeout:
        return const NetworkException.sendTimeout();
      case DioExceptionType.badResponse:
        return NetworkException.handleResponse(error.response);
      case DioExceptionType.unknown:
        if (error.message?.contains('SocketException') ?? false) {
          return const NetworkException.noInternetConnection();
        }
        return const NetworkException.unexpectedError();
      default:
        return const NetworkException.unexpectedError();
    }
  }

  static String getErrorMessage(NetworkException error) {
    return error.when(
      requestCancelled: () => 'Request cancelled',
      unauthorizedRequest: () => 'Unauthorized request. Please login again.',
      badRequest: (message) => message,
      notFound: (reason) => reason,
      methodNotAllowed: () => 'Method not allowed',
      notAcceptable: () => 'Not acceptable',
      requestTimeout: () => 'Connection timeout. Please try again.',
      sendTimeout: () => 'Send timeout. Please try again.',
      conflict: () => 'Conflict occurred',
      internalServerError: () => 'Internal server error',
      notImplemented: () => 'Not implemented',
      serviceUnavailable: () => 'Service unavailable',
      noInternetConnection: () => 'No internet connection',
      formatException: () => 'Format exception',
      unableToProcess: () => 'Unable to process data',
      defaultError: (error) => error,
      unexpectedError: () => 'Unexpected error occurred',
    );
  }
}

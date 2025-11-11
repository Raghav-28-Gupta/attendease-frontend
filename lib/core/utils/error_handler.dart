import 'package:flutter/material.dart';
import '../network/network_exceptions.dart';
import 'snackbar_utils.dart';
import 'logger.dart';

class ErrorHandler {
  static void handleError(
    BuildContext context,
    dynamic error, {
    VoidCallback? onRetry,
  }) {
    String message = 'An unexpected error occurred';

    if (error is NetworkException) {
      message = NetworkException.getErrorMessage(error);
    } else if (error is Exception) {
      message = error.toString().replaceAll('Exception: ', '');
    }

    AppLogger.error('Error: $message', error);

    SnackbarUtils.showError(context, message);
  }

  static String getErrorMessage(dynamic error) {
    if (error is NetworkException) {
      return NetworkException.getErrorMessage(error);
    } else if (error is Exception) {
      return error.toString().replaceAll('Exception: ', '');
    }
    return 'An unexpected error occurred';
  }
}

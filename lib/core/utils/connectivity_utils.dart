import 'package:flutter/material.dart';

class ConnectivityBanner extends StatelessWidget {
  final bool isConnected;

  const ConnectivityBanner({
    super.key,
    required this.isConnected,
  });

  @override
  Widget build(BuildContext context) {
    if (isConnected) return const SizedBox.shrink();

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: colorScheme.error,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off, color: colorScheme.onError, size: 16),
          const SizedBox(width: 8),
          Text(
            'No internet connection',
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onError,
            ),
          ),
        ],
      ),
    );
  }
}

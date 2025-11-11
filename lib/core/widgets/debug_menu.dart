import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/app_config.dart';
import '../utils/logger.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';

class DebugMenu extends ConsumerWidget {
  const DebugMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only show in debug mode
    if (!AppConfig.baseUrl.contains('localhost')) {
      return const SizedBox.shrink();
    }

    return FloatingActionButton(
      mini: true,
      onPressed: () => _showDebugDialog(context, ref),
      child: const Icon(Icons.bug_report),
    );
  }

  void _showDebugDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🐛 Debug Menu'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('API: ${AppConfig.baseUrl}'),
            SizedBox(height: 8),
            Text('Version: ${AppConfig.appVersion}'),
            SizedBox(height: 16),
            Text('Quick Actions:'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              AppLogger.info('Force logout triggered');
              ref.read(authProvider.notifier).logout();
              Navigator.of(context).pop();
            },
            child: const Text('Force Logout'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

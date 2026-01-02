import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/app_config.dart';
import '../utils/logger.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../config/theme/app_spacing.dart';

/// Debug menu widget (only shown in development).
class DebugMenu extends ConsumerWidget {
  const DebugMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only show in debug mode
    if (!AppConfig.baseUrl.contains('localhost')) {
      return const SizedBox.shrink();
    }

    return FloatingActionButton.small(
      heroTag: 'debug_fab',
      onPressed: () => _showDebugDialog(context, ref),
      child: const Icon(Icons.bug_report_outlined),
    );
  }

  void _showDebugDialog(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(
          Icons.bug_report,
          color: colorScheme.tertiary,
        ),
        title: const Text('Debug Menu'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'API: ${AppConfig.baseUrl}',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Version: ${AppConfig.appVersion}',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Quick Actions:',
              style: textTheme.titleSmall,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              AppLogger.info('Force logout triggered');
              ref.read(authProvider.notifier).logout();
              Navigator.of(context).pop();
            },
            child: Text(
              'Force Logout',
              style: TextStyle(color: colorScheme.error),
            ),
          ),
          FilledButton.tonal(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

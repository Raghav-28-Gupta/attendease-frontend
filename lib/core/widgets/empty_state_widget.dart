import 'package:flutter/material.dart';
import '../config/theme/app_spacing.dart';

/// M3-styled empty state widget with large icon and subtle styling.
class EmptyStateWidget extends StatelessWidget {
  final String message;
  final String? subtitle;
  final IconData? icon;
  final Widget? action;
  final String? actionText;
  final VoidCallback? onAction;

  const EmptyStateWidget({
    super.key,
    required this.message,
    this.subtitle,
    this.icon,
    this.action,
    this.actionText,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Large icon with outline color per Phase 4 spec
            Icon(
              icon ?? Icons.inbox_outlined,
              size: 80,
              color: colorScheme.outline,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Main message
            Text(
              message,
              textAlign: TextAlign.center,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),

            // Optional subtitle
            if (subtitle != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.outline,
                ),
              ),
            ],

            // Action button
            if (action != null) ...[
              const SizedBox(height: AppSpacing.lg),
              action!,
            ] else if (actionText != null && onAction != null) ...[
              const SizedBox(height: AppSpacing.lg),
              FilledButton.tonal(
                onPressed: onAction,
                child: Text(actionText!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

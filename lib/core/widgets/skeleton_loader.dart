import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../config/theme/app_spacing.dart';

/// M3-styled skeleton loader with shimmer effect.
class SkeletonLoader extends StatelessWidget {
  final double height;
  final double? width;
  final BorderRadius? borderRadius;

  const SkeletonLoader({
    super.key,
    required this.height,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest,
      highlightColor: colorScheme.surfaceContainerLow,
      child: Container(
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
      ),
    );
  }
}

/// Pre-built card skeleton
class CardSkeleton extends StatelessWidget {
  const CardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonLoader(height: 20, width: 150),
            const SizedBox(height: AppSpacing.sm),
            SkeletonLoader(height: 16, width: 200),
            const SizedBox(height: AppSpacing.smd),
            Row(
              children: [
                SkeletonLoader(height: 32, width: 80),
                const SizedBox(width: AppSpacing.smd),
                SkeletonLoader(height: 32, width: 80),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Pre-built list tile skeleton
class ListTileSkeleton extends StatelessWidget {
  const ListTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SkeletonLoader(
        height: 48,
        width: 48,
        borderRadius: BorderRadius.circular(24),
      ),
      title: SkeletonLoader(height: 16, width: 120),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: AppSpacing.sm),
        child: SkeletonLoader(height: 12, width: 180),
      ),
      trailing: SkeletonLoader(height: 24, width: 60),
    );
  }
}

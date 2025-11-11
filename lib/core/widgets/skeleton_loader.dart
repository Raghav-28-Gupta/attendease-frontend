import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
      ),
    );
  }
}

// Pre-built skeletons
class CardSkeleton extends StatelessWidget {
  const CardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonLoader(height: 20, width: 150),
            SizedBox(height: 8),
            SkeletonLoader(height: 16, width: 200),
            SizedBox(height: 12),
            Row(
              children: [
                SkeletonLoader(height: 32, width: 80),
                SizedBox(width: 12),
                SkeletonLoader(height: 32, width: 80),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileSkeleton extends StatelessWidget {
  const ListTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: SkeletonLoader(
        height: 48,
        width: 48,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      title: SkeletonLoader(height: 16, width: 120),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 8),
        child: SkeletonLoader(height: 12, width: 180),
      ),
      trailing: SkeletonLoader(height: 24, width: 60),
    );
  }
}

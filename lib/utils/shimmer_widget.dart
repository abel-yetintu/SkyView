import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final Color baseColor = Colors.white;
  final Color highlightColor = Colors.grey.shade700;
  final ShapeBorder shapeBorder;

  ShimmerWidget.rectangular({
    super.key,
    required this.height,
    required this.width,
    this.shapeBorder = const RoundedRectangleBorder(),
  });

  ShimmerWidget.circular({
    super.key,
    required this.height,
    required this.width,
  }) : shapeBorder = const CircleBorder();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        height: height,
        width: width,
        decoration: ShapeDecoration(
          color: Colors.grey.shade200.withOpacity(0.2),
          shape: shapeBorder,
        ),
      ),
    );
  }
}

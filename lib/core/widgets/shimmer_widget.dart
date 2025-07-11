import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final bool withRadius;

  final ShapeBorder shapeBorder;

  ShimmerWidget.rectangular({
    super.key,
    required this.height,
    required this.width,
    this.withRadius = true,
  }) : shapeBorder = RoundedRectangleBorder(
          borderRadius:
              withRadius ? BorderRadius.circular(36) : BorderRadius.zero,
        );

  const ShimmerWidget.circular({
    super.key,
    required this.height,
    required this.width,
    this.withRadius = true,
  }) : shapeBorder = const CircleBorder();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[200]!,
      enabled: true,
      // loop: 50,
      period: const Duration(milliseconds: 1000),
      child: Container(
        height: height,
        width: width,
        decoration: ShapeDecoration(
          shape: shapeBorder,
          color: Colors.white,
        ),
      ),
    );
  }
}

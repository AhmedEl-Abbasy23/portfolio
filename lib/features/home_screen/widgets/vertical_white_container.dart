import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class VerticalWhiteDivider extends StatelessWidget {
  const VerticalWhiteDivider({super.key, this.height = 30});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 1,
      color: AppColors.whiteColor,
    );
  }
}
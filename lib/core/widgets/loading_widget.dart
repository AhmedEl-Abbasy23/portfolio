import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:portfolio/exports.dart';

class LoadingWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double? screenWidth;
  final double? screenHeight;

  const LoadingWidget({
    super.key,
    this.width,
    this.height,
    this.screenWidth,
    this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth ?? context.width,
      height: screenHeight ?? context.height,
      child: Center(
        // TODO.
        /*child: LottieBuilder.asset(
          Assets.lottieLoading,
          width: width ?? 130,
          height: height ?? 130,
        ),*/
      ),
    );
  }
}

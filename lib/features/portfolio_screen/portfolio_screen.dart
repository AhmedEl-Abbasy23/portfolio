import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key, this.onScrollDown});

  final VoidCallback? onScrollDown;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 40, top: 20),
            child: Column(
              children: [
                Assets.lottie.developer
                    .lottie(height: 180, fit: BoxFit.fitHeight),
                /*Text(
                  'Portfolio'.toUpperCase(),
                  textAlign: TextAlign.justify,
                  style: AppTextStyles.whiteW400S32PxStyle,
                ),*/
                Text(
                  'Here are few samples of my previous work'.toUpperCase(),
                  textAlign: TextAlign.justify,
                  style: AppTextStyles.whiteW400S18PxStyle,
                ),
                16.ph,
                AppsSliderWidget(),
              ],
            ),
          ),
        ),
        16.ph,
        FadeInUpBig(
          duration: Duration(seconds: 20),
          child: Text(
            'Scroll down to contact me now'.toUpperCase(),
            textAlign: TextAlign.justify,
            style: AppTextStyles.whiteW400S16PxStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ),
        RiveAnimatedIcon(
          riveIcon: RiveIcon.call,
          width: 40,
          height: 50,
          color: AppColors.whiteColor,
          strokeWidth: 2,
          loopAnimation: true,
          onTap: onScrollDown ?? () {},
          onHover: (value) {},
        ),
      ],
    );
  }
}

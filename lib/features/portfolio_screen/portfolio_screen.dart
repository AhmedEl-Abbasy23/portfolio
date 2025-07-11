import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key, this.onScrollDown});

  final void Function()? onScrollDown;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.blackColor,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 40),
              child: Column(
                children: [
                  Text(
                    'MY PROJECTS WILL BE HERE SOON'.toUpperCase(),
                    textAlign: TextAlign.justify,
                    style: AppTextStyles.whiteW400S16PxStyle.copyWith(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ),
          // Scroll down to view my portfolio
          // Scroll Down
          FadeInUpBig(
            duration: Duration(seconds: 12),
            child: Text(
              'Scroll down to contact with me now'.toUpperCase(),
              textAlign: TextAlign.justify,
              style: AppTextStyles.whiteW400S16PxStyle.copyWith(
                fontSize: 12,
              ),
            ),
          ),
      Material(
      color: Colors.transparent,
          child:
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
          ),
        ],
      ),
    );
  }
}

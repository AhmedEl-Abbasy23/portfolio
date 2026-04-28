import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class ScrollWidget extends StatelessWidget {
  const ScrollWidget({super.key, this.onScrollDown});

  final void Function()? onScrollDown;

  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
      duration: Duration(seconds: 15),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Text(
              'SEE MY IMPACT',
              textAlign: TextAlign.center,
              style: AppTextStyles.whiteW400S16PxStyle.copyWith(
                fontSize: 11.fs,
                color: AppColors.whiteColor.withValues(alpha: 0.7),
                letterSpacing: 2,
              ),
            ),
            RiveAnimatedIcon(
              riveIcon: RiveIcon.arrowDown,
              width: 40,
              height: 50,
              color: Colors.lightBlue.withValues(alpha: 0.7),
              strokeWidth: 3,
              loopAnimation: true,
              onTap: onScrollDown ?? () {},
              onHover: (value) {},
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, this.onScrollDown});

  final void Function()? onScrollDown;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (context.height * 0.25).ph,
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Wave Animation
            Assets.lottie.handWave.lottie(height: 230, width: 300),
            TypingText(
              text: 'Welcome to my Portfolio!'.toUpperCase(),
              style: AppTextStyles.whiteW400S32PxStyle,
              milliseconds: 90,
            ),
          ],
        ),
        Spacer(),
        // Scroll Down
        FadeInUp(
          duration: Duration(seconds: 1),
          child: Text(
            'Scroll down to know more about me 😉'.toUpperCase(),
            textAlign: TextAlign.justify,
            style: AppTextStyles.whiteW400S16PxStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ),
        RiveAnimatedIcon(
          riveIcon: RiveIcon.arrowDown,
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

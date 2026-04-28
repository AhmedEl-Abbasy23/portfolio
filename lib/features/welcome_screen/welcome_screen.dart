import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, this.onScrollDown});

  final void Function()? onScrollDown;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (context.height * 0.12).ph,

        // 1) Hand wave animation showing first.
        FadeIn(
          duration: const Duration(milliseconds: 600),
          child: Assets.lottie.handWave2.lottie(
            height: 240,
            width: (Sizes.isMobile(context) || Sizes.isTablet(context))
                ? context.width * 0.6
                : Sizes.isDesktop(context)
                ? context.width * 0.5
                : context.width * 0.35,
          ),
        ),

        // 2) Text appears with a fade-in effect after the hand wave animation.
        FadeIn(
          duration: const Duration(milliseconds: 800),
          child: Column(
            children: [
              Text(
                'I build mobile apps…',
                textAlign: TextAlign.center,
                style: AppTextStyles.whiteW400S32PxStyle,
              ),
              Text(
                'that people actually use',
                textAlign: TextAlign.center,
                style: AppTextStyles.whiteW400S32PxStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.light5PrimaryColor,
                ),
              ),
            ],
          ),
        ),

        16.ph,

        // 3) Description
        FadeInUp(
          duration: const Duration(milliseconds: 1000),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Turning ideas into real, user-friendly apps that delight customers and solve real problems',
              textAlign: TextAlign.center,
              style: AppTextStyles.whiteW400S24PxStyle,
            ),
          ),
        ),

        const Spacer(),

        // 4) Scroll cue with fade-in effect, prompting users to explore the portfolio.
        FadeInUp(
          duration: const Duration(milliseconds: 1500),
          child: Column(
            children: [
              Text(
                'S C R O L L  T O  E X P L O R E  M Y  W O R K',
                textAlign: TextAlign.center,
                style: AppTextStyles.whiteW400S16PxStyle.copyWith(
                  fontSize: 12.fs,
                  color: AppColors.whiteColor.withValues(alpha: 0.7),
                ),
              ),
              RiveAnimatedIcon(
                riveIcon: RiveIcon.arrowDown,
                width: 40,
                height: 50,
                color: AppColors.whiteColor.withValues(alpha: 0.7),
                strokeWidth: 2,
                loopAnimation: true,
                onTap: onScrollDown ?? () {},
                onHover: (value) {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
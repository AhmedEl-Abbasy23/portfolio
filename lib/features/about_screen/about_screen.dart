import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key, this.onScrollDown});

  final void Function()? onScrollDown;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 40),
            child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    (context.width * 0.52).pw,
                    Expanded(
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.transparent,
                            ],
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.dstIn,
                        child: Assets.lottie.achivements.lottie(
                          height: 550,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                ),
                // Achievements
                AchievementsSectionWidget(),
              ],
            ),
          ),
        ),
        // Scroll down to view my portfolio
        // Scroll Down
        FadeInUpBig(
          duration: Duration(seconds: 12),
          child: Text(
            'Scroll down to view my portfolio!'.toUpperCase(),
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

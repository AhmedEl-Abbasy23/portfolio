import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key, required this.onScrollDown});

  final void Function() onScrollDown;

  @override
  Widget build(BuildContext context) {
    final isSmall = Sizes.isTablet(context) || Sizes.isMobile(context);

    return Column(
      children: [
        Sizes.isLargeDesktop(context) ? 40.ph : 20.ph,

        /// TOP IMPACT SECTION
        Expanded(
          flex: isSmall ? 4 : 5,
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: isSmall ? 20 : 40,
              end: isSmall ? 20 : 40,
            ),
            child: isSmall
                ? Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      context.width.pw,
                      _buildAchievementsLottie(
                        context,
                        inTopSection: true,
                      ),
                      PositionedDirectional(
                        start: 0,
                        end: 0,
                        bottom: 0,
                        child: AchievementsSectionWidget(),
                      ),
                    ],
                  )
                : Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          (context.width * 0.52).pw,
                          Expanded(
                            child: _buildAchievementsLottie(context),
                          ),
                        ],
                      ),
                      const AchievementsSectionWidget(),
                    ],
                  ),
          ),
        ),
        16.ph,

        /// STACK TITLE
        FadeInUp(
          duration: const Duration(milliseconds: 1500),
          child: Text(
            'TECH STACK & EXPERTISE',
            style: AppTextStyles.whiteW400S16PxStyle.copyWith(
              color: AppColors.whiteColor.withValues(alpha: 0.65),
              letterSpacing: 2,
            ),
          ),
        ),

        /// SKILLS
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          child: SkillsChipsWidget(),
        ),

        /// FEATURES
        FadeInUp(
          duration: const Duration(milliseconds: 2000),
          child: FeaturesChipsWidget(),
        ),
        16.ph,

        /// CTA
        FadeInUpBig(
          duration: const Duration(milliseconds: 2200),
          child: Column(
            children: [
              Text(
                'EXPLORE REAL PROJECTS',
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
                color: AppColors.whiteColor.withValues(alpha: 0.75),
                strokeWidth: 2,
                loopAnimation: true,
                onTap: onScrollDown ?? () {},
                onHover: (value) {},
              ),
            ],
          ),
        ),

        16.ph,
      ],
    );
  }
}

Widget _buildAchievementsLottie(
  BuildContext context, {
  bool inTopSection = false,
}) {
  return ShaderMask(
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
      height: inTopSection ? 380 : 520,
      fit: BoxFit.fitHeight,
    ),
  );
}

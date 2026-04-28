import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class AchievementsSectionWidget extends StatefulWidget {
  const AchievementsSectionWidget({super.key});

  @override
  State<AchievementsSectionWidget> createState() =>
      _AchievementsSectionWidgetState();
}

class _AchievementsSectionWidgetState extends State<AchievementsSectionWidget> {
  int currentIndex = 0;

  void onAnimationEnd() {
    if (currentIndex < PortfolioData.achievements.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    'Is Large Desktop: ${Sizes.isLargeDesktop(context)}'.logIfDebug();
    'Width: ${MediaQuery.sizeOf(context).width}'.logIfDebug();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: Sizes.isLargeDesktop(context) ? 20 : 0,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        PortfolioData.achievements.length,
        (index) {
          bool isActive = index <= currentIndex;
          return isActive
              ? Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: context.width < 670 ? 0 : index * 24,
                  ),
                  child: Row(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FadeIn(
                        child: SizedBox(
                          height: Sizes.isLargeDesktop(context)
                              ? 40
                              : Sizes.isDesktop(context)
                                  ? 34
                                  : Sizes.isTablet(context)
                                      ? 30
                                      : 26,
                          width: Sizes.isLargeDesktop(context)
                              ? 40
                              : Sizes.isDesktop(context)
                                  ? 34
                                  : Sizes.isTablet(context)
                                      ? 30
                                      : 26,
                          child: PortfolioData.achievementsIcons[index].svg(
                            fit: BoxFit.fitWidth,
                            colorFilter: ColorFilter.mode(
                              Colors.green,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(top: 6),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                PortfolioData.achievements[index],
                                textStyle:
                                    AppTextStyles.whiteW400S18PxStyle.copyWith(
                                  fontSize: 20.fs,
                                ),
                                speed: const Duration(milliseconds: 30),
                              ),
                            ],
                            totalRepeatCount: 1,
                            pause: const Duration(milliseconds: 10),
                            isRepeatingAnimation: false,
                            onFinished:
                                index == currentIndex ? onAnimationEnd : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox.shrink();
        },
      ),
    );
  }
}

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
    if (currentIndex < achievements.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: Sizes.isLargeDesktop(context) ? 8 : 0,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        achievements.length,
        (index) {
          bool isActive = index <= currentIndex;
          return isActive
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: RiveAnimatedIcon(
                        riveIcon: RiveIcon.check,
                        width: 40,
                        height: 50,
                        color: Colors.green,
                        strokeWidth: 3,
                        loopAnimation: true,
                        onTap: () {},
                        onHover: (value) {},
                      ),
                    ),
                    Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(
                                  achievements[index],
                                  textStyle: AppTextStyles.whiteW400S16PxStyle,
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
                  ],
                )
              : SizedBox.shrink();
        },
      ),
    );
  }
}

/*List<String> achievements = [
  'Built +20 mobile apps and 3 responsive websites for diverse industries.',
  'Delivered clean, reliable, and scalable solutions for businesses of all sizes.',
  'Worked closely with teams to transform ideas into successful digital products.',
  'Integrated seamless communication, and notifications for a better user experience.',
];*/

List<String> achievements = [
  'Developed more than 20 mobile applications across various industries.',
  'Built 3 responsive websites for seamless user experience.',
  'Provided clean, reliable, and highly scalable software solutions for businesses of all sizes.',
  'Integrated communication and payment features to boost user satisfaction.',
  'Worked closely with teams to transform ideas into digital products.',
  'Followed best coding practices for maintainable and extensible code.',
  'Optimized app performance for seamless and stable user interaction.',
  'Delivered mobile and web solutions that help businesses stand out and achieve their objectives.'
];



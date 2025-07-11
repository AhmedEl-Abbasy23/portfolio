import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.onScrollDown});

  final void Function()? onScrollDown;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.blackColor,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 40, top: Sizes.isLargeDesktop(context) ? 40 : 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Name & Title
                  Expanded(
                    flex: Sizes.isLargeDesktop(context) ? 3 : 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TypingTwoTexts(
                          text1: "I am\nA H M E D",
                          style1: AppTextStyles.whiteW100S50PxStyle.copyWith(
                            letterSpacing: 1,
                          ),
                          text2: "EL-ABBASY",
                          style2: AppTextStyles.whiteW800S48PxStyle.copyWith(
                            letterSpacing: 3,
                          ),
                        ),
                        8.ph,
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: TypingText(
                                text: 'Software Engineer'.toUpperCase(),
                                style: AppTextStyles.blueW500S30PxStyle,
                                milliseconds: 180,
                              ),
                            ),
                            RiveAnimatedIcon(
                              riveIcon: RiveIcon.device,
                              width: 40,
                              height: 50,
                              color: Colors.lightBlue,
                              strokeWidth: 3,
                              loopAnimation: true,
                              onTap: () {},
                              onHover: (value) {},
                            ),
                          ],
                        ),
                        28.ph,
                        FadeIn(
                          duration: const Duration(seconds: 5),
                          child: RichText(
                            text: TextSpan(
                              style: AppTextStyles.whiteW400S18PxStyle,
                              children: [
                                TextSpan(text: 'Specializing in '),
                                TextSpan(
                                  text: 'mobile apps development using Flutter',
                                  style:
                                      AppTextStyles.whiteW400S18PxStyle.copyWith(
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: aboutMeText,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  12.pw,
                  // My Photo
                  Expanded(
                    flex: Sizes.isLargeDesktop(context) ? 2 : 1,
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
                      child: Assets.images.myPhoto.image(
                        height: Sizes.isLargeDesktop(context) ? 550 : 450,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 40, end: 60, bottom: 20, top: 50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Companies
                DeveloperCompaniesWidget(),
                FadeInUpBig(
                  duration: Duration(seconds: 15),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text(
                          'Scroll down to view more achievements 😎'.toUpperCase(),
                          textAlign: TextAlign.justify,
                          style: AppTextStyles.whiteW400S16PxStyle.copyWith(
                            fontSize: 10,
                          ),
                        ),
                        RiveAnimatedIcon(
                          riveIcon: RiveIcon.arrowDown,
                          width: 40,
                          height: 50,
                          color: Colors.lightBlue,
                          strokeWidth: 3,
                          loopAnimation: true,
                          onTap: () {},
                          onHover: (value) {},
                        )
                      ],
                    ),
                  ),
                ),
                InstructorCompaniesWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final String aboutMeText =
    ''', I have a strong track record of building apps across various industries, delivering user-friendly and efficient solutions.\nI’m looking for a role where I can grow my skills, take on new challenges, and contribute to innovative projects.''';
